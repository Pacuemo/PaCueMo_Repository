package _31_court_controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CourtServlet")
public class CourtServlet extends HttpServlet
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

		String[] cityAndTownship = req.getParameterValues("selectCityORTownship");
		String county = req.getParameter("selectCounty");
		String court = req.getParameter("searchCourt");
		if (court == null || court.trim().length() == 0)
		{
			court = "searchCourt";
		}

//		SearchBean sb = new SearchBean(cityAndTownship, county, court);//CourtVo part...
//		req.setAttribute("customer", sb);
	}

}
