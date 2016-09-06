package _51_battleset_controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;

import com.google.gson.Gson;

import _51_battleset_service.BattleSetBeans_Config;
import _51_battleset_service.BattleSetService;

@WebServlet("/_5_gambling/BattleSet_Ajax_Servlet.do")
public class BattleSet_Ajax_Servlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	private AnnotationConfigWebApplicationContext context;
	private BattleSetService svc;

	@Override
	public void init() throws ServletException
	{
		context = new AnnotationConfigWebApplicationContext();
		context.scan("_51_battleset_service");
		context.register(BattleSetBeans_Config.class);
		context.refresh();
		svc = (BattleSetService) context.getBean("bSetService");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		// ************************************************************************************************
		// **********************************【依輸入 日期&頁碼 查詢】*************************************
		// ************************************************************************************************
		if ("queryByDateAndPage".equals(action))
		{
			System.out.println("=====\n呼叫 【AJAX】 BattleSet_Ajax_Servlet : queryByDateAndPage");

			try
			{
				response.setHeader("content-type", "text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();/* for Ajax */

				/********************* 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String queryDate = request.getParameter("datepickerDate");

				if (queryDate == null || queryDate.trim() == "")
				{ /* 若 datepicker 沒有日期→設定日期為今天 */
					java.util.Date today = new java.util.Date(System.currentTimeMillis());
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					queryDate = sdf.format(today);
				}

				System.out.println("ggggggggggg    " + queryDate);
				String strPageNo = request.getParameter("pageNo");
				int pageNo = 0;
				try
				{
					pageNo = Integer.valueOf(strPageNo);
				}
				catch (NumberFormatException e)
				{
					e.printStackTrace();
				}
				/*************************** 2.開始查詢資料 ( jQuery + Ajax : return JSON ) **********/
//				BattleSetService svc = new BattleSetService(); // Spring
				List<Map<String, Object>> list = svc.getSetsByDateAndPage(queryDate, pageNo);
				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				// *************************
				// ********【Ajax】*********
				// *************************
//				System.out.println(list.size() + " 筆");
				Gson gson = new Gson();
				String ans = gson.toJson(list);
				System.out.println(" 本頁筆數 " + list.size() + " 筆");
				System.out.println(ans);
				out.println(ans);
//				out.println(ans.toString());
				/*************************** 其他可能的錯誤處理 *************************************/
			}
			catch (Exception e)//---處理其他不可預期意外
			{
				e.printStackTrace();
				System.out.println(" \n========== BattleSet_Servlet.java 不可預期意外 ========== ");
				RequestDispatcher failureView = request.getRequestDispatcher("xxxxxxxxxx");
				failureView.forward(request, response);
			}

		}
		// ************************************************************************************************
		// **************************************【依輸入隊名查詢】****************************************
		// ************************************************************************************************
		if ("queryByName".equals(action))
		{
			System.out.println("=====\n呼叫 【AJAX】 BattleSet_Ajax_Servlet : queryByName");
			System.out.println("searchName : " + request.getParameter("searchName"));

			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);

			try
			{
				response.setHeader("content-type", "text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();//********************** for Ajax ********************/
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String queryTeamName = request.getParameter("searchName");

				if (queryTeamName.equals(""))// User未輸入時
				{
					System.out.println("====== 請輸入NBA現役隊伍名稱 ======");
					out.println("{ \"errMsg\" : \" ※ 請輸入NBA現役隊伍名稱\"}"); // JSON格式
					return;
				}
				/*************************** 2.開始查詢資料 *****************************************/
				//BattleSetService svc = new BattleSetService();

				List<Map<String, Object>> list = svc.getSetsByName(queryTeamName);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/

				if (list == null)// 查詢不到隊伍時
				{
					System.out.println("====== 查無隊伍 ======");
					out.println("{ \"errMsg\" : \"※ 查無此隊伍，請重新輸入！\"}"); // JSON格式
					return;
				}
				else
				{
//					System.out.println(list);
					System.out.println("查詢總筆數 : " + list.size());
					Gson gson = new Gson();
					String ans = gson.toJson(list);
					System.out.println(ans);
					out.println(ans);
					return;
				}
//
////				for (Map<String, NBATeamVO> mymap : list)
////				{
////					System.out.println(mymap.get("home").getTeamName() + "  vs " + mymap.get("away").getTeamName());
////				}
//				request.setAttribute("queryTeamName", queryTeamName);
//				request.setAttribute("byName_list", list);
//				request.getRequestDispatcher("/_01_Gambling/Gambling.jsp").forward(request, response);
//				return;
				/*************************** 其他可能的錯誤處理 *************************************/
			}
			catch (Exception e)//---處理其他不可預期意外
			{
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = request.getRequestDispatcher("自訂錯誤頁面");
				failureView.forward(request, response);
			}

		}

		// ************************************************************************************************
		// ****************************【依輸入 隊名 & 頁碼 查詢】*****************************************
		// ************************************************************************************************
		if ("queryByNameAndPage".equals(action))
		{
			System.out.println("=====\n呼叫 【AJAX】 BattleSet_Ajax_Servlet : queryByNameAndPage");
			System.out.println("searchName : " + request.getParameter("searchName"));

			List<String> errorMsgs = new LinkedList<String>();

			try
			{
				response.setHeader("content-type", "text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();//********************** for Ajax ********************/
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String queryTeamName = request.getParameter("searchName"); // 搜尋隊伍名稱

				if (queryTeamName.equals(""))// User未輸入時
				{
					System.out.println("====== 請輸入NBA現役隊伍名稱 ======");
					out.println("{ \"errMsg\" : \" ※ 請輸入NBA現役隊伍名稱\"}"); // JSON格式
					return;
				}

				String page = request.getParameter("pageNo"); // 頁碼
				Integer pageNo = null;
				try
				{
					pageNo = Integer.valueOf(page);
				}
				catch (NumberFormatException e)
				{
					e.printStackTrace();
				}
				/*************************** 2.開始查詢資料 *****************************************/
				//BattleSetService svc = new BattleSetService();

//				List<Map<String, Object>> list = svc.getSetsByName(queryTeamName);
				List<Map<String, Object>> tmpList = svc.getSetsByName(queryTeamName);// 查詢總筆數
				List<Map<String, Object>> list = svc.getSetsByNameAndPage(queryTeamName, pageNo);
				System.out.println("tmpList.size()  = " + tmpList.size());
				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/

				if (list == null)// 查詢不到隊伍時
				{
					System.out.println("====== 查無隊伍 ======");
					out.println("{ \"errMsg\" : \"※ 查無此隊伍，請重新輸入！\"}"); // JSON格式
					return;
				}
				else
				{
//					System.out.println(list);
					System.out.println("查詢總筆數 : " + list.size());
					Gson gson = new Gson();
					String ans = gson.toJson(list);
					System.out.println(ans);
					out.println(ans);
					return;
				}

				/*************************** 其他可能的錯誤處理 *************************************/
			}
			catch (Exception e)//---處理其他不可預期意外
			{
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = request.getRequestDispatcher("自訂錯誤頁面");
				failureView.forward(request, response);
			}

		}
	}

}
