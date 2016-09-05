package _41_login_controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.warrenstrange.googleauth.GoogleAuthenticator;

import _41_login_service.LoginService;
import _9_41_member_model.MemberVO;

@WebServlet("/_01_login/twosteplogin.do")
public class TwoStepVerifyServlet extends HttpServlet
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		String validCode = request.getParameter("validCode");
		String accountType = request.getParameter("type");
		String mail = request.getParameter("mail");
		String fbId = request.getParameter("fbId");
		LoginService ls = null;
		GoogleAuthenticator gAuth = null;
		MemberVO mv = null;
		String requestURI = (String) session.getAttribute("requestURI");

		if (validCode != null && validCode.length() != 0)
		{
			if ("normal".equals(accountType) && mail != null && mail.length() != 0)
			{

				gAuth = new GoogleAuthenticator();
				ls = new LoginService();
				mv = ls.getSKeyByEmail(mail);

				if (gAuth.authorize(mv.getMemberSecretKey().trim(), Integer.valueOf(validCode)))
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
			else if ("fb".equals(accountType) && fbId != null && fbId.length() != 0)
			{
				gAuth = new GoogleAuthenticator();
				ls = new LoginService();
				mv = ls.getSKeyByEmail(fbId);
				if (gAuth.authorize(mv.getMemberSecretKey(), Integer.valueOf(validCode)))
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
			else
			{
				out.write("false");
				return;
			}

		}
		else
		{
			out.write("false");
			return;
		}
	}

//	public static void main(String[] args)
//	{
//		GoogleAuthenticator gAuth = new GoogleAuthenticator();
//
//		final GoogleAuthenticatorKey key = gAuth.createCredentials();
//
//////		System.out.println(key.getKey());
////
//////		boolean isCodeValid = gAuth.authorize("HZSF3K7HC7JGTROW", (int) 360714F);
//////		System.out.println(isCodeValid);
//
//		System.out.println(Integer.valueOf("000005888"));
//	}

}
