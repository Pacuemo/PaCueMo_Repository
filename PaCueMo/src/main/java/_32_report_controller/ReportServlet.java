package _32_report_controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet
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
		System.out.println("post is called");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print("");

		Map<String, String> errorMsg = new HashMap<String, String>();
		request.setAttribute("ErrorMsg", errorMsg);

		String reportName = request.getParameter("reportName");
		if (reportName == null || reportName.trim().length() == 0)
		{
			errorMsg.put("reportName", "請填入姓名");
		}

		String reportType = request.getParameter("reportType");
		if (reportType == null)
		{
			errorMsg.put("reportTypeEmpty", "請選擇問題類型");
		}

		String reportContent = request.getParameter("reportContent");
		if (reportContent == null || reportContent.trim().length() == 0)
		{
			errorMsg.put("reportContentEmpty", "請輸入內容");
		}

		if (!errorMsg.isEmpty())
		{
			RequestDispatcher rd = request.getRequestDispatcher("");//導向頁面
			rd.forward(request, response);
			return;
		}
	}

}
