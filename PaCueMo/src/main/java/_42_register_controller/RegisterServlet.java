package _42_register_controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import _42_register_service.RegisterService;
import _9_41_member_model.MemberVO;

@WebServlet(urlPatterns = { "/_02_register/checkMail.do", "/_02_register/register.do" })
public class RegisterServlet extends HttpServlet
{

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String model = request.getParameter("model");
		String mail = request.getParameter("email");

		RegisterService ms;
		ms = new RegisterService();

		if ("checkMail".equals(model))
		{

			out.write(ms.checkMail(mail));

		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		String model = request.getParameter("model");
		String mail = request.getParameter("mail");
		String lastName = request.getParameter("lastName");
		String firstName = request.getParameter("firstName");
		String phone = request.getParameter("phone");
		String password = request.getParameter("password");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		MemberVO mv = null;

		RegisterService ms;
		ms = new RegisterService();

		if ("checkMail".equals(model))
		{

			out.write(ms.checkMail(mail));

		}

		if ("register".equals(model))
		{
			Calendar calendar = Calendar.getInstance();
			calendar.set(Integer.parseInt(year), Integer.parseInt(month), Integer.parseInt(day));
			Date dob = new Date(calendar.getTimeInMillis());

			mv = ms.saveMember(firstName, lastName, password, dob, phone, mail);

			if (mv != null)
			{
				session.setAttribute("LoginOK", mv);
				out.write("true");
				return;
			}
			else
			{
				out.write("false");
				return;
			}
		}
	}

}
