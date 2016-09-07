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
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();

		Map<String, String> errorMsg = new HashMap<String, String>();
		req.setAttribute("ErrorMsg", errorMsg);

		String reportType = req.getParameter("reportType");
		if (reportType == null)
		{
			errorMsg.put("reportTypeEmpty", "請選擇問題類型");
		}

		String reportContent = req.getParameter("reportContent");
		if (reportContent == null || reportContent.trim().length() == 0)
		{
			errorMsg.put("reportContentEmpty", "請輸入內容");
		}

		if (errorMsg.isEmpty())
		{
			RequestDispatcher rd = req.getRequestDispatcher("/");
			rd.forward(req, resp);
			return;
		}
	}

}
