package _10_team_controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/TeamServlet")
public class TeamServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	public TeamServlet()
	{
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		req.setCharacterEncoding("UTF-8");
		ServletContext context = req.getServletContext();
		String teamName = "";

		try
		{
			if (null != teamName || teamName.trim().length() != 0)

				context.getAttribute("LoginOK");

		}
		catch (Exception e)
		{

		}

	}

}
