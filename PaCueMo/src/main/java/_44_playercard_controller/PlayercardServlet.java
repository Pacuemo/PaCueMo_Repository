package _44_playercard_controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import _41_login_service.LoginService_Spring;
import _43_member_service.MemberService_Spring;
import _44_playercard_service.PlayercardService;
import _9_41_member_model.MemberVO;
import _9_42_playerCard_model.PlayerCardVO;
import _9_43_friendsList_model.FriendsListVO;

@Controller
@RequestMapping("/playercard")
public class PlayercardServlet
{
	@Autowired
	private PlayercardService ps;
	@Autowired
	private LoginService_Spring ls;
	@Autowired
	private MemberService_Spring ms;

	@RequestMapping("Myplayercard")
	public String home(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		MemberVO mv = (MemberVO) session.getAttribute("LoginOK");
		if (mv.getMemberHaveCard())
		{
			PlayerCardVO pv = ps.getPlayercardByPK(mv.getMemberId());
			request.setAttribute("Playercard", pv);
		}
		return "playercard/myplayercard";
	}

	@RequestMapping(value = "Playercard", method = RequestMethod.GET)
	public String playcard(HttpServletRequest request, HttpSession session)
	{
		String memberId = request.getParameter("guid");
		MemberVO me = (MemberVO) session.getAttribute("LoginOK");
		MemberVO friend = null;
		FriendsListVO fVO = new FriendsListVO();
		HashMap<String, List<String>> map = null;

		if (me != null && memberId != null)
		{
			friend = ls.findbyGUID(memberId);
			map = ms.showAllFriends(memberId);
			if (me.getMemberId().equals(memberId))
			{
				PlayerCardVO pv = ps.getPlayercardByPK(me.getMemberId());
				request.setAttribute("Playercard", pv);
				return "playercard/myplayercard";
			}

			if (friend.getMemberHaveCard())
			{
				PlayerCardVO pv = ps.getPlayercardByPK(friend.getMemberId());
				request.setAttribute("Playercard", pv);

			}

			fVO.setMemberId(me.getMemberId());
			fVO.setMemberFriendId(memberId);

			if ((fVO = ms.getFriend(fVO)) != null)
			{
				if (fVO.getMemberStatus() == 1)
				{
					request.setAttribute("Status", "1"); //friend
				}
				else if (fVO.getMemberStatus() == 2)
				{
					request.setAttribute("Status", "2"); //inviting
				}
				else
				{
					request.setAttribute("Status", "3");
				}
			}
			else
			{
				request.setAttribute("Status", "4");// no relationship
			}

			request.setAttribute("friends", map);
			request.setAttribute("Info", friend);

			return "playercard/playercard";
		}

		return "playercard/error";
	}

	@RequestMapping(value = "Playercard/friends", method = RequestMethod.GET)
	public String playcardFriends(HttpServletRequest request, HttpSession session)
	{
		String memberId = request.getParameter("guid");
		HashMap<String, List<String>> map = ms.showAllFriends(memberId);
		request.setAttribute("friends", map);

		return "playercard/friendslist";

	}

	@RequestMapping(value = "Playercard/friends/invite", method = RequestMethod.GET)
	public String inviteFriend(HttpServletRequest request, HttpSession session)
	{
		String friendId = request.getParameter("guid");
		MemberVO mv = (MemberVO) session.getAttribute("LoginOK");
		FriendsListVO me = new FriendsListVO();
		FriendsListVO friend = new FriendsListVO();
		me.setMemberId(mv.getMemberId());
		me.setMemberFriendId(friendId);
		me.setMemberStatus(3);
		friend.setMemberId(friendId);
		friend.setMemberFriendId(mv.getMemberId());
		friend.setMemberStatus(2);
		if (ps.inviteFriend(me, friend) == 1)
		{
			return "redirect:../../Playercard?guid=" + friendId;
		}
		return "playercard/error";
	}

	@RequestMapping(value = "Playercard/friends/cancel", method = RequestMethod.GET)
	public String cancelInvite(HttpServletRequest request, HttpSession session)
	{
		String friendId = request.getParameter("guid");
		MemberVO mv = (MemberVO) session.getAttribute("LoginOK");
		if (ms.deleteFriend(mv.getMemberId(), friendId) == 1)
		{
			return "redirect:../../Playercard?guid=" + friendId.trim();
		}
		return "playercard/error";
	}

	@RequestMapping(value = "Playercard/friends/agree", method = RequestMethod.GET)
	public String agreeInvite(HttpServletRequest request, HttpSession session)
	{
		String friendId = request.getParameter("guid");
		MemberVO mv = (MemberVO) session.getAttribute("LoginOK");
		FriendsListVO me = new FriendsListVO();
		FriendsListVO friend = new FriendsListVO();
		me.setMemberId(mv.getMemberId());
		me.setMemberFriendId(friendId);
		me.setMemberStatus(1);
		friend.setMemberId(friendId);
		friend.setMemberFriendId(mv.getMemberId());
		friend.setMemberStatus(1);

		if (ps.agreeInvite(me, friend) == 1)
		{
			return "redirect:../../Playercard?guid=" + friendId.trim();
		}
		return "playercard/error";
	}

	@ResponseBody
	@RequestMapping(value = "/Addplayercard", method = RequestMethod.POST)
	public void buildCard(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		MemberVO mv = (MemberVO) session.getAttribute("LoginOK");
		String memberId = mv.getMemberId();
		String height = request.getParameter("height").trim();
		String weight = request.getParameter("weight").trim();
		String hand = request.getParameter("hand").trim();
		String position = request.getParameter("position").trim();
		String location = request.getParameter("location").trim();
		String gender = request.getParameter("gender").trim();
		String str = request.getParameter("str").trim();
		String dex = request.getParameter("dex").trim();
		String con = request.getParameter("con").trim();
		String inte = request.getParameter("inte").trim();
		String wis = request.getParameter("wis").trim();
		String cha = request.getParameter("cha").trim();
		String note = request.getParameter("note").trim();
		PlayerCardVO pv = null;

		if (height != null && height.length() > 0 && weight != null && weight.length() > 0 && hand != null && hand.length() > 0 && position != null && position.length() > 0
				&& location != null && location.length() > 0 && gender != null && gender.length() > 0 && str != null && str.length() > 0
				&& dex != null && dex.length() > 0 && con != null && con.length() > 0 && inte != null && inte.length() > 0 && wis != null && wis.length() > 0
				&& cha != null && cha.length() > 0 && note != null && note.length() > 0)
		{
			pv = new PlayerCardVO();
			pv.setMemberId(memberId);
			pv.setPlayerPosition(position);
			pv.setPlayerLocation(location);
			pv.setPlayerNote(note);

			if (gender.equals("1"))
			{
				//boy
				pv.setPlayerGender(true);
			}
			else if (gender.equals("2"))
			{
				//girl
				pv.setPlayerGender(false);
			}
			else
			{
				out.write("false");
				return;
			}

			if (hand.equals("1"))
			{
				//left
				pv.setPlayerHand(true);
			}
			else if (hand.equals("2"))
			{
				//right
				pv.setPlayerHand(false);
			}
			else
			{
				out.write("false");
				return;
			}

			try
			{
				pv.setPlayerHeight(Double.parseDouble(height));
				pv.setPlayerWeight(Double.parseDouble(weight));
				pv.setPlayerSTR(Integer.parseInt(str));
				pv.setPlayerDEX(Integer.parseInt(dex));
				pv.setPlayerCON(Integer.parseInt(con));
				pv.setPlayerINT(Integer.parseInt(inte));
				pv.setPlayerWIS(Integer.parseInt(wis));
				pv.setPlayerCHA(Integer.parseInt(cha));

			}
			catch (NumberFormatException e)
			{
				out.write("false");
				return;
			}

			mv.setMemberHaveCard(true);
			if (ps.buildPlayercard(pv, mv) == 1)
			{
				out.write("true");
				return;
			}

		}

		out.write("false");
		return;
	}

	@ResponseBody
	@RequestMapping(value = "/Updateplayercard", method = RequestMethod.POST)
	public void updateCard(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		MemberVO mv = (MemberVO) session.getAttribute("LoginOK");
		String memberId = mv.getMemberId();
		String height = request.getParameter("height").trim();
		String weight = request.getParameter("weight").trim();
		String hand = request.getParameter("hand").trim();
		String position = request.getParameter("position").trim();
		String location = request.getParameter("location").trim();
		String gender = request.getParameter("gender").trim();
		String str = request.getParameter("str").trim();
		String dex = request.getParameter("dex").trim();
		String con = request.getParameter("con").trim();
		String inte = request.getParameter("inte").trim();
		String wis = request.getParameter("wis").trim();
		String cha = request.getParameter("cha").trim();
		String note = request.getParameter("note").trim();
		PlayerCardVO pv = null;

		if (height != null && height.length() > 0 && weight != null && weight.length() > 0 && hand != null && hand.length() > 0 && position != null && position.length() > 0
				&& location != null && location.length() > 0 && gender != null && gender.length() > 0 && str != null && str.length() > 0
				&& dex != null && dex.length() > 0 && con != null && con.length() > 0 && inte != null && inte.length() > 0 && wis != null && wis.length() > 0
				&& cha != null && cha.length() > 0 && note != null && note.length() > 0)
		{
			pv = new PlayerCardVO();
			pv.setMemberId(memberId);
			pv.setPlayerPosition(position);
			pv.setPlayerLocation(location);
			pv.setPlayerNote(note);

			if (gender.equals("1"))
			{
				//boy
				pv.setPlayerGender(true);
			}
			else if (gender.equals("2"))
			{
				//girl
				pv.setPlayerGender(false);
			}
			else
			{
				out.write("false");
				return;
			}

			if (hand.equals("1"))
			{
				//left
				pv.setPlayerHand(true);
			}
			else if (hand.equals("2"))
			{
				//right
				pv.setPlayerHand(false);
			}
			else
			{
				out.write("false");
				return;
			}

			try
			{
				pv.setPlayerHeight(Double.parseDouble(height));
				pv.setPlayerWeight(Double.parseDouble(weight));
				pv.setPlayerSTR(Integer.parseInt(str));
				pv.setPlayerDEX(Integer.parseInt(dex));
				pv.setPlayerCON(Integer.parseInt(con));
				pv.setPlayerINT(Integer.parseInt(inte));
				pv.setPlayerWIS(Integer.parseInt(wis));
				pv.setPlayerCHA(Integer.parseInt(cha));

			}
			catch (NumberFormatException e)
			{
				out.write("false");
				return;
			}

			mv.setMemberHaveCard(true);
			if (ps.updatePlayercard(pv) == 1)
			{
				out.write("true");
				return;
			}

		}

		out.write("false");
		return;
	}
}
