package _52_nbateam_controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;

import com.google.gson.Gson;

import _51_battleset_service.BattleSetBeans_Config;
import _52_nbateam_service.NBATeamService;
import _9_52_nbateam_model.NBATeamVO;

@WebServlet("/_5_gambling/NbaTeam_Ajax_Servlet.do")
public class NbaTeam_Ajax_Servlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	private AnnotationConfigWebApplicationContext context;
	private NBATeamService svc;

	@Override
	public void init() throws ServletException
	{
		context = new AnnotationConfigWebApplicationContext();
		context.scan("_52_nbateam_service");
		context.register(BattleSetBeans_Config.class);
		context.refresh();
		svc = (NBATeamService) context.getBean("nbaTeamService");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");

		//===================================================================================================
		//=======================================【隊名查詢→自動完成】======================================
		//===================================================================================================
		if ("autoComplete".equals(action))
		{
			System.out.println("呼叫 【AJAX】 NbaTeam_Ajax_Servlet : autoComplete");
			System.out.println("searchName : " + request.getParameter("searchName"));
			try
			{
				response.setHeader("content-type", "text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();//********************** for Ajax ********************/
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String queryTeamName = request.getParameter("searchName").trim();
				/*************************** 2.開始查詢資料 *******************************************/
//				NBATeamVO team = svc.getByTeamName(queryTeamName);
				List<NBATeamVO> teams = svc.getByTeamNames(queryTeamName);
				for (NBATeamVO vo : teams)
				{
					System.out.println("符合查詢條件的隊伍 ：" + vo.getTeamName());
				}
				/*************************** 3.查詢完成,準備轉交(Send the Success view) ***************/
				Gson gson = new Gson();
				String jlist = gson.toJson(teams);
				System.out.println("gson:  " + jlist);

//				out.println("{\"" + "teamName" + "\" : \"" + (team.getTeamName()) + "\"}"); // JSON
//				JSONArray jlist = new JSONArray(new String[] { "AAA", "BBB", "CCC" });
//				System.out.println(jlist.toString());
				out.println(jlist);
				return;
				/*************************** 其他可能的錯誤處理 ***************************************/
			}
			catch (Exception e)//---處理其他不可預期意外
			{
				RequestDispatcher failureView = request.getRequestDispatcher("自訂錯誤頁面");
				failureView.forward(request, response);
				return;
			}
		}
		//===================================================================================================
		//=======================================【隊名查詢→查先發名單圖片】======================================
		//===================================================================================================
		if ("starting5".equals(action))
		{
			System.out.println("呼叫 【AJAX】 NbaTeam_Ajax_Servlet : starting5");
			System.out.println("searchName : " + request.getParameter("searchName"));
			try
			{
				response.setHeader("content-type", "text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();//********************** for Ajax ********************/
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String queryTeamName = request.getParameter("searchName").trim();
				/*************************** 2.開始查詢資料 *******************************************/
//						NBATeamVO team = svc.getByTeamName(queryTeamName);
				NBATeamVO nbaVO = svc.getByTeamName(queryTeamName);
				/*************************** 3.查詢完成,準備轉交(Send the Success view) ***************/

				String ans = new Gson().toJson(nbaVO);
				System.out.println("gson:  " + ans);

				out.println(ans);
				return;
				/*************************** 其他可能的錯誤處理 ***************************************/
			}
			catch (Exception e)//---處理其他不可預期意外
			{
				RequestDispatcher failureView = request.getRequestDispatcher("自訂錯誤頁面");
				failureView.forward(request, response);
				return;
			}
		}
	}
}
