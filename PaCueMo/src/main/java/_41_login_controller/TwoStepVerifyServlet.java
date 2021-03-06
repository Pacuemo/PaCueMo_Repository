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
import com.warrenstrange.googleauth.GoogleAuthenticatorKey;

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
		String guid = request.getParameter("guid");
		LoginService ls = null;
		GoogleAuthenticator gAuth = null;
		MemberVO mv = null;
		String requestURI = (String) session.getAttribute("requestURI");

		if (validCode != null && validCode.length() != 0 && validCode.matches("[0-9]{6}"))
		{
			if ("normal".equals(accountType) && guid != null && guid.length() != 0)
			{

				gAuth = new GoogleAuthenticator();
				ls = new LoginService();
				mv = ls.getSKeyByGUID(guid);

				if (gAuth.authorize(mv.getMemberSecretKey().trim(), Integer.valueOf(validCode)))
				{
					session.setAttribute("LoginOK", mv);
					if (requestURI == null)
					{
						out.write("true" + "../index.jsp");
						return;
					}
					else
					{
						session.removeAttribute("requestURI");
						out.write("true" + requestURI);
						return;
					}
				}
				else
				{
					out.write("false");
					return;
				}

			}
			else if ("fb".equals(accountType) && guid != null && guid.length() != 0)
			{
				gAuth = new GoogleAuthenticator();
				ls = new LoginService();
				mv = ls.getSKeyByGUID(guid);
				if (gAuth.authorize(mv.getMemberSecretKey(), Integer.valueOf(validCode)))
				{
					session.setAttribute("LoginOK", mv);
					if (requestURI == null)
					{
						out.write("true" + "../index.jsp");
						return;
					}
					else
					{
						session.removeAttribute("requestURI");
						out.write("true" + requestURI);
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
		else
		{
			out.write("false");
			return;
		}
	}

	public static void main(String[] args)
	{
		GoogleAuthenticator gAuth = new GoogleAuthenticator();

		final GoogleAuthenticatorKey key = gAuth.createCredentials();

		System.out.println(key.getKey());
//
////		boolean isCodeValid = gAuth.authorize("HZSF3K7HC7JGTROW", (int) 360714F);
////		System.out.println(isCodeValid);

//		System.out.println(Integer.valueOf("000005888"));
	}

}
