package _43_member_controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

import com.google.gson.JsonObject;
import com.warrenstrange.googleauth.GoogleAuthenticator;
import com.warrenstrange.googleauth.GoogleAuthenticatorKey;
import com.warrenstrange.googleauth.GoogleAuthenticatorQRGenerator;

import _43_member_service.MemberService_Spring;
import _9_41_member_model.MemberVO;

@WebServlet(urlPatterns = { "/_03_member/activate.do", "/_03_member/deactivate.do", "/_03_member/connect.do", "/_03_member/overview.do",
				"/_03_member/security.do", "/_03_member/friendsList.do" })
public class MemberServlet_Spring extends HttpServlet
{

	private static final long serialVersionUID = 1L;
	@Autowired
	MemberService_Spring ms;

	public void init(ServletConfig config) throws ServletException
	{
		super.init(config);
		SpringBeanAutowiringSupport.processInjectionBasedOnServletContext(this,
				config.getServletContext());
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		System.out.println("call MemberServlet doGet");
		String servletPath = request.getServletPath();
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("LoginOK");

		if (memberVO != null)
		{

			if ("/_03_member/overview.do".equals(servletPath))
			{
				HashMap<String, List<String>> map = ms.showAllFriends(memberVO.getMemberId());
				request.setAttribute("friends", map);
				request.getRequestDispatcher("/_03_member/accountoverview.jsp").forward(request, response);
				return;
			}
			else if ("/_03_member/security.do".equals(servletPath))
			{
				request.getRequestDispatcher("/_03_member/accountsecurity.jsp").forward(request, response);
				return;
			}
			else if ("/_03_member/friendsList.do".equals(servletPath))
			{
				HashMap<String, List<String>> map = ms.showAllFriends(memberVO.getMemberId());
				HashMap<String, List<String>> map1 = ms.showAllFriendsInvite(memberVO.getMemberId());
				request.setAttribute("friends", map);
				request.setAttribute("invite", map1);
				request.getRequestDispatcher("/_03_member/accountfriend.jsp").forward(request, response);
				return;
			}
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
		String friendId = request.getParameter("friendId");
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

					GoogleAuthenticator gAuth = new GoogleAuthenticator();
					boolean isCodeValid = gAuth.authorize(sKey.trim(), new Integer(code));

					if (isCodeValid)
					{
						memberVO.setMemberSecretKey(sKey);
						memberVO.setMember2StepVerify(true);

						if (ms.activateTwoStepVerification(memberVO) == 1)
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
					memberVO.setMemberSecretKey(null);
					memberVO.setMember2StepVerify(false);

					if (ms.activateTwoStepVerification(memberVO) == 1)
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
					memberVO.setMemberFBId(fbId);
					memberVO.setMemberImgUrl(null);

					if (ms.connectFbAccount(memberVO) == 1)
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

		if ("delete_friend".equals(mode))
		{
			if (memberVO != null && friendId != null)
			{
				if (friendId.trim().length() > 0)
				{

					int result = ms.deleteFriend(memberVO.getMemberId(), friendId);

					if (result == 1)
					{
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
