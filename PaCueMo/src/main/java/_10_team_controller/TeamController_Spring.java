package _10_team_controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import _10_steven_facade.StevenFacade;
import _10_team_service.TeamService;
import _11_teammember_service.TeamMemberService;
import _12_battlerecord_service.BattleRecordService;
import _14_teamapply_service.TeamApplyService;
import _9_10_team_model.TeamVO;
import _9_12_battlerecord_model.BattleRecordVO;
import _9_14_teamapply_model.TeamApplyVO;
import _9_41_member_model.MemberDAO_interface_Spring;
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
	private BattleRecordService battleRecordService;
	@Autowired
	private MemberDAO_interface_Spring memberDAO;
	@Autowired
	private StevenFacade stevenFacade;
	@Autowired
	private JsonObject jsonObject;
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
			session.setAttribute("flag_addTeam", "t");
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
//			request.setAttribute("teamId", btn_join);	//set Att
			return "redirect:/TeamServlet?teamId=" + btn_join;
		}
		else
		{
			System.out.println("forward ctp");
			return "redirect:createTeamPage";
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
			return "redirect:/";
		}
		System.out.println("退出成功");
		System.out.println("-------------------------------------------------------");
		if (page.equals("main"))
		{
			System.out.println("forward main");
//			request.setAttribute("teamId", btn_abort);	//set Att
			return "redirect:/TeamServlet?teamId=" + btn_abort;
		}
		else
		{
			System.out.println("forward ctp");
			return "redirect:createTeamPage";
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
			return "redirect:/";
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
		return "redirect:createTeamPage";
	}

	@RequestMapping(value = "/updateTeam", method = RequestMethod.GET, produces = "text/plain ; charset=UTF-8")
	public String updateTeam(HttpServletRequest request, Integer teamId, String teamName, Integer teamProp, String content, String location)
	{
		System.out.println("Team_Controller : updateTeam");
		try
		{
			TeamVO teamVO = teamService.getTeamById(teamId);
			teamVO.setTeamName(teamName);
			teamVO.setTeamProp(teamProp);
			teamVO.setContent(content);
			teamVO.setLocation(location);
			teamService.update(teamVO);
//			request.setAttribute("teamId", teamId);
		}
		catch (Exception e)
		{
			e.printStackTrace();
			System.out.println("fuck");
			return "redirect:/";
		}
		System.out.println("修改成功");
		System.out.println("-------------------------------------------------------");
		System.out.println("forward TeamPage (GET)");
		return "redirect:/TeamServlet?teamId=" + teamId;
	}

//	@ResponseBody
	@RequestMapping(value = "/searchTeamByL_N", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public String searchTeamByL_N(String teamName, String location, String teamHead, HttpServletRequest request, HttpSession session)
	{
		System.out.println("Team_Controller : searchTeamByL_N");
		if (null == teamName)
		{
			teamName = "";
		}
		if (null == location)
		{
			location = "";
		}
		MemberVO memberVO = (MemberVO) session.getAttribute("LoginOK");
		List<TeamVO> teamVOs = teamService.searchTeamByLocationAndName(location.trim(), teamName.trim(), memberVO.getMemberId());
//		System.out.println("查詢成功 - 轉換特定Json格式");
//		JsonObject data = new JsonObject();
//		JsonArray array = new JsonArray();
//		JsonObject obj = new JsonObject();

//		for (TeamVO teamVO : teamVOs)
//		{
//			obj.addProperty("suggestion", teamVO.getTeamName());
//			obj.addProperty("url", "1");
//			array.add(obj);
//		}
//		data.add("results", array);
		request.setAttribute("teamOppVOs", teamVOs);
		System.out.println("-------------------------------------------------------");
		return "forward:/spring/battle_rec/introduce";
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

		request.setAttribute("flag_addTeam", "f");
		if (session.getAttribute("flag_addTeam") != null)
		{
			System.out.println("session flag_addTeam 存在! 現在移除");
			session.removeAttribute("flag_addTeam");
			System.out.println("設定 request flag_addTeam!");
			request.setAttribute("flag_addTeam", "t");
		}

		memberVO.setMemberPoint(memberDAO.findByPrimaryKey(memberVO.getMemberId()).getMemberPoint());
		session.setAttribute("LoginOK", memberVO);

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
		try
		{
			request.removeAttribute("teamVO");
			TeamVO teamVO = teamService.getTeamById(teamId);

			System.out.println(teamVO.getTeamName());
			request.setAttribute("teamVO", teamVO);
			request.setAttribute("teamId", teamVO.getTeamId());
			request.setAttribute("teamName", teamVO.getTeamName());
			request.setAttribute("teamProp", teamVO.getTeamProp());
			request.setAttribute("teamHead", teamVO.getTeamHead());
			request.setAttribute("location", teamVO.getLocation());
			request.setAttribute("content", teamVO.getContent());
			request.setAttribute("pageForSideBar", "haveTeamId");
			request.setAttribute("teamExsist", "Mine");

			MemberVO memberVO = (MemberVO) session.getAttribute("LoginOK");
			List<TeamVO> myList = teamService.getMyTeamList(memberVO.getMemberId());
			request.setAttribute("myList", myList);

			List<MemberVO> myFriendVOs = teamMemberService.wrongWayGetMemberVOs(teamId, memberVO.getMemberId());
			request.setAttribute("myFriendVOs", myFriendVOs);
		}
		catch (Exception e)
		{
			e.printStackTrace();
			System.out.println("fuck");
			return "redirect:/";
		}
		System.out.println("成功導入");
		System.out.println("-------------------------------------------------------");
		return "team/teamsetting";

	}

	@RequestMapping(value = "/battleInfo")	// Page
	public String battleInfo(HttpSession session, HttpServletRequest request, Integer teamId)
	{
		try
		{
			System.out.println("Team_Controller : battleInfo");
			request.removeAttribute("teamVO");
			TeamVO teamVO = stevenFacade.getTeamById(teamId);
			System.out.println(teamVO.getTeamName());
			request.setAttribute("teamVO", teamVO);

			System.out.println("Try get battleRecVOs");
			List<BattleRecordVO> battleRecordVOs = battleRecordService.findByTeamIdB_NotDec(teamVO.getTeamId());
			System.out.println("get " + battleRecordVOs.size() + " data!");
			request.setAttribute("battleRecordVOs", battleRecordVOs);

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

			List<MemberVO> myFriendVOs = teamMemberService.wrongWayGetMemberVOs(teamId, memberVO.getMemberId());
			request.setAttribute("myFriendVOs", myFriendVOs);

		}
		catch (Exception e)
		{
			e.printStackTrace();
			return "redirect:/";
		}
		System.out.println("成功導入");
		System.out.println("-------------------------------------------------------");
		return "team/battleInfo";

	}

}
