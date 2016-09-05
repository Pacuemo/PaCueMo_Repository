package _22_league_controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;

import _22_league_service._22_league_service;

@Controller
@RequestMapping("/league")
public class _22_league_controller
{
	@Autowired
	private _22_league_service service;
	@Autowired
	private Gson gson;

//	------------------------介紹頁面----------------------------------------------
	@RequestMapping(value = "/introduce", method = RequestMethod.GET)
	public String introduce()
	{
		return "league/introduce";
	}

//----------------------查詢全部聯賽名稱----------------------------------------------
	@RequestMapping(value = "/getLeagueInfos", method = RequestMethod.GET)
	public String getLeagueInfo(HttpServletRequest request)
	{
		request.setAttribute("leagues", service.getAll());
		return "league/leagueInfo";
	}

//--------------------- 查詢單一聯賽名稱--------------------------------------------------	
	@RequestMapping(value = "/info", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	public String getInfo(@RequestParam("leagueId") int leagueId, HttpServletRequest request)
	{
		return gson.toJson(service.getOne(leagueId));
	}
}
