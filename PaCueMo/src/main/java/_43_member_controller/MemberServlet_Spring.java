package _43_member_controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.warrenstrange.googleauth.GoogleAuthenticator;
import com.warrenstrange.googleauth.GoogleAuthenticatorKey;
import com.warrenstrange.googleauth.GoogleAuthenticatorQRGenerator;

import _43_member_service.MemberService_Spring;
import _51_battleset_service.BattleSetService;
import _53_goodsorder_service.GoodsOrderService;
import _54_gambleorder_service.GambleOrderService;
import _9_41_member_model.MemberVO;
import _9_53_goodsorder_model.GoodsOrderVO;
import _9_54_gambleorder_model.GambleOrderVO;

@WebServlet(urlPatterns = { "/_03_member/activate.do", "/_03_member/deactivate.do", "/_03_member/connect.do", "/_03_member/overview.do",
				"/_03_member/security.do", "/_03_member/friendsList.do", "/_03_member/details.do" })
public class MemberServlet_Spring extends HttpServlet
{

	private static final long serialVersionUID = 1L;
	@Autowired
	MemberService_Spring ms;

	@Autowired
	Gson gson;

	@Autowired
	GoodsOrderService gs;

	@Autowired
	GambleOrderService gas;

	@Autowired
	BattleSetService bs;

	@Autowired
	JsonArray jsonArray;

	@Autowired
	JsonObject jsonObject;

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
		PrintWriter out = response.getWriter();

		if (memberVO != null)
		{

			if ("/_03_member/overview.do".equals(servletPath))
			{
				HashMap<String, List<String>> map = ms.showAllFriends(memberVO.getMemberId());
				HashMap<String, List<String>> map1 = ms.showAllFriendsInvite(memberVO.getMemberId());
				request.setAttribute("friends", map);
				request.setAttribute("invite", map1);
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
				HashMap<String, List<String>> map2 = ms.showAllFriendsInviting(memberVO.getMemberId());
				request.setAttribute("friends", map);
				request.setAttribute("invite", map1);
				request.setAttribute("inviting", map2);
				request.getRequestDispatcher("/_03_member/accountfriend.jsp").forward(request, response);
				return;
			}
			else if ("/_03_member/details.do".equals(servletPath))
			{
				List<GoodsOrderVO> list = gs.getOrdersByMemberId(memberVO.getMemberId());
				List<GambleOrderVO> galist = gas.getOrdersByMemberId(memberVO.getMemberId());
				JSONArray ja1 = new JSONArray(gson.toJson(list));
				JSONArray ja2 = new JSONArray(gson.toJson(galist));
				JSONArray ja3 = new JSONArray();
				for (GambleOrderVO gambleOrderVO : galist)
				{
					Map<String, Object> map = bs.getOneBattleSetById(gambleOrderVO.getBattleId());
					JSONObject jo = new JSONObject(gson.toJson(map));
					ja3.put(jo);
				}

				JSONObject jo = new JSONObject();
				jo.put("goods", ja1);
				jo.put("gamble", ja2);
				jo.put("battle", ja3);

				out.write(jo.toString());
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
					return;

				}
				else
				{
					jObject = new JsonObject();
					jObject.addProperty("status", "false");
					out.write(jObject.toString());
					return;
				}
			}
			else
			{
				jObject = new JsonObject();
				jObject.addProperty("status", "false");
				out.write(jObject.toString());
				return;
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
						MemberVO temp = new MemberVO();
						temp.setMemberId(memberVO.getMemberId());
						temp.setMemberSecretKey(sKey);
						temp.setMember2StepVerify(true);

						if (ms.activateTwoStepVerification(temp) == 1)
						{

							memberVO.setMemberSecretKey(sKey);
							memberVO.setMember2StepVerify(true);
							jObject = new JsonObject();
							jObject.addProperty("status", "true");
							out.write(jObject.toString());
							return;

						}
						else
						{
							jObject = new JsonObject();
							jObject.addProperty("status", "false");
							out.write(jObject.toString());
							return;
						}
					}
					else
					{
						jObject = new JsonObject();
						jObject.addProperty("status", "false");
						out.write(jObject.toString());
						return;
					}

				}
				else
				{
					jObject = new JsonObject();
					jObject.addProperty("status", "false");
					out.write(jObject.toString());
					return;
				}
			}
			else
			{

				jObject = new JsonObject();
				jObject.addProperty("status", "false");
				out.write(jObject.toString());
				return;

			}
		}

		if ("delete".equals(mode))
		{
			if (memberVO != null)
			{
				if (memberVO.getMember2StepVerify() == true)
				{
					MemberVO temp = new MemberVO();
					temp.setMemberId(memberVO.getMemberId());
					temp.setMemberSecretKey(null);
					temp.setMember2StepVerify(false);

					if (ms.activateTwoStepVerification(temp) == 1)
					{
						memberVO.setMemberSecretKey(null);
						memberVO.setMember2StepVerify(false);
						jObject = new JsonObject();
						jObject.addProperty("status", "true");
						out.write(jObject.toString());
						return;

					}
					else
					{
						jObject = new JsonObject();
						jObject.addProperty("status", "false");
						out.write(jObject.toString());
						return;
					}

				}
				else
				{
					jObject = new JsonObject();
					jObject.addProperty("status", "false");
					out.write(jObject.toString());
					return;
				}
			}
			else
			{

				jObject = new JsonObject();
				jObject.addProperty("status", "false");
				out.write(jObject.toString());
				return;

			}
		}

		if ("fb_connect".equals(mode))
		{
			if (memberVO != null && fbId != null)
			{
				if (memberVO.getMemberFBId() == null && fbId.trim().length() > 0)
				{
					MemberVO temp = new MemberVO();
					temp.setMemberId(memberVO.getMemberId());
					temp.setMemberFBId(fbId);
					temp.setMemberImgUrl(null);

					if (ms.connectFbAccount(temp) == 1)
					{
						memberVO.setMemberFBId(fbId);
						memberVO.setMemberImgUrl(null);
						jObject = new JsonObject();
						jObject.addProperty("status", "true");
						out.write(jObject.toString());
						return;

					}
					else
					{
						jObject = new JsonObject();
						jObject.addProperty("status", "false");
						out.write(jObject.toString());
						return;
					}

				}
				else
				{
					jObject = new JsonObject();
					jObject.addProperty("status", "false");
					out.write(jObject.toString());
					return;
				}
			}
			else
			{

				jObject = new JsonObject();
				jObject.addProperty("status", "false");
				out.write(jObject.toString());
				return;

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
						return;
					}
					else
					{
						jObject = new JsonObject();
						jObject.addProperty("status", "false");
						out.write(jObject.toString());
						return;
					}

				}
				else
				{
					jObject = new JsonObject();
					jObject.addProperty("status", "false");
					out.write(jObject.toString());
					return;
				}
			}
			else
			{

				jObject = new JsonObject();
				jObject.addProperty("status", "false");
				out.write(jObject.toString());
				return;

			}
		}

	}
}
