package _42_register_controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import _00_initial_service.GlobalService;
import _42_register_service.RegisterService_Spring;
import _9_41_member_model.MemberVO;

@Controller
@RequestMapping("/register")
public class RegisterServlet_Spring
{
	@Autowired
	private RegisterService_Spring rs;

	@Autowired
	MemberVO mv;

//	-------------------------------進入登入頁面-------------------------------
	@RequestMapping(value = "/Signup", method = RequestMethod.GET)
	public String signin()
	{
		return "register/register";
	}

	@RequestMapping(value = "/Fbsignup", method = RequestMethod.POST)
	public String fbSign()
	{
		return "register/fbRegister";

	}

	@ResponseBody
	@RequestMapping(value = "/Mailcheck", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	public void checkMail(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		String mail = request.getParameter("email");
		PrintWriter out = response.getWriter();

		out.write(rs.checkMail(mail));
		return;
	}

	@ResponseBody
	@RequestMapping(value = "/Register", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public void saveMember(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
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
		String fbId = request.getParameter("fbId");
		Calendar calendar = Calendar.getInstance();
		calendar.set(Integer.parseInt(year), Integer.parseInt(month), Integer.parseInt(day));
		Date dob = new Date(calendar.getTimeInMillis());

		if ("register".equals(model))
		{

			mv.setMemberMail(mail.trim());
			mv.setMemberLastName(lastName);
			mv.setMemberFirstName(firstName);
			mv.setMemberPhone(phone);
			mv.setMemberPassword(GlobalService.getMD5Endocing(password));
			mv.setMemberBirthday(dob);
			mv = rs.saveMember(mv);

		}

		if ("register_fb".equals(model))
		{
			mv.setMemberMail(mail.trim());
			mv.setMemberLastName(lastName);
			mv.setMemberFirstName(firstName);
			mv.setMemberPhone(phone);
			mv.setMemberBirthday(dob);
			mv.setMemberFBId(fbId);
			mv = rs.saveMember_fb(mv);

		}

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
