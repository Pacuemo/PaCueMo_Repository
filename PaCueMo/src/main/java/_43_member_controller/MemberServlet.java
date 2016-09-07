package _43_member_controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonObject;
import com.warrenstrange.googleauth.GoogleAuthenticator;
import com.warrenstrange.googleauth.GoogleAuthenticatorKey;
import com.warrenstrange.googleauth.GoogleAuthenticatorQRGenerator;

import _43_member_service.MemberService;
import _9_41_member_model.MemberVO;

@WebServlet(urlPatterns = { "/_03_member/activate.do", "/_03_member/deactivate.do", "/_03_member/connect.do", "/_03_member/overview.do" })
public class MemberServlet extends HttpServlet
{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		System.out.println("call MemberServlet doGet");
		System.out.println(request.getServletPath());
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("LoginOK");
		MemberService ms;

		if (memberVO != null)
		{
			ms = new MemberService();
			HashMap<String, List<String>> map = ms.showAllFriends(memberVO.getMemberId());
			request.setAttribute("friends", map);
			request.getRequestDispatcher("/_03_member/accountoverview.jsp").forward(request, response);
			return;

		}

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		System.out.println("call MemberServlet doPost");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		MemberVO memberVO = (MemberVO) session.getAttribute("LoginOK");
		String mode = request.getParameter("mode");
		String sKey = request.getParameter("sKey");
		String code = request.getParameter("code");
		String fbId = request.getParameter("facebookId");
		MemberService ms;
		JsonObject jObject;

		if ("activate".equals(mode))
		{
			if (memberVO != null)
			{
				if (memberVO.getMember2StepVerify() == false)
				{
					GoogleAuthenticator gAuth = new GoogleAuthenticator();
					GoogleAuthenticatorKey credentials = gAuth.createCredentials();
					String url = GoogleAuthenticatorQRGenerator.getOtpAuthURL("Pacuemo", memberVO.getMemberMail().trim(), credentials);
					jObject = new JsonObject();
					jObject.addProperty("status", "true");
					jObject.addProperty("url", url);
					jObject.addProperty("sKey", credentials.getKey());
					out.write(jObject.toString());

				}
				else
				{
					jObject = new JsonObject();
					jObject.addProperty("status", "false");
					out.write(jObject.toString());
				}
			}
			else
			{
				jObject = new JsonObject();
				jObject.addProperty("status", "false");
				out.write(jObject.toString());
			}
		}

		if ("store".equals(mode))
		{
			if (memberVO != null && sKey != null && code != null)
			{
				if (memberVO.getMember2StepVerify() == false && sKey.trim().length() > 0 && code.trim().length() > 0 && code.matches("[0-9]{6}"))
				{
					ms = new MemberService();

					GoogleAuthenticator gAuth = new GoogleAuthenticator();
					boolean isCodeValid = gAuth.authorize(sKey.trim(), new Integer(code));

					if (isCodeValid)
					{
						memberVO = ms.activate2StepVerify(memberVO.getMemberId(), sKey, true);
						if (memberVO != null)
						{
							session.removeAttribute("LoginOK");
							session.setAttribute("LoginOK", memberVO);
							jObject = new JsonObject();
							jObject.addProperty("status", "true");
							out.write(jObject.toString());
						}
						else
						{
							jObject = new JsonObject();
							jObject.addProperty("status", "false");
							out.write(jObject.toString());
						}
					}
					else
					{
						jObject = new JsonObject();
						jObject.addProperty("status", "false");
						out.write(jObject.toString());
					}

				}
				else
				{
					jObject = new JsonObject();
					jObject.addProperty("status", "false");
					out.write(jObject.toString());
				}
			}
			else
			{

				jObject = new JsonObject();
				jObject.addProperty("status", "false");
				out.write(jObject.toString());

			}
		}

		if ("delete".equals(mode))
		{
			if (memberVO != null)
			{
				if (memberVO.getMember2StepVerify() == true)
				{
					ms = new MemberService();

					memberVO = ms.activate2StepVerify(memberVO.getMemberId(), null, false);

					if (memberVO != null)
					{
						session.removeAttribute("LoginOK");
						session.setAttribute("LoginOK", memberVO);
						jObject = new JsonObject();
						jObject.addProperty("status", "true");
						out.write(jObject.toString());
					}
					else
					{
						jObject = new JsonObject();
						jObject.addProperty("status", "false");
						out.write(jObject.toString());
					}

				}
				else
				{
					jObject = new JsonObject();
					jObject.addProperty("status", "false");
					out.write(jObject.toString());
				}
			}
			else
			{

				jObject = new JsonObject();
				jObject.addProperty("status", "false");
				out.write(jObject.toString());

			}
		}

		if ("fb_connect".equals(mode))
		{
			if (memberVO != null && fbId != null)
			{
				if (memberVO.getMemberFBId() == null && fbId.trim().length() > 0)
				{
					ms = new MemberService();

					memberVO = ms.connectFbAccount(memberVO.getMemberId(), fbId);

					if (memberVO != null)
					{
						session.removeAttribute("LoginOK");
						session.setAttribute("LoginOK", memberVO);
						jObject = new JsonObject();
						jObject.addProperty("status", "true");
						out.write(jObject.toString());
					}
					else
					{
						jObject = new JsonObject();
						jObject.addProperty("status", "false");
						out.write(jObject.toString());
					}

				}
				else
				{
					jObject = new JsonObject();
					jObject.addProperty("status", "false");
					out.write(jObject.toString());
				}
			}
			else
			{

				jObject = new JsonObject();
				jObject.addProperty("status", "false");
				out.write(jObject.toString());

			}
		}
	}

}
