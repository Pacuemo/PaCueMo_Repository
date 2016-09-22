package _12_battlerecord_controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
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

	@RequestMapping(value = "/createBattleTable", method = RequestMethod.POST)
	public String updateTeam(@ModelAttribute BattleRecordVO battleRecordVO, HttpSession session, HttpServletRequest request, String battleDate, String battleHr, String battleMin, Integer courtId)
	{
		System.out.println("BattleRecord_Controller : createBattleTable");
		try
		{
			String[] date = battleDate.split("/");
			int year;
			int month;
			int day;
			int hr;
			int min;
			try
			{
				year = Integer.valueOf(date[0]);
				month = Integer.valueOf(date[1]);
				day = Integer.valueOf(date[2]);
				hr = Integer.valueOf(battleHr);
				min = Integer.valueOf(battleMin);
			}
			catch (Exception e)
			{
				e.printStackTrace();
				System.out.println("date format error!");
				return "redirect:/";
			}
			GregorianCalendar gCalendar = new GregorianCalendar(year, month, day, hr, min);
			Date battleDate_util = gCalendar.getTime();
			Timestamp battleDateTime = new Timestamp(battleDate_util.getTime());
			battleRecordVO.setBattleDateTime(battleDateTime);
			battleRecordVO.setCourtId(courtId);
			battleRecordService.add(battleRecordVO);
		}
		catch (Exception e)
		{
			e.printStackTrace();
			System.out.println("fuck");
			return "redirect:/";
		}
		System.out.println("新增成功");
		System.out.println("-------------------------------------------------------");
		System.out.println("forward battle_recintroduce (GET)");
		return "redirect:/";
	}

	@ResponseBody
	@RequestMapping(value = "/getCourtVOs", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public String getCourtVOs(String address)
	{
		System.out.println("BattleRecord_Controller : getCourtVO");
		System.out.println("address" + address);
		CourtService courtService = new CourtService();
		System.out.println("回傳場地VOs 格式JSON");
		List<CourtVO> courtVOs = courtService.findByCourtName(address.trim());
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
			Map<String, String> current_date = new HashMap<String, String>();
			TeamVO oppTeamVO = stevenFacade.getTeamById(btn_OppTeamId);
			java.util.Date date = new Date();
			request.setAttribute("mineTeamVOs", mineTeamVOs);		//Set Att
			request.setAttribute("oppTeamVO", oppTeamVO);			//Set Att
			SimpleDateFormat sdf_date = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat sdf_hr = new SimpleDateFormat("HH");
			current_date.put("date", sdf_date.format(date));
			current_date.put("hr", sdf_hr.format(date));
			request.setAttribute("current_date", current_date);
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
