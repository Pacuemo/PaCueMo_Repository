package _41_login_controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;
import com.warrenstrange.googleauth.GoogleAuthenticator;

import _00_initial_service.GlobalService;
import _21_club_service.Club_Service;
import _41_login_service.LoginService_Spring;
import _9_21_club_model.ClubVO;
import _9_41_member_model.MemberVO;

@Controller
@RequestMapping("/login")
public class LoginServlet_Spring
{

	@Autowired
	private LoginService_Spring ls;
	@Autowired
	private Club_Service club_Service;

	@Autowired
	private JsonObject jsonObject;

	@Autowired
	private GoogleAuthenticator gAuth;

	@Autowired
	private JavaMailSender mailSender;

//	-------------------------------進入登入頁面-------------------------------
	@RequestMapping(value = "/Signin", method = RequestMethod.GET)
	public String signin()
	{
		return "login/login";
	}

	@RequestMapping(value = "/ResetPassword", method = RequestMethod.GET)
	public String reset()
	{
		return "login/resetpassword";
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
			ClubVO clubVO = club_Service.getClub_by_Login(mv.getMemberId());
			if (clubVO != null)
			{
				session.setAttribute("MyClub", clubVO);
			}
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

//	-------------------------------兩階段登入---------------------------------
	@ResponseBody
	@RequestMapping(value = "/Twostepverification", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public String twoStepVerificationLogin(HttpServletRequest request)
	{

		HttpSession session = request.getSession();
		String validCode = request.getParameter("validCode");
		String guid = request.getParameter("guid");
		MemberVO mv = null;
		String requestURI = (String) session.getAttribute("requestURI");
		String queryString = (String) session.getAttribute("queryString");

		if (validCode != null && validCode.length() != 0 && validCode.matches("[0-9]{6}"))
		{
			if (guid != null && guid.length() != 0)
			{

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

//	-------------------------------寄出找回密碼--------------------------------		
	@ResponseBody
	@RequestMapping(value = "/ForgetPassword", method = RequestMethod.GET)
	public void forgetPassword(HttpServletRequest request, HttpServletResponse response) throws IOException, MessagingException
	{
		PrintWriter out = response.getWriter();
		String mail = request.getParameter("mail");
		MimeMessage message;
		MemberVO mv;
		if (mail != null && mail.trim().length() > 0)
		{
			mv = new MemberVO();
			mv.setMemberMail(mail);
			mv.setMemberOutDate(new Timestamp(System.currentTimeMillis() + 30 * 60 * 1000));
			mv.setMemberValidateCode(UUID.randomUUID().toString());

			if (ls.setForgetPasswordInfo(mv) == 1)
			{
				if ((mv = ls.checkMail(mail)) != null)
				{
					Base64 encoder = new Base64(true);
					String code = mv.getMemberId() + "&" + GlobalService.getMD5Endocing(mv.getMemberOutDate().toString() + mv.getMemberValidateCode());
					String path = request.getContextPath();
					String basePath = request.getScheme() + "://"
							+ request.getServerName() + ":"
							+ request.getServerPort() + path + "/";

					String link = basePath + "spring/login/Resetpwd?code=" + encoder.encodeToString(code.getBytes());
					message = mailSender.createMimeMessage();
					MimeMessageHelper helper = new MimeMessageHelper(message, true);
					helper.setFrom("noreply@pacuemo.com");
					helper.setTo("tw11509@gmail.com");
					helper.setSubject("密碼重設通知");
					helper.setText("<h3>密碼重置連結:<a href='" + link + "'>點這裡</a><h3>", true);
					mailSender.send(message);
					out.write("success");
					return;
				}

			}
		}

		out.write("fail");
		return;
	}

//	-----------------------------導向密碼重置頁面--------------------------------	
	@RequestMapping(value = "/Resetpwd", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	public String resetPassword(HttpServletRequest request)
	{
		String code = request.getParameter("code");
		if (code != null && code.trim().length() > 0)
		{
			String str = new String(Base64.decodeBase64(code.getBytes()));
			if (str.contains("&"))
			{
				String[] strs = str.split("&");
				String guid = strs[0];
				String validCode = strs[1].trim();
				request.setAttribute("validCode", validCode);
				request.setAttribute("id", guid);
				return "login/changepassword";

			}

		}

		return "";
	}

//	-----------------------------導向密碼重置頁面--------------------------------	
	@ResponseBody
	@RequestMapping(value = "/updatePassword", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public void updatePassword(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		PrintWriter out = response.getWriter();
		String guid = request.getParameter("userId");
		String validCode = request.getParameter("validCode");
		String pwd = request.getParameter("password-reset");
		MemberVO mv = null;
		System.out.println(guid);

		if (guid != null && guid.trim().length() > 0 && validCode != null && validCode.trim().length() > 0
				&& pwd != null && pwd.trim().length() > 0)
		{

			mv = ls.findbyGUID(guid);
			if (System.currentTimeMillis() < mv.getMemberOutDate().getTime())
			{
				String md5Code = GlobalService.getMD5Endocing(mv.getMemberOutDate() + mv.getMemberValidateCode());
				if (validCode.equals(md5Code))
				{
					mv = new MemberVO();
					mv.setMemberId(guid);
					mv.setMemberPassword(GlobalService.getMD5Endocing(pwd));
					mv.setMemberOutDate(new Timestamp(System.currentTimeMillis()));
					ls.setNewPassword(mv);
					out.write("success");
					return;
				}
			}
		}

		out.write("fail");
		return;
	}
}
