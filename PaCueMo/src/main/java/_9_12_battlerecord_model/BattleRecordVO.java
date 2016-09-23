package _9_12_battlerecord_model;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

import _9_10_team_model.TeamVO;
import _9_31_court_model.CourtVO;

@Component
public class BattleRecordVO
{
	private Integer battleId;
	private Integer teamIdA;
	private Integer teamIdB;
	private Integer battleStatus;
	private Integer courtId;
	private Integer battleMode;
	private Double battleBet;
	private Timestamp battleDateTime;
	private Integer result;
	private Integer reportA;
	private Integer reportB;
	private TeamVO teamAVO;
	private TeamVO teamBVO;
	private CourtVO courtVO;

	public BattleRecordVO()
	{

	}

	public BattleRecordVO(Integer battleId, Integer teamIdA, Integer teamIdB, Integer battleStatus, Integer courtId, Integer battleMode,
			Double battleBet, Timestamp battleDateTime, Integer result, Integer reportA, Integer reportB)
	{
		super();
		this.battleId = battleId;
		this.teamIdA = teamIdA;
		this.teamIdB = teamIdB;
		this.battleStatus = battleStatus;
		this.courtId = courtId;
		this.battleMode = battleMode;
		this.battleBet = battleBet;
		this.battleDateTime = battleDateTime;
		this.result = result;
		this.reportA = reportA;
		this.reportB = reportB;
	}

	public Integer getBattleId()
	{
		return battleId;
	}

	public void setBattleId(Integer battleId)
	{
		this.battleId = battleId;
	}

	public Integer getTeamIdA()
	{
		return teamIdA;
	}

	public void setTeamIdA(Integer teamIdA)
	{
		this.teamIdA = teamIdA;
	}

	public Integer getTeamIdB()
	{
		return teamIdB;
	}

	public void setTeamIdB(Integer teamIdB)
	{
		this.teamIdB = teamIdB;
	}

	public Integer getBattleStatus()
	{
		return battleStatus;
	}

	public void setBattleStatus(Integer battleStatus)
	{
		this.battleStatus = battleStatus;
	}

	public Integer getCourtId()
	{
		return courtId;
	}

	public void setCourtId(Integer courtId)
	{
		this.courtId = courtId;
	}

	public Integer getBattleMode()
	{
		return battleMode;
	}

	public void setBattleMode(Integer battleMode)
	{
		this.battleMode = battleMode;
	}

	public Double getBattleBet()
	{
		return battleBet;
	}

	public void setBattleBet(Double battleBet)
	{
		this.battleBet = battleBet;
	}

	public Timestamp getBattleDateTime()
	{
		return battleDateTime;
	}

	public void setBattleDateTime(Timestamp battleDateTime)
	{
		this.battleDateTime = battleDateTime;
	}

	public Integer getResult()
	{
		return result;
	}

	public void setResult(Integer result)
	{
		this.result = result;
	}

	public Integer getReportA()
	{
		return reportA;
	}

	public void setReportA(Integer reportA)
	{
		this.reportA = reportA;
	}

	public Integer getReportB()
	{
		return reportB;
	}

	public void setReportB(Integer reportB)
	{
		this.reportB = reportB;
	}

	public TeamVO getTeamAVO()
	{
		return teamAVO;
	}

	public void setTeamAVO(TeamVO teamAVO)
	{
		this.teamAVO = teamAVO;
	}

	public TeamVO getTeamBVO()
	{
		return teamBVO;
	}

	public void setTeamBVO(TeamVO teamBVO)
	{
		this.teamBVO = teamBVO;
	}

	public CourtVO getCourtVO()
	{
		return courtVO;
	}

	public void setCourtVO(CourtVO courtVO)
	{
		this.courtVO = courtVO;
	}
}
