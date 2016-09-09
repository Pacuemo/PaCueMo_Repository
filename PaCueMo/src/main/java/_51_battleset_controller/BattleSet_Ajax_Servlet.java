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
import javax.servlet.http.HttpSession;

import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;

import com.google.gson.Gson;

import _50_gambling_facade.GamblingFacade;
import _50_gambling_facade.GamblingFacade_Config;
import _51_battleset_service.BattleSetService;
import _9_41_member_model.MemberVO;
import _9_51_battleset_model.BattleSetVO;

@WebServlet("/_5_gambling/BattleSet_Ajax_Servlet.do")
public class BattleSet_Ajax_Servlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	private AnnotationConfigWebApplicationContext context;
	private BattleSetService svc;
	private GamblingFacade gamblingFacade;

	@Override
	public void init() throws ServletException
	{
		context = new AnnotationConfigWebApplicationContext();
//		context.scan("_51_battleset_service");
//		context.register(BattleSetBeans_Config.class);
		context.scan("_50_gambling_facade");
		context.register(GamblingFacade_Config.class);
		context.refresh();
		svc = (BattleSetService) context.getBean("bSetService");
		gamblingFacade = (GamblingFacade) context.getBean("gamblingFacade2");// _50_gambling_facade 注入
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

				System.out.println(" 查詢日期： " + queryDate);
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
				System.out.println("pageNo = " + pageNo);
				/*************************** 2.開始查詢資料 ( jQuery + Ajax : return JSON ) **********/
//				BattleSetService svc = new BattleSetService(); // Spring
				List<Map<String, Object>> list = svc.getSetsByDateAndPage(queryDate, pageNo);
				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				// *************************
				// ********【Ajax】*********
				// *************************
				Gson gson = new Gson();
				String ans = gson.toJson(list);
				System.out.println(" 本頁筆數 " + list.size() + " 筆");
				System.out.println(ans);
				out.println(ans);

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
		///

		// ************************************************************************************************
		// **********************************【依輸入 日期&頁碼 查詢】*************************************
		// ************************************************************************************************
		if ("queryCountByDate".equals(action))
		{
			System.out.println("=====\n呼叫 【AJAX】 BattleSet_Ajax_Servlet : queryCountByDate");

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

				System.out.println(" 查詢日期： " + queryDate);

				/*************************** 2.開始查詢資料 ( jQuery + Ajax : return JSON ) **********/
//				BattleSetService svc = new BattleSetService(); // Spring
				Integer count = svc.getCountByDate(queryDate);
				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				// *************************
				// ********【Ajax】*********
				// *************************
				System.out.println(queryDate + " 總筆數： " + count + " 筆");
//				Gson gson = new Gson();
//				String ans = gson.toJson(list);
//				System.out.println(ans);
//				out.println("{\"countByDate\":" + "\"" + count + "\"}"); // json
				out.print(count);
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

		///
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

				System.out.println("tmpList.size()  = " + tmpList.size() + " 筆");
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
		/*******************/
		// ************************************************************************************************
		// **********************【BattleSetId 查詢 場次 及 nbaTeam 物件】*********************************
		// ************************************************************************************************
		if ("queryByBattleSetId".equals(action))
		{
			System.out.println("=====\n呼叫 【AJAX】 BattleSet_Ajax_Servlet : queryByBattleSetId");

			try
			{
				response.setHeader("content-type", "text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();/* for Ajax */

				/********************* 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String battleId = request.getParameter("battleId");
				Integer battleSetId = null;
				try
				{
					battleSetId = Integer.valueOf(battleId);
				}
				catch (NumberFormatException e)
				{
					System.out.println("--- battleId 轉換失敗 ---");
					return;
				}

				System.out.println("battleId === " + battleId);

				/*************************** 2.開始查詢資料 ( jQuery + Ajax : return JSON ) **********/
				Map<String, Object> bSetVO = svc.getOneBattleSetById(battleSetId);
				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				// *************************
				// ********【Ajax】*********
				// *************************
				Gson gson = new Gson();
				String ans = gson.toJson(bSetVO);
				System.out.println(ans);
				out.println(ans);
				return;
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
		/*******************/
		// ************************************************************************************************
		// ***********************【會員﹝下注後更新﹞battleSetVO 、memberVO資料】*************************
		// ************************************************************************************************
		if ("gamblingUpdate".equals(action))
		{
			System.out.println("=====\n呼叫 【AJAX】 BattleSet_Ajax_Servlet : gamblingUpdate");

			try
			{
				response.setHeader("content-type", "text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();/* for Ajax */
//
				/********************* 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String strBattleId = request.getParameter("battleId");
				String strBattleTime = request.getParameter("battleTime");
				String strHomeId = request.getParameter("homeId");// id
				String strAwayId = request.getParameter("awayId");// id
				String strHomeScore = request.getParameter("homeScore");
				String strAwayScore = request.getParameter("awayScore");
				String strHomeBet = request.getParameter("homeBet");
				String strAwayBet = request.getParameter("awayBet");
				String strHomeCoins = request.getParameter("homeCoins"); // 下注金額 
				String strAwayCoins = request.getParameter("awayCoins"); // 下注金額
				System.out.println(strBattleId + "  " + strAwayId + "  " + strHomeId + "  "
						+ strBattleTime + "  " + strAwayScore + "  " + strHomeScore + "  " + strAwayBet + "  " + strHomeBet
						+ "   " + strAwayCoins + "   " + strHomeCoins);
				//--- battleId---
				Integer battleId = null;
				try
				{
					battleId = Integer.valueOf(strBattleId);
				}
				catch (NumberFormatException ex)
				{
					out.print("...battleId 型別轉換失敗...");
					return;
				}
				//--- battleTime--- java.sql.Timestamp
				java.sql.Timestamp battleTime = null;
				try
				{
					battleTime = java.sql.Timestamp.valueOf(strBattleTime);
				}
				catch (IllegalArgumentException ex)
				{
					out.print("...battleTime 型別轉換失敗...");
					return;
				}
				//--- homeId---
				Integer homeId = null;
				try
				{
					homeId = Integer.valueOf(strHomeId);
				}
				catch (NumberFormatException ex)
				{
					out.print("...homeId 型別轉換失敗...");
					return;
				}
				//--- awayId---
				Integer awayId = null;
				try
				{
					awayId = Integer.valueOf(strAwayId);
				}
				catch (NumberFormatException ex)
				{
					out.print("...awayId 型別轉換失敗...");
					return;
				}
				//--- homeScore---
				Integer homeScore = null;
				try
				{
					homeScore = Integer.valueOf(strHomeScore);
				}
				catch (NumberFormatException ex)
				{
					out.print("...homeScore 型別轉換失敗...");
					return;
				}
				//--- awayScore---
				Integer awayScore = null;
				try
				{
					awayScore = Integer.valueOf(strAwayScore);
				}
				catch (NumberFormatException ex)
				{
					out.print("...awayScore 型別轉換失敗...");
					return;
				}
				//--- homeBet--- Double
				Double homeBet = null;
				try
				{
					homeBet = Double.valueOf(strHomeBet);
				}
				catch (NumberFormatException ex)
				{
					out.print("...homeBet 型別轉換失敗...");
					return;
				}
				//--- awayBet--- Double
				Double awayBet = null;
				try
				{
					awayBet = Double.valueOf(strAwayBet);
				}
				catch (NumberFormatException ex)
				{
					out.print("...awayBet 型別轉換失敗...");
					return;
				}
				//--- homeCoins---
				Integer homeCoins = null;
				try
				{
					homeCoins = Integer.valueOf(strHomeCoins);
				}
				catch (NumberFormatException ex)
				{
					out.print("...homeCoins 型別轉換失敗...");
					return;
				}
				//--- awayCoins---
				Integer awayCoins = null;
				try
				{
					awayCoins = Integer.valueOf(strAwayCoins);
				}
				catch (NumberFormatException ex)
				{
					out.print("...awayCoins 型別轉換失敗...");
					return;
				}
				System.out.println(" ============= 轉型後: ============= ");
				System.out.println(battleId + "  " + awayId + "  " + homeId + "  "
						+ battleTime + "  " + awayScore + "  " + homeScore + "  " + awayBet + "  " + homeBet
						+ "   " + awayCoins + "   " + homeCoins + "\n =================");
				/*************************** 2.開始 Update 資料 ( jQuery + Ajax : return text ) **********/
//				BattleSetService svc = new BattleSetService(); // Spring
//				List<Map<String, Object>> list = svc.getSetsByDateAndPage(queryDate, pageNo);

				HttpSession session = request.getSession();
				MemberVO memberVO = (MemberVO) session.getAttribute("LoginOK"); // 登入會員的資料
				Double pocket = memberVO.getMemberPoint();
				if (pocket - (awayCoins + homeCoins) < 0)
				{
					out.println(" 餘額不足，請【儲值】或【減少下注金額】 !!! ");
					return;// 直接返回前頁
				}

				BattleSetVO bSetVO = new BattleSetVO();
				bSetVO.setBattleId(battleId);
				bSetVO.setBattleDateTime(battleTime);
				bSetVO.setHomeId(homeId);
				bSetVO.setAwayId(awayId);
				bSetVO.setHomeScore(homeScore);
				bSetVO.setAwayScore(awayScore);
				bSetVO.setHomebet(homeBet);
				bSetVO.setAwaybet(awayBet);
				gamblingFacade.updateMemberAndBattleSetCoin(bSetVO, memberVO, homeCoins, awayCoins); // facade 類別控制 BattleSet 及 Member 交易
				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
//				// *************************
//				// ********【Ajax】*********
//				// *************************
				out.println(" 回送資料成功!! ");
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
	}

}
