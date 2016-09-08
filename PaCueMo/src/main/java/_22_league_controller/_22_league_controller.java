package _22_league_controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import _22_league_service.FightRecord_Service;
import _22_league_service.League_Service;

@Controller
@RequestMapping("/league")
public class _22_league_controller
{
	@Autowired
	private League_Service leagueService;
	private FightRecord_Service fightRecordService;
	@Autowired
	private Gson gson;

//	------------------------介紹頁面----------------------------------------------
	@RequestMapping(value = "/introduce", method = RequestMethod.GET)
	public String introduce()
	{
		System.out.println("呼叫league_Controller:/introduce 聯賽介紹");
		System.out.println("轉入/league/introduce.jsp 介紹聯賽頁面");
		System.out.println("-------------------------------------------------------");
		return "league/introduce";
	}

//----------------------查詢全部聯賽名稱----------------------------------------------
	@RequestMapping(value = "/getLeagueInfos", method = RequestMethod.GET)
	public String getLeagueInfo(HttpServletRequest request)
	{
		System.out.println("呼叫league_Controller:/getLeagueInfos 全部聯賽資訊");
		request.setAttribute("leagues", leagueService.getAll());
		System.out.println("回傳多筆聯賽資訊 放入Request物件中 Key=leagues");
		System.out.println("轉入/league/leagueInfo.jsp 顯示聯賽資訊頁面");
		System.out.println("-------------------------------------------------------");
		return "league/leagueInfo";
	}

//--------------------- 查詢單一聯賽名稱--------------------------------------------------	
	@ResponseBody
	@RequestMapping(value = "/Info", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	public String getInfo(@RequestParam("leagueId") int leagueId, HttpServletRequest request)
	{
		System.out.println("呼叫league_Controller:/Info 查詢單一聯賽資訊 傳入聯賽Id:  " + leagueId);
		System.out.println("回傳單筆聯賽資料 格式JSON");
		System.out.println("-------------------------------------------------------");
		return gson.toJson(leagueService.getOne(leagueId));
	}

//----------------------查詢單場聯賽紀錄-------------------------------------------------	
	@RequestMapping(value = "/Info/one", method = RequestMethod.GET)
	public String getOneFightInfo(@RequestParam("fightId") int fightId, HttpServletRequest request)
	{
		System.out.println("呼叫league_Controller:/Info/one 查詢聯賽內單一場次球員資訊 傳入場次Id:  " + fightId);
		request.setAttribute("fightRecordVOs", fightRecordService.get_FightRecords_ByfightId(fightId));
		System.out.println("回傳多筆單場球員資訊 放入request物件中 Key=fightRecordVOs");
		System.out.println("轉入/league/recordInfos.jsp 顯示單場球員資訊頁面");
		System.out.println("-------------------------------------------------------");
		return "league/recordInfos";
	}
}
