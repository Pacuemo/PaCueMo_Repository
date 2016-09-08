package _41_login_controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;
import com.warrenstrange.googleauth.GoogleAuthenticator;

import _41_login_service.LoginService_Spring;
import _9_41_member_model.MemberVO;

@Controller
@RequestMapping("/login")
public class LoginServlet_Spring
{

	@Autowired
	private LoginService_Spring ls;

	@Autowired
	private JsonObject jsonObject;

	@Autowired
	private GoogleAuthenticator gAuth;

//	-------------------------------進入登入頁面-------------------------------
	@RequestMapping(value = "/Signin", method = RequestMethod.GET)
	public String signin()
	{
		return "login/login";
	}

	@RequestMapping(value = "/Twostepsignin", method = RequestMethod.POST)
	public String twoStepSignin()
	{
		return "login/twostepverification";
	}

//	-------------------------------登入行為----------------------------------
	@ResponseBody
	@RequestMapping(value = "/login", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public String login(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		MemberVO mv = null;
		String mail = request.getParameter("memberMail");
		String pwd = request.getParameter("memberPassword");
		String rm = request.getParameter("rememberMe");
		String mode = request.getParameter("mode");
		String fbId = request.getParameter("facebookId");
		boolean isNeed2StepVerify = false;
		String code = null;
		String requestURI = (String) session.getAttribute("requestURI");
		String queryString = (String) session.getAttribute("queryString");

		if (rm != null)
		{
			session.setMaxInactiveInterval(12 * 60 * 60);
		}

		if ("normal_Login".equals(mode))
		{

			if (ls.checkTwoStepVerify(mail.trim()))
			{
				mv = null;
				isNeed2StepVerify = true;
				code = ls.checkMailPwd(mail.trim(), pwd).getMemberId();

			}
			else
			{
				mv = ls.checkMailPwd(mail.trim(), pwd);
			}

		}
		else if ("fb_Login".equals(mode))
		{
			if (ls.checkTwoStepVerify_fb(fbId))
			{
				mv = null;
				isNeed2StepVerify = true;
				code = ls.checkFbId(fbId).getMemberId();
			}
			else
			{
				mv = ls.checkFbId(fbId);
			}
		}

		if (mv != null)
		{
			session.setAttribute("LoginOK", mv);
			if (requestURI == null)
			{
				jsonObject.addProperty("status", "true");
				jsonObject.addProperty("url", "../../index.jsp");
				return jsonObject.toString();
			}
			else
			{
				if (null != queryString && queryString.trim().length() != 0)
				{
					if (queryString.contains("memberId"))
					{

						queryString = queryString.replace("memberId=", "memberId=" + mv.getMemberId());
						session.removeAttribute("requestURI");
						session.removeAttribute("queryString");

						jsonObject.addProperty("status", "true");
						jsonObject.addProperty("url", requestURI + "?" + queryString);
						return jsonObject.toString();
					}
					else
					{
						session.removeAttribute("requestURI");
						session.removeAttribute("queryString");

						jsonObject.addProperty("status", "true");
						jsonObject.addProperty("url", requestURI + "?" + queryString);
						return jsonObject.toString();
					}
				}
				else
				{
					jsonObject.addProperty("status", "true");
					jsonObject.addProperty("url", requestURI);
					return jsonObject.toString();
				}
			}

		}
		else
		{
			if (isNeed2StepVerify)
			{
				jsonObject.addProperty("status", "twoStepVerify");
				jsonObject.addProperty("code", code);
				System.out.println(code);
				return jsonObject.toString();

			}
			else
			{
				jsonObject.addProperty("status", "false");
				return jsonObject.toString();
			}
		}

	}

//	-------------------------------兩階段登入----------------------------------	
	@ResponseBody
	@RequestMapping(value = "/Twostepverification", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public String twoStepVerificationLogin(HttpServletRequest request)
	{

		HttpSession session = request.getSession();
		String validCode = request.getParameter("validCode");
		String guid = request.getParameter("guid");
		GoogleAuthenticator gAuth = null;
		MemberVO mv = null;
		String requestURI = (String) session.getAttribute("requestURI");
		String queryString = (String) session.getAttribute("queryString");

		if (validCode != null && validCode.length() != 0 && validCode.matches("[0-9]{6}"))
		{
			if (guid != null && guid.length() != 0)
			{

				gAuth = new GoogleAuthenticator();
				mv = ls.getSKeyByGUID(guid);

				if (gAuth.authorize(mv.getMemberSecretKey().trim(), Integer.valueOf(validCode)))
				{
					session.setAttribute("LoginOK", mv);
					if (requestURI == null)
					{
						jsonObject.addProperty("status", "true");
						jsonObject.addProperty("url", "../../index.jsp");
						return jsonObject.toString();
					}
					else
					{
						if (null != queryString && queryString.trim().length() != 0)
						{
							if (queryString.contains("memberId"))
							{

								queryString = queryString.replace("memberId=", "memberId=" + mv.getMemberId());
								session.removeAttribute("requestURI");
								session.removeAttribute("queryString");

								jsonObject.addProperty("status", "true");
								jsonObject.addProperty("url", requestURI + "?" + queryString);
								return jsonObject.toString();
							}
							else
							{
								session.removeAttribute("requestURI");
								session.removeAttribute("queryString");

								jsonObject.addProperty("status", "true");
								jsonObject.addProperty("url", requestURI + "?" + queryString);
								return jsonObject.toString();
							}
						}
						else
						{
							jsonObject.addProperty("status", "true");
							jsonObject.addProperty("url", requestURI);
							return jsonObject.toString();
						}
					}
				}
				else
				{
					jsonObject.addProperty("status", "false");
					return jsonObject.toString();
				}
			}

		}

		jsonObject.addProperty("status", "false");
		return jsonObject.toString();

	}
}
