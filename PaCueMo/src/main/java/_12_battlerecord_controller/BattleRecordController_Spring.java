package _12_battlerecord_controller;

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
import _12_battlerecord_service.BattleRecordService;
import _31_court_service.CourtService;
import _9_10_team_model.TeamVO;
import _9_12_battlerecord_model.BattleRecordVO;
import _9_31_court_model.CourtVO;
import _9_41_member_model.MemberVO;

@Controller
@RequestMapping("/battle_rec")
public class BattleRecordController_Spring
{
	@Autowired
	private StevenFacade stevenFacade;
	@Autowired
	private TeamMemberService teamMemberService;
	@Autowired
	private TeamService teamService;
	@Autowired
	private BattleRecordService battleRecordService;
	@Autowired
	private Gson gson;

	@ResponseBody
	@RequestMapping(value = "/getCourtVOs", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public String getCourtVOs(String address)
	{
		System.out.println("BattleRecord_Controller : getCourtVO");
		System.out.println("address" + address);
		CourtService courtService = new CourtService();
		System.out.println("回傳場地VOs 格式JSON");
		List<CourtVO> courtVOs = courtService.findByCourtName(address.trim());
		for (CourtVO courtVO : courtVOs)
		{
			System.out.println(courtVO.getName());

		}
		System.out.println("-------------------------------------------------------");
		return gson.toJson(courtService.findByCourtName(address.trim()));
	}

	@ResponseBody
	@RequestMapping(value = "/reportTeamA", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public String reportTeamA(@RequestParam("battleId") Integer battleId, String resault)
	{
		System.out.println("BattleRecord_Controller : reportTeamA");
		BattleRecordVO battleRecordVO = battleRecordService.findById(battleId);
		if (resault.equals("win"))
		{
			battleRecordVO.setReportA(1);
		}
		else
		{
			battleRecordVO.setReportA(2);
		}
		battleRecordService.reportA(battleRecordVO);
		System.out.println("BattleRecord_Controller : OK");
		System.out.println("-------------------------------------------------------");
		return "success";
	}

	@ResponseBody
	@RequestMapping(value = "/reportTeamB", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public String reportTeamB(Integer battleId, String resault)
	{
		System.out.println("BattleRecord_Controller : reportTeamA");
		BattleRecordVO battleRecordVO = battleRecordService.findById(battleId);
		if (resault.equals("win"))
		{
			battleRecordVO.setReportB(2);
		}
		else
		{
			battleRecordVO.setReportB(1);
		}
		battleRecordService.reportA(battleRecordVO);
		System.out.println("BattleRecord_Controller : End");
		System.out.println("-------------------------------------------------------");
		return "success";
	}

//------------------------------------------Page-------------------------------------------	
	@RequestMapping(value = "/introduce") //Page
	public String getMainPage(HttpSession session, HttpServletRequest request)
	{
		System.out.println("BattleRecord_Controller : getMainPage");
		MemberVO memberVO = null;
		try
		{
			memberVO = (MemberVO) session.getAttribute("LoginOK");
			List<TeamVO> mineTeamIdList = teamService.find_TeamVOs_With_TeamHead(memberVO.getMemberId());
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

	@RequestMapping(value = "/letsbattle", method = RequestMethod.GET) //Page
	public String getLetsBattlePage(HttpSession session, HttpServletRequest request, Integer btn_OppTeamId)
	{
		System.out.println("BattleRecord_Controller : getLetsBattlePage");
		MemberVO memberVO = null;
		try
		{
			memberVO = (MemberVO) session.getAttribute("LoginOK");
			List<TeamVO> mineTeamVOs = stevenFacade.find_TeamVOs_With_TeamHead(memberVO.getMemberId());
			TeamVO oppTeamVO = stevenFacade.getTeamById(btn_OppTeamId);
			request.setAttribute("mineTeamVOs", mineTeamVOs);		//Set Att
			request.setAttribute("oppTeamVO", oppTeamVO);			//Set Att

		}
		catch (Exception e)
		{
			e.printStackTrace();
			System.out.println("fuck");
			return "";
		}
//		request.setAttribute("oppTeamId", btn_OppTeamId);		//Set Att
		System.out.println("成功導入");
		System.out.println("-------------------------------------------------------");
		return "battle_rec/letsbattle";
	}
}
