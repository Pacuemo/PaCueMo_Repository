package _12_battlerecord_controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import _10_team_service.TeamService;
import _11_teammember_service.TeamMemberService;
import _9_10_team_model.TeamVO;
import _9_41_member_model.MemberVO;

@Controller
@RequestMapping("/battle_rec")
public class BattleRecordController_Spring
{
	@Autowired
	private TeamMemberService teamMemberService;
	@Autowired
	private TeamService teamService;

	@RequestMapping(value = "/getMainPage")
	public String getMainPage(HttpSession session, HttpServletRequest request)
	{
		System.out.println("BattleRecord_Controller : getMainPage");
		MemberVO memberVO = null;
		try
		{
			memberVO = (MemberVO) session.getAttribute("LoginOK");
			List<TeamVO> mineTeamIdList = teamService.find_TeamVO_With_TeamHead(memberVO.getMemberId());
			request.setAttribute("mineTeamVOList", mineTeamIdList);

		}
		catch (Exception e)
		{
			e.printStackTrace();
			System.out.println("fuck");
			return "";
		}
		System.out.println("成功導入");
		System.out.println("-------------------------------------------------------");
		return "battle_rec/tmbattle";
	}

	@RequestMapping(value = "/getLetsBattlePage")
	public String getLetsBattlePage(HttpSession session, HttpServletRequest request)
	{
		System.out.println("BattleRecord_Controller : getLetsBattlePage");
		MemberVO memberVO = null;
		try
		{
			memberVO = (MemberVO) session.getAttribute("LoginOK");
			List<TeamVO> mineTeamIdList = teamService.find_TeamVO_With_TeamHead(memberVO.getMemberId());
			request.setAttribute("mineTeamVOList", mineTeamIdList);

		}
		catch (Exception e)
		{
			e.printStackTrace();
			System.out.println("fuck");
			return "";
		}
		System.out.println("成功導入");
		System.out.println("-------------------------------------------------------");
		return "battle_rec/letsbattle";
	}
}
