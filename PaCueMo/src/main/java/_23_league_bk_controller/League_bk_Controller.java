package _23_league_bk_controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import _22_league_service.League_Service;
import _9_23_league_model.LeagueVO;

@Controller
@RequestMapping(value = "/leagueBackStage")
public class League_bk_Controller
{

	@Autowired
	private League_Service league_Service;
	@Autowired
	private Gson gson;

//查詢	
	@RequestMapping(value = "/league", method = RequestMethod.GET)
	public String getLeague(HttpServletRequest req)
	{
		req.setAttribute("leagueVOs", league_Service.getAll());
		return "bk_league/league";
	}

	//修改
	@ResponseBody
	@RequestMapping(value = "/updateLeague", method = RequestMethod.POST)
	public String updateLeague(@RequestBody LeagueVO leagueVO)
	{
		System.out.println(leagueVO.getLeagueID());
		int success = league_Service.updateLeague(leagueVO);
		Map<String, Integer> message = new HashMap<String, Integer>();
		message.put("status", success);
		return gson.toJson(message);
	}

	//新增
	@ResponseBody
	@RequestMapping(value = "/addLeague", method = RequestMethod.POST)
	public String addLeague(@RequestBody LeagueVO leagueVO)
	{
		int success = league_Service.add_League(leagueVO);
		Map<String, Integer> message = new HashMap<String, Integer>();
		message.put("status", success);
		return gson.toJson(message);
	}

}
