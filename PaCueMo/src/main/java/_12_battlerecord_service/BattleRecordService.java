package _12_battlerecord_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Component;

import _00_config.RootConfig;
import _9_10_team_model.TeamDAO;
import _9_12_battlerecord_model.BattleRecordDAO_I;
import _9_12_battlerecord_model.BattleRecordVO;

@Component
public class BattleRecordService
{
	@Autowired
	private BattleRecordDAO_I battleRecordDAO;
	@Autowired
	private TeamDAO teamDAO;

	public BattleRecordService()
	{
	}

	public void add(BattleRecordVO battleRecordVO)
	{
		battleRecordDAO.add(battleRecordVO);
	}

	public void accept_Reject(Integer battleStatus, Integer battleId)
	{
		battleRecordDAO.accept_Reject(battleStatus, battleId);
	}

	public void reportA(BattleRecordVO battleRecordVO)
	{
		battleRecordDAO.reportA(battleRecordVO);
		if (battleRecordVO.getReportA() != 0 && battleRecordVO.getReportB() != 0)
		{
			updateResult(battleRecordVO);
		}
	}

	public void reportB(BattleRecordVO battleRecordVO)
	{
		battleRecordDAO.reportB(battleRecordVO);
		if (battleRecordVO.getReportA() != 0 && battleRecordVO.getReportB() != 0)
		{
			updateResult(battleRecordVO);
		}
	}

	//service 判斷是否呼叫此方法
	public void updateResult(BattleRecordVO battleRecordVO)
	{
		if (battleRecordVO.getResult() == 0)
		{
			battleRecordDAO.updateResult(battleRecordVO);
		}
	}

	public void delete(Integer batteleRecordId)
	{
		battleRecordDAO.delete(batteleRecordId);
	}

	public BattleRecordVO findById(Integer battleId)
	{
		return battleRecordDAO.findById(battleId);
	}

	public List<BattleRecordVO> findByTeamIdA(Integer teamIdA)
	{
		List<BattleRecordVO> battleRecordVOs = battleRecordDAO.findByTeamIdA(teamIdA);
		for (BattleRecordVO battleRecordVO : battleRecordVOs)
		{
			battleRecordVO.setTeamAVO(teamDAO.getTeamById(battleRecordVO.getTeamIdA()));
			battleRecordVO.setTeamBVO(teamDAO.getTeamById(battleRecordVO.getTeamIdB()));
		}
		return battleRecordVOs;
	}

	public List<BattleRecordVO> findByTeamIdB(Integer teamIdB)
	{
		List<BattleRecordVO> battleRecordVOs = battleRecordDAO.findByTeamIdB(teamIdB);
		for (BattleRecordVO battleRecordVO : battleRecordVOs)
		{
			battleRecordVO.setTeamAVO(teamDAO.getTeamById(battleRecordVO.getTeamIdA()));
			battleRecordVO.setTeamBVO(teamDAO.getTeamById(battleRecordVO.getTeamIdB()));
		}
		return battleRecordVOs;
	}

	public List<BattleRecordVO> getAll()
	{
		return battleRecordDAO.getAll();
	}

	public Double getAttendancePercent(Integer teamId)
	{
		return (100.0 - battleRecordDAO.getAbsencePercent(teamId));
	}

	public Double getWPCT(Integer teamId)
	{
		return battleRecordDAO.getWPCT(teamId);
	}

	public static void main(String[] args)
	{
		ApplicationContext context = new AnnotationConfigApplicationContext(RootConfig.class);
		BattleRecordService service = context.getBean(BattleRecordService.class);

		System.out.println(service.getAttendancePercent(4));
	}

}
