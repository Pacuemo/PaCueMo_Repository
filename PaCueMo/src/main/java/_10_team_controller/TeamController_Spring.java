package _10_team_controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import _10_team_service.TeamService;
import _11_teammember_service.TeamMemberService;
import _9_10_team_model.TeamVO;
import _9_41_member_model.MemberVO;

@Controller
@RequestMapping("/team")
public class TeamController_Spring
{
	@Autowired
	private TeamMemberService teamMemberService;
	@Autowired
	private TeamService teamService;

	@RequestMapping(value = "/joinTeam", method = RequestMethod.GET, produces = "text/plain ; charset=UTF-8")
	@ResponseBody
	public String joinTeam(HttpServletRequest request, Integer teamId, String memberId)
	{
		System.out.println("Team_Controller : joinTeamPage");
		try
		{
			teamMemberService.add(teamId, memberId);
		}
		catch (Exception e)
		{
			e.printStackTrace();
			System.out.println("fuck");
			return "有隊伍加不了(不會顯示這按鈕)";
		}
		System.out.println("Test End");
		System.out.println("-------------------------------------------------------");
		return "Test success";
	}

	@ResponseBody
	@RequestMapping(value = "/searchTeam_like", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public String searchTeam_like(@RequestParam("teamName") String teamName)
	{
		return null;
	}

	@RequestMapping(value = "/clickTeam")
	public String clickTeam(HttpSession session)
	{
		try
		{
			MemberVO memberVO = (MemberVO) session.getAttribute("LoginOK");
			List teamMemberList = teamMemberService.findByTeamMemberId(memberVO.getMemberId());
			if (teamMemberList.isEmpty())
			{
				return "";
			}
			else
			{

			}
		}
		catch (Exception e)
		{

		}
		return null;
	}

	@RequestMapping(value = "/createTeamPage")
	public String createTeamPage(HttpSession session, HttpServletRequest request)
	{
		MemberVO memberVO = null;
		try
		{
			memberVO = (MemberVO) session.getAttribute("LoginOK");
			List<TeamVO> otherList = teamService.getOtherTeamList(memberVO.getMemberId());
			request.setAttribute("otherList", otherList);
			List<TeamVO> myList = teamService.getMyTeamList(memberVO.getMemberId());
			request.setAttribute("myList", myList);
			return "team/createteam";
		}
		catch (Exception e)
		{
			e.printStackTrace();
			System.out.println("fuck");
			return "";
		}

	}

}
