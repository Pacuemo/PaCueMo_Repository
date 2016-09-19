package _14_teamapply_controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import _10_team_service.TeamService;
import _11_teammember_service.TeamMemberService;
import _14_teamapply_service.TeamApplyService;
import _9_14_teamapply_model.TeamApplyVO;
import _9_41_member_model.MemberVO;

@Controller
@RequestMapping("/tm_apply")
public class TeamApplyController_Spring
{
	@Autowired
	private TeamApplyService teamApplyService;
	@Autowired
	private TeamMemberService teamMemberService;
	@Autowired
	private TeamService teamService;
	@Autowired
	private Gson gson;

	@RequestMapping(value = "/applyTeam", method = RequestMethod.GET, produces = "text/plain ; charset=UTF-8")
	public String applyTeam(HttpServletRequest request, HttpSession session, Integer btn_apply, String page)
	{
		System.out.println("Team_Controller : applyTeam");
		try
		{
			MemberVO memberVO = (MemberVO) session.getAttribute("LoginOK");
			teamApplyService.add(btn_apply, memberVO.getMemberId());
			request.setAttribute("teamId", btn_apply);	//set Att
		}
		catch (Exception e)
		{
			e.printStackTrace();
			System.out.println("fuck");
			return "nerver_happen";
		}
		System.out.println("申請成功");
		System.out.println("-------------------------------------------------------");
		if (page.equals("main"))
		{
			System.out.println("forward main");
			request.setAttribute("teamId", btn_apply);	//set Att
			return "forward:/TeamServlet";
		}
		else
		{
			System.out.println("forward ctp");
			return "forward:/spring/team/createTeamPage";
		}
	}

	@RequestMapping(value = "/cancel", method = RequestMethod.GET, produces = "text/plain ; charset=UTF-8")
	public String cancle(HttpServletRequest request, HttpSession session, Integer btn_cancel, String page)
	{
		System.out.println("Team_Controller : cancel");
		try
		{
			MemberVO memberVO = (MemberVO) session.getAttribute("LoginOK");
			teamApplyService.cancel(btn_cancel, memberVO.getMemberId());
			request.setAttribute("teamId", btn_cancel);	//set Att
		}
		catch (Exception e)
		{
			e.printStackTrace();
			System.out.println("fuck");
			return "nerver_happen";
		}
		System.out.println("取消成功");
		System.out.println("-------------------------------------------------------");
		if (page.equals("main"))
		{
			System.out.println("forward main");
			request.setAttribute("teamId", btn_cancel);	//set Att
			return "forward:/TeamServlet";
		}
		else
		{
			System.out.println("forward ctp");
			return "forward:/spring/team/createTeamPage";
		}
	}

	@ResponseBody
	@RequestMapping(value = "countChecked", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public String countChecked(@RequestParam("teamId") int teamId)
	{
		int msg = teamApplyService.count_Checked(teamId);
		System.out.println("=========" + msg);
		return gson.toJson(msg);
	}

	@ResponseBody
	@RequestMapping(value = "applyCheck", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public String applyChek(@RequestParam("teamId") int teamId)
	{
		List<TeamApplyVO> applyList = teamApplyService.get_TeamApply(teamId);
		return gson.toJson(applyList);
	}

	@ResponseBody
	@RequestMapping(value = "countChange", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public String countChange(@RequestParam("teamId") int teamId)
	{
		int msg = teamApplyService.change_checked(teamId);
		return gson.toJson(msg);
	}

	@ResponseBody
	@RequestMapping(value = "agreeApply", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String agreeApply(@RequestParam("teamId") int teamId, @RequestParam("memberId") String memberId)
	{
		String msg = teamApplyService.checkJoinTeam(teamId, memberId);
		Map<String, String> message = new HashMap<String, String>();
		message.put("status", msg);
		return gson.toJson(message);
	}

	@ResponseBody
	@RequestMapping(value = "rejectApply", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String deleteApply(@RequestParam("teamId") int teamId, @RequestParam("memberId") String memberId)
	{
		String msg = teamApplyService.rejectJoinTeam(teamId, memberId);
		Map<String, String> message = new HashMap<String, String>();
		message.put("status", msg);
		return gson.toJson(message);
	}

}
