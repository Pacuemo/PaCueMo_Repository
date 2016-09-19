package _31_court_controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

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

		if ("queryByName".equals(action))
		{
			System.out.println("call CourtServlet : queryByName");
			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);
			try
			{
				response.setHeader("content-type", "text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();

				String queryCourtName = request.getParameter("queryCourtName").trim();

				if (queryCourtName.equals(""))
				{
					System.out.println("請輸入場地名稱");
					out.println("{ \"errMsg\" : \" 請輸入場地名稱\"}"); // JSON格式
					request.getRequestDispatcher("/_3_view/courtQuery.jsp").forward(request, response);
					return;
				}

				List<Map<String, Object>> list = CourtService.getByName(queryCourtName);

				if (list == null)
				{
					System.out.println("查無場地");
					out.println("{ \"errMsg\" : \" 請輸入場地名稱\"}");
					request.getRequestDispatcher("/_3_view/courtQuery.jsp").forward(request, response);
					return;
				}
				else
				{
					System.out.println("查詢總筆數 : " + list.size());
					Gson gson = new Gson();
					String ans = gson.toJson(list);
					System.out.println(ans);
					out.println(ans);
					return;
				}		
				
			}
			catch (Exception e)
			{
				e.printStackTrace();
				errorMsgs.add("無法取得資料:" + e.getMessage());				
				return;
			}
		}
	}
}
