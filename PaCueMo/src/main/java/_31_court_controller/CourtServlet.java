package _31_court_controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import _31_court_service.CourtService;

@WebServlet("/CourtServlet")
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
//		System.out.println("call the post");
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");

		if ("queryByName".equals(action))
		{
//			System.out.println("call CourtServlet : queryName");
			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);
			try
			{
				String queryCourtName = request.getParameter("courtName").trim();
				if (queryCourtName.equals(""))
				{
					errorMsgs.add("請輸入場地");
				}
//				System.out.println("queryCourtName = " + queryCourtName);
//				String funFlag = request.getParameter("funFlag");
				List<Map<String, Object>> list = CourtService.getByName(queryCourtName);
				if (list == null)
				{
					errorMsgs.add("查無場地");
					System.out.println("查無場地");
					request.getRequestDispatcher("/").forward(request, response);//導向頁面
					return;
				}

				int listSize = list.size();
//				request.setAttribute("funFlag", funFlag);
				request.setAttribute("queryCourtName", queryCourtName);
				request.setAttribute("courtList", list);
				request.setAttribute("courtListLength", (listSize % 10 == 0 ? (listSize / 10) : (listSize / 10 + 1)));
				request.getRequestDispatcher("/").forward(request, response);//導向頁面
				return;
			}
			catch (Exception e)
			{
				e.printStackTrace();
				errorMsgs.add(e.getMessage());
				request.getRequestDispatcher("/").forward(request, response);//導向頁面
				return;
			}
		}
	}
}
