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
	public String joinTeam(HttpServletRequest request, HttpSession session, Integer btn_join, String page)
	{
		System.out.println("Team_Controller : joinTeam");
		try
		{
			MemberVO memberVO = (MemberVO) session.getAttribute("LoginOK");
			teamMemberService.add(btn_join, memberVO.getMemberId());
		}
		catch (Exception e)
		{
			e.printStackTrace();
			System.out.println("fuck");
			return "有隊伍加不了(不會顯示這按鈕)";
		}
		System.out.println("加入成功");
		System.out.println("-------------------------------------------------------");
		if (page.equals("main"))
		{
			System.out.println("forward main");
			request.setAttribute("teamId", btn_join);	//set Att
			return "forward:/TeamServlet";
		}
		else
		{
			System.out.println("forward ctp");
			return "forward:createTeamPage";
		}
	}

	@RequestMapping(value = "/abortTeam", method = RequestMethod.GET, produces = "text/plain ; charset=UTF-8")
	public String abortTeam(HttpServletRequest request, HttpSession session, String page, Integer btn_abort)
	{
		System.out.println("Team_Controller : abortTeam");
		try
		{
			MemberVO memberVO = (MemberVO) session.getAttribute("LoginOK");
			teamMemberService.deleteOne(btn_abort, memberVO.getMemberId());
		}
		catch (Exception e)
		{
			e.printStackTrace();
			System.out.println("fuck");
			return "???";
		}
		System.out.println("退出成功");
		System.out.println("-------------------------------------------------------");
		if (page.equals("main"))
		{
			System.out.println("forward main");
			request.setAttribute("teamId", btn_abort);	//set Att
			return "forward:/TeamServlet";
		}
		else
		{
			System.out.println("forward ctp");
			return "forward:createTeamPage";
		}
	}

	@RequestMapping(value = "/disbandTeam", method = RequestMethod.GET, produces = "text/plain ; charset=UTF-8")
	public String disbandTeam(HttpServletRequest request, Integer btn_disband, String memberId, String page)
	{
		System.out.println("Team_Controller : disbandTeam");
		try
		{
			teamService.delete(btn_disband);
		}
		catch (Exception e)
		{
			e.printStackTrace();
			System.out.println("fuck");
			return "???";
		}
		System.out.println("解散成功");
		System.out.println("-------------------------------------------------------");
//		if (page.equals("main"))
//		{
//			System.out.println("forward main");
//			request.setAttribute("teamId", btn_disband);	//set Att
//			return "forward:/TeamServlet";
//		}
//		else
//		{
//			System.out.println("forward ctp");
//			return "forward:createTeamPage";
//		}
		System.out.println("forward ctp");
		return "forward:createTeamPage";
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
		System.out.println("Team_Controller : getcreateTeamPage");
		MemberVO memberVO = null;
		try
		{
			memberVO = (MemberVO) session.getAttribute("LoginOK");
			List<TeamVO> otherList = teamService.getOtherTeamList(memberVO.getMemberId());
			request.setAttribute("otherList", otherList);
			List<TeamVO> myList = teamService.getMyTeamList(memberVO.getMemberId());
			request.setAttribute("myList", myList);
			List<Integer> mineTeamIdList = teamService.find_TeamId_With_TeamHead(memberVO.getMemberId());
			request.setAttribute("mineTeamIdList", mineTeamIdList);

			System.out.println("成功導入");
			System.out.println("-------------------------------------------------------");
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
