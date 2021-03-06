package _31_court_controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
//		List<CourtVO> list = null;

		System.out.println("call CourtServlet : queryByName");
		List<String> errorMsgs = new LinkedList<String>();
		String court = request.getParameter("court");
		String city1 = request.getParameter("city1");
		String dist = request.getParameter("bolcks");
		System.out.println(court);
		System.out.println(city1);
		System.out.println(dist);

		try
		{
			if (city1 == null && dist == null)
			{
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				if (court == null || court.trim().length() == 0)
				{
					errorMsgs.add("請輸入關鍵字");
				}
				if (!errorMsgs.isEmpty())
				{
					request.setAttribute("errorMsgs", errorMsgs);
					RequestDispatcher failureView = request.getRequestDispatcher("/_3_view/courtQuery.jsp");
					failureView.forward(request, response);
					return;
				}
				request.setAttribute("court", court);// 資料庫取出的courtVO物件,存入req
				String url = "/_3_view/courtQuery.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);
				successView.forward(request, response);
				return;
			}
			else if (city1 != null && court.length() == 0 && dist == null)
			{
				System.out.println("test");
				request.setAttribute("court", city1);// 資料庫取出的courtVO物件,存入req
				String url = "/_3_view/courtQuery.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);
				successView.forward(request, response);
				return;
			}
			else if (city1 != null && court.length() == 0 && dist != null)
			{
				System.out.println("dou");
				String address = city1 + dist;
				request.setAttribute("test", address);// 資料庫取出的courtVO物件,存入req
				String url = "/_3_view/courtQuery.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);
				successView.forward(request, response);
				return;
			}
			else if (city1 != null && court.length() != 0 && dist != null)
			{
				System.out.println("tri");
				String address = city1 + dist;
				request.setAttribute("court", court);// 資料庫取出的courtVO物件,存入req
				request.setAttribute("test", address);// 資料庫取出的courtVO物件,存入req
				String url = "/_3_view/courtQuery.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);
				successView.forward(request, response);
				return;
			}
			else if (city1 != null && court.length() != 0 && dist == null)
			{
				System.out.println("tri");
				request.setAttribute("court", court);// 資料庫取出的courtVO物件,存入req
				request.setAttribute("test", city1);// 資料庫取出的courtVO物件,存入req
				String url = "/_3_view/courtQuery.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);
				successView.forward(request, response);
				return;
			}
		}
		/*************************** 其他可能的錯誤處理 *************************************/
		catch (Exception e)
		{
			errorMsgs.add("無法取得資料:" + e.getMessage());
			RequestDispatcher failureView = request.getRequestDispatcher("/_3_view/courtQuery.jsp");
			failureView.forward(request, response);
			return;
		}
	}
}
