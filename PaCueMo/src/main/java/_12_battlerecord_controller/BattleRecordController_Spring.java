package _12_battlerecord_controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import _10_steven_facade.StevenFacade;
import _10_team_service.TeamService;
import _11_teammember_service.TeamMemberService;
import _31_court_service.CourtService;
import _9_10_team_model.TeamVO;
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
	private Gson gson;

	@ResponseBody
	@RequestMapping(value = "/getCourtVOs", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public String getCourtVOs(String address)
	{
		System.out.println("BattleRecord_Controller : getCourtVO");

		CourtService courtService = new CourtService();
		System.out.println("回傳場地VOs 格式JSON");

		System.out.println("-------------------------------------------------------");
		return gson.toJson(courtService.findByCourtName(address));
	}

	@ResponseBody
	@RequestMapping(value = "/reportTeamA", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public String reportTeamA(String address)
	{
		System.out.println("BattleRecord_Controller : reportTeamA");

		CourtService courtService = new CourtService();
		System.out.println("回傳場地VOs 格式JSON");

		System.out.println("-------------------------------------------------------");
		return gson.toJson(courtService.findByCourtName(address));
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
	public String getLetsBattlePage(HttpSession session, HttpServletRequest request)
	{
		System.out.println("BattleRecord_Controller : getLetsBattlePage");
		MemberVO memberVO = null;
		try
		{
			memberVO = (MemberVO) session.getAttribute("LoginOK");
			List<TeamVO> mineTeamVOs = stevenFacade.find_TeamVOs_With_TeamHead(memberVO.getMemberId());
			request.setAttribute("mineTeamVOs", mineTeamVOs);		//Set Att

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
