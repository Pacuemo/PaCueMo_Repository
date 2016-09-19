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

import com.google.gson.Gson;

import _10_steven_facade.StevenFacade;
import _10_team_service.TeamService;
import _11_teammember_service.TeamMemberService;
import _14_teamapply_service.TeamApplyService;
import _9_10_team_model.TeamVO;
import _9_14_teamapply_model.TeamApplyVO;
import _9_41_member_model.MemberVO;

@Controller
@RequestMapping("/team")
public class TeamController_Spring
{
	@Autowired
	private TeamMemberService teamMemberService;
	@Autowired
	private TeamService teamService;
	@Autowired
	private TeamApplyService teamApplyService;
	@Autowired
	private StevenFacade stevenFacade;
	@Autowired
	private Gson gson;

	@ResponseBody
	@RequestMapping(value = "getTeamVO", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public String getTeamVO(Integer teamId)
	{
		System.out.println("Team_Controller : getTeamVO");
		System.out.println(gson.toJson(stevenFacade.getTeamById(teamId)));
		System.out.println("return teamVO jason");
		System.out.println("-------------------------------------------------------");
		return gson.toJson(stevenFacade.getTeamById(teamId));
	}

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

	@RequestMapping(value = "/updateTeam", method = RequestMethod.GET, produces = "text/plain ; charset=UTF-8")
	public String updateTeam(HttpServletRequest request, Integer teamId, String teamName, Integer teamProp, String content)
	{
		System.out.println("Team_Controller : updateTeam");
		try
		{
			TeamVO teamVO = teamService.getTeamById(teamId);
			teamVO.setTeamName(teamName);
			teamVO.setTeamProp(teamProp);
			teamVO.setContent(content);
			teamService.update(teamVO);
			request.setAttribute("teamId", teamVO.getTeamId());
		}
		catch (Exception e)
		{
			e.printStackTrace();
			System.out.println("fuck");
			return "???";
		}
		System.out.println("修改成功");
		System.out.println("-------------------------------------------------------");
		System.out.println("forward TeamPage (GET)");
		return "forward:/TeamServlet";
	}

	@ResponseBody
	@RequestMapping(value = "/searchTeam_like", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public String searchTeam_like(@RequestParam("teamName") String teamName)
	{
		return null;
	}

//------------------------------------------------------------Page------------------------------------------------------------

	@RequestMapping(value = "/createTeamPage")	// Page
	public String createTeamPage(HttpSession session, HttpServletRequest request)
	{
		System.out.println("Team_Controller : getcreateTeamPage");
		MemberVO memberVO = null;

		memberVO = (MemberVO) session.getAttribute("LoginOK");
		List<TeamVO> otherList = teamService.getOtherTeamList(memberVO.getMemberId());
		request.setAttribute("otherList", otherList);
		List<TeamVO> myList = teamService.getMyTeamList(memberVO.getMemberId());
		request.setAttribute("myList", myList);
		List<Integer> mineTeamIdList = teamService.find_TeamId_With_TeamHead(memberVO.getMemberId());
		request.setAttribute("mineTeamIdList", mineTeamIdList);
		List<TeamApplyVO> myTeamApplyVOs = teamApplyService.getTeamApplyVOsById(memberVO.getMemberId());
		request.setAttribute("myTeamApplyVOs", myTeamApplyVOs);
		request.setAttribute("pageForSideBar", "createteam");
//		for (TeamApplyVO teamApplyVO : myTeamApplyVOs)
//		{
//			System.out.println(teamApplyVO.getTeamId());
//		}
		System.out.println("成功導入");
		System.out.println("-------------------------------------------------------");
		return "team/createteam";
	}

	@RequestMapping(value = "/settingTeamPage")	// Page
	public String settingTeamPage(HttpSession session, HttpServletRequest request, Integer teamId)
	{
		System.out.println("Team_Controller : getsettingTeamPage");
		request.removeAttribute("teamVO");
		TeamVO teamVO = teamService.getTeamById(teamId);

		System.out.println(teamVO.getTeamName());
		request.setAttribute("teamVO", teamVO);
		request.setAttribute("teamId", teamVO.getTeamId());
		request.setAttribute("teamName", teamVO.getTeamName());
		request.setAttribute("teamProp", teamVO.getTeamProp());
		request.setAttribute("teamHead", teamVO.getTeamHead());
		request.setAttribute("content", teamVO.getContent());
		request.setAttribute("pageForSideBar", "haveTeamId");
		request.setAttribute("teamExsist", "Mine");

		MemberVO memberVO = (MemberVO) session.getAttribute("LoginOK");
		List<TeamVO> myList = teamService.getMyTeamList(memberVO.getMemberId());
		request.setAttribute("myList", myList);

		System.out.println("成功導入");
		System.out.println("-------------------------------------------------------");
		return "team/teamsetting";

	}

}
