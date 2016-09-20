package _31_court_controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import _31_court_service.CourtService;

@WebServlet("/_3_view/CourtServlet.do")
public class CourtServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		System.out.println("call the post");
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");

		if ("queryByName".equals(action))// 來自courtQuery.jsp的請求
		{
			System.out.println("call CourtServlet : queryByName");
			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);
			try
			{
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String court = request.getParameter("court");
				if (court == null || (court.trim()).length() == 0)
				{
					errorMsgs.add("請輸入關鍵字");
				}
				if (!errorMsgs.isEmpty())
				{
					RequestDispatcher failureView = request.getRequestDispatcher("/_3_view/courtQuery.jsp");
					failureView.forward(request, response);
					return;
				}
				/*************************** 2.開始查詢資料 *****************************************/
				CourtService courtSvc = new CourtService();
				List<Map<String, Object>> courtVO = courtSvc.getByName(court);
			}
			catch (Exception e)
			{
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = request.getRequestDispatcher("/_3_view/courtQuery.jsp");
				failureView.forward(request, response);
			}
		}
	}
}
