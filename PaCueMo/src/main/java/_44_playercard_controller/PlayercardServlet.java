package _44_playercard_controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import _44_playercard_service.PlayercardService;
import _9_41_member_model.MemberVO;
import _9_42_playerCard_model.PlayerCardVO;

@Controller
@RequestMapping("/playercard")
public class PlayercardServlet
{
	@Autowired
	private PlayercardService ps;

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
