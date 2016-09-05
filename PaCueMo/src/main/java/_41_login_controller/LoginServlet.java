package _41_login_controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import _41_login_service.LoginService;
import _9_41_member_model.MemberVO;

@WebServlet("/_01_login/login.do")
public class LoginServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();

		String mail = request.getParameter("memberMail");
		String pwd = request.getParameter("memberPassword");
		String rm = request.getParameter("rememberMe");
		String mode = request.getParameter("mode");
		String fbId = request.getParameter("facebookId");
		boolean isNeed2StepVerify = false;
		String code = null;
		String requestURI = (String) session.getAttribute("requestURI");

		if (rm != null)
		{
			session.setMaxInactiveInterval(12 * 60 * 60);
		}

		LoginService ms;
		MemberVO mv = null;
		ms = new LoginService();

		if ("normal_Login".equals(mode))
		{
			code = ms.checkTwoStepVerify(mail);
			if ("true".equals(code.substring(0, 4)))
			{
				mv = null;
				isNeed2StepVerify = true;
			}
			else
			{
				mv = ms.checkMailPwd(mail, pwd);
			}

		}
		else if ("fb_Login".equals(mode))
		{
			code = ms.checkTwoStepVerify_fb(fbId);
			if ("true".equals(code.substring(0, 4)))
			{
				mv = null;
				isNeed2StepVerify = true;
			}
			else
			{
				mv = ms.checkFbId(fbId);
			}
		}

		if (mv != null)
		{
			session.setAttribute("LoginOK", mv);
			out.write("true");
//			response.sendRedirect(response.encodeRedirectURL("index.jsp"));
//			response.sendRedirect("index.jsp");
			return;
		}
		else
		{
			if (isNeed2StepVerify)
			{
				out.write("twoStepVerify" + code.substring(4));
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
