package _23_league_bk_controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import _22_league_service.FightRecord_Service;
import _22_league_service.LeagueRecord_Service;
import _9_26_fightRecord_model.FightRecordVO;

@Controller
@RequestMapping(value = "/fightRecordBackStage")
public class FightRecord_bk_Controller
{

	@Autowired
	private FightRecord_Service fightRecord_Service;
	@Autowired
	private LeagueRecord_Service leagueRecord_Service;
	@Autowired
	private Gson gson;

	//查詢
	@RequestMapping(value = "/getfightRecord", method = RequestMethod.GET)
	public String getfightRecord(int fightId, HttpServletRequest request)
	{
		List<FightRecordVO> fightRecordVOs = fightRecord_Service.get_FightRecords_ByfightId(fightId);
		request.setAttribute("leagueRecordVO", leagueRecord_Service.get_By_FightId(fightId));
		request.setAttribute("fightRecordVOs", fightRecordVOs);
		request.setAttribute("fightId", fightId);
		return "bk_league/fightRecord";
	}

	//修改
	@ResponseBody
	@RequestMapping(value = "/updatefightRecord", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public String updatefightRecord(@RequestBody FightRecordVO fightRecordVO)
	{
		int success = fightRecord_Service.update_One_fightRecord(fightRecordVO);
		HashMap<String, Object> message = new HashMap<String, Object>();
		FightRecordVO vo = fightRecord_Service.get_One_fightRecord(fightRecordVO.getFightId(), fightRecordVO.getClubMemberId());
		message.put("status", success);
		message.put("fightRecordVO", vo);
		return gson.toJson(message);
	}
}
