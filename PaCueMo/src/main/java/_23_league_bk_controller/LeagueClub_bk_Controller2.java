package _23_league_bk_controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import _22_league_service.LeagueClub_Service;
import _22_league_service.LeagueRecord_Service;
import _22_league_service.League_Service;
import _9_24_leagueClub_model.LeagueClubVO;
import _9_25_leagueRecord_model.LeagueRecordVO;

@Controller
@RequestMapping(value = "/leagueClubBackStage")
public class LeagueClub_bk_Controller2
{

	@Autowired
	private League_Service league_Service;
	@Autowired
	private Gson gson;
	@Autowired
	private LeagueClub_Service leagueClub_Service;
	@Autowired
	private LeagueRecord_Service leagueRecord_Service;

//查詢	
	@RequestMapping(value = "/getLeagueClub", method = RequestMethod.GET)
	public String getLeague(int leagueId, String leagueName, HttpServletRequest req)
	{
		List<LeagueClubVO> leagueClubs = leagueClub_Service.get_All(leagueId);
		List<String> leagueclubName = new ArrayList<String>();

		for (LeagueClubVO vo : leagueClubs)
		{
			leagueclubName.add(vo.getClubVO().getClubName());
		}
		req.setAttribute("leagueName", leagueName);
		req.setAttribute("LeagueClubVOs", leagueClubs);
		req.setAttribute("LeagueRecordVOs", leagueRecord_Service.get_All_LeagueReacords(leagueId));
		req.setAttribute("LeagueclubNames", gson.toJson(leagueclubName));
		return "bk_league/leagueClub";
	}

	//修改
	@ResponseBody
	@RequestMapping(value = "/updateLeagueClubVO", method = RequestMethod.POST)
	public String updateLeague(@RequestBody LeagueClubVO leagueClubVO)
	{

		int success = leagueClub_Service.update_LeagueClub(leagueClubVO);
		Map<String, Integer> message = new HashMap<String, Integer>();
		message.put("status", success);
		return gson.toJson(message);
	}

	//刪除
	@ResponseBody
	@RequestMapping(value = "/deleteLeagueClub", method = RequestMethod.GET)
	public String addLeague(int leagueId, int clubId)
	{
		int success = leagueClub_Service.delete_league_club(leagueId, clubId);
		Map<String, Integer> message = new HashMap<String, Integer>();
		message.put("status", success);
		return gson.toJson(message);
	}

	//修改
	@ResponseBody
	@RequestMapping(value = "/updateLeagueRecord", method = RequestMethod.POST)
	public String updateLeagueRecord(@RequestBody LeagueRecordVO leagueRecordVO)
	{

		int success = leagueRecord_Service.update_LeagueRecord(leagueRecordVO);
		Map<String, Integer> message = new HashMap<String, Integer>();
		message.put("status", success);
		return gson.toJson(message);
	}

}
