package _51_battleset_controller;

import java.io.IOException;
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

import _51_battleset_service.BattleSetBeans_Config;
import _51_battleset_service.BattleSetService;

@WebServlet("/_5_gambling/BattleSet_Servlet.do")
public class BattleSet_Servlet extends HttpServlet
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
//		request.setCharacterEncoding("UTF-8");

//		request.setCharacterEncoding("UTF-8");
//		response.setHeader("content-type", "text/html;charset=UTF-8");
//		PrintWriter out = response.getWriter();
//		out.write("國國國國國國國國");
//		return;
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		//---------------------------------------------------------------------------
//		action = "queryByDate";
		if ("queryByDate".equals(action))
		{
//			System.out.println("Hello");
			System.out.println(" 呼叫 BattleSet_Servlet : queryByDate");
			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);

			try
			{
				response.setHeader("content-type", "text/html;charset=UTF-8");
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String queryDate = request.getParameter("datepicker");

				if (queryDate == null)
				{ /* 若 datepicker 沒有日期→設定日期為今天 */
					java.util.Date today = new java.util.Date(System.currentTimeMillis());
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					queryDate = sdf.format(today);
				}

//				String queryDate = request.getParameter("xxx");
				System.out.println(" 查詢日期 : " + queryDate);
//				queryDate = "2015-11-06";/////////////////////////////////////////////////////////////////////

				if (queryDate == null || queryDate.trim().length() == 0)
				{
					errorMsgs.add("請輸入正確日期");
				}
				/*************************** 2.開始查詢資料 ******************************************/
//				BattleSetService svc = new BattleSetService();
				List<Map<String, Object>> list = svc.getSetsByDate(queryDate);// modify:2016/08/12 增加對戰時間
				int listSize = list.size();
				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				System.out.println(" 共 : " + listSize + " 筆資料");
				request.setAttribute("queryDate", queryDate);
				request.setAttribute("battleSetList", list);
				request.setAttribute("battleSetList_len", (listSize % 3 == 0 ? (listSize / 3) : (listSize / 3 + 1)));// 計算總頁數(每頁3筆情況)
				request.getRequestDispatcher("gamblingPage.jsp").forward(request, response);
				return;
				/*************************** 其他可能的錯誤處理 *************************************/
			}
			catch (Exception e)//---處理其他不可預期意外
			{
				e.printStackTrace();
				System.out.println(" ========== BattleSet_Servlet.java 不可預期意外 ========== ");
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = request.getRequestDispatcher("xxxxxxxxxx");
				failureView.forward(request, response);
			}

		}

		//====================================【依輸入隊名查詢】==========================================

		if ("queryByName".equals(action))
		{
			//System.out.println("呼叫 BattleSet_Servlet : queryByName L35");
			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);
			try
			{
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String queryTeamName = request.getParameter("teamName");

				if (queryTeamName.equals("搜尋隊伍.."))
				{
					errorMsgs.add("※請輸入隊名");
					System.out.println("=== ※請輸入隊名 ===  (BattleSet_Servlet.java L103)");
					request.getRequestDispatcher("/_01_Gambling/Gambling.jsp").forward(request, response);
					return;
				}
				/*************************** 2.開始查詢資料 *****************************************/
				BattleSetService svc = new BattleSetService();

				List<Map<String, Object>> list = svc.getSetsByName(queryTeamName);
				if (list == null)
				{
					errorMsgs.add("※查無此隊伍");
					System.out.println("=== ※查無此隊伍 ===  (BattleSet_Servlet.java L114)");
					request.getRequestDispatcher("/_01_Gambling/Gambling.jsp").forward(request, response);
					return;
				}
				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/

//				for (Map<String, NBATeamVO> mymap : list)
//				{
//					System.out.println(mymap.get("home").getTeamName() + "  vs " + mymap.get("away").getTeamName());
//				}
				request.setAttribute("queryTeamName", queryTeamName);
				request.setAttribute("byName_list", list);
				request.getRequestDispatcher("/_01_Gambling/Gambling.jsp").forward(request, response);
				return;
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
