package _21_getclub_controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import _21_getclub_service.ClubService;

@WebServlet("/club/GetClubInfo")
public class GetClubInfo extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	public GetClubInfo()
	{
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{

		List<String> errorMsgs = new LinkedList<String>();
		String club = null;
		request.setAttribute("errorMsgs", errorMsgs);
		int clubID = 0;

		// 
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		String ID = request.getParameter("ClubID");
		System.out.println(ID);
		if (ID == null || ID.trim().length() == 0)
		{
			errorMsgs.add("ID請勿空白");
		}

		try
		{
			clubID = Integer.parseInt(ID);
		}
		catch (Exception e)
		{
			errorMsgs.add("輸入ID型別錯誤");
		}

		if (!errorMsgs.isEmpty())
		{
			RequestDispatcher failureView = request.getRequestDispatcher("/club/FindClub.jsp");
			failureView.forward(request, response);
			return;
		}
		// 
		ClubService clubService = new ClubService();
		try
		{
			club = clubService.findOne(clubID);
			out.write(club);

		}
		catch (Exception e)
		{

			errorMsgs.add(e.getMessage());
			RequestDispatcher successView = request.getRequestDispatcher("/club/error.jsp");
			successView.forward(request, response);
			return;
		}
//		request.getSession().setAttribute("ClubVO", ClubVO);
//		RequestDispatcher successView = request.getRequestDispatcher("/club/successSearch.jsp");
//		successView.forward(request, response);
//		return;
	}

}
