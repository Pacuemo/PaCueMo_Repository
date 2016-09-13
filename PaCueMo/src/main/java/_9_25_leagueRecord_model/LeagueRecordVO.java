package _9_25_leagueRecord_model;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Component;

import _9_21_club_model.ClubVO;
import _9_26_fightRecord_model.FightRecordVO;

@Component("LeagueRecordVO")
public class LeagueRecordVO implements Serializable
{

	private static final long serialVersionUID = 1L;

	private int fightId;
	private int leagueId;
	private int clubIdA;
	private int clubIdB;
	private Date fightDateTime;
	private int rounds;
	private int scoreA;
	private int scoreB;
	private String totalTime;
	private int winner;
	private List<FightRecordVO> fightRecordVOs;
	private ClubVO clubA;
	private ClubVO clubB;

	public LeagueRecordVO()
	{

	}

	public LeagueRecordVO(int leagueId, int clubIdA, int clubIdB, Date fightDateTime, int rounds, int scoreA, int scoreB, String totalTime)
	{
		this.leagueId = leagueId;
		this.clubIdA = clubIdA;
		this.clubIdB = clubIdB;
		this.fightDateTime = fightDateTime;
		this.rounds = rounds;
		this.scoreA = scoreA;
		this.scoreB = scoreB;
		this.totalTime = totalTime;
		if (scoreA > scoreB)
		{
			this.winner = clubIdA;
		}
		else
		{
			this.winner = clubIdB;
		}
	}

	public LeagueRecordVO(int fightId, int leagueId, int clubIdA, int clubIdB, Date fightDateTime, int rounds, int scoreA, int scoreB, String totalTime)
	{
		this.fightId = fightId;
		this.leagueId = leagueId;
		this.clubIdA = clubIdA;
		this.clubIdB = clubIdB;
		this.fightDateTime = fightDateTime;
		this.rounds = rounds;
		this.scoreA = scoreA;
		this.scoreB = scoreB;
		this.totalTime = totalTime;
		if (scoreA > scoreB)
		{
			this.winner = clubIdA;
		}
		else
		{
			this.winner = clubIdB;
		}
	}

	public int getFightId()
	{
		return fightId;
	}

	public void setFightId(int fightId)
	{
		this.fightId = fightId;
	}

	public int getLeagueId()
	{
		return leagueId;
	}

	public void setLeagueId(int leagueId)
	{
		this.leagueId = leagueId;
	}

	public int getClubIdA()
	{
		return clubIdA;
	}

	public void setClubIdA(int clubIdA)
	{
		this.clubIdA = clubIdA;
	}

	public int getClubIdB()
	{
		return clubIdB;
	}

	public void setClubIdB(int clubIdB)
	{
		this.clubIdB = clubIdB;
	}

	public Date getFightDateTime()
	{
		return fightDateTime;
	}

	public void setFightDateTime(Date fightDateTime)
	{
		this.fightDateTime = fightDateTime;
	}

	public int getRounds()
	{
		return rounds;
	}

	public void setRounds(int rounds)
	{
		this.rounds = rounds;
	}

	public int getScoreA()
	{
		return scoreA;
	}

	public void setScoreA(int scoreA)
	{
		this.scoreA = scoreA;
	}

	public int getScoreB()
	{
		return scoreB;
	}

	public void setScoreB(int scoreB)
	{
		this.scoreB = scoreB;
	}

	public String getTotalTime()
	{
		return totalTime;
	}

	public void setTotalTime(String totalTime)
	{
		this.totalTime = totalTime;
	}

	public static long getSerialversionuid()
	{
		return serialVersionUID;
	}

	public List<FightRecordVO> getFightRecordVOs()
	{
		return fightRecordVOs;
	}

	public void setFightRecordVOs(List<FightRecordVO> fightRecordVOs)
	{
		this.fightRecordVOs = fightRecordVOs;
	}

	public ClubVO getClubA()
	{
		return clubA;
	}

	public void setClubA(ClubVO clubA)
	{
		this.clubA = clubA;
	}

	public ClubVO getClubB()
	{
		return clubB;
	}

	public void setClubB(ClubVO clubB)
	{
		this.clubB = clubB;
	}

	public int getWinner()
	{
		return winner;
	}

	public void setWinner(int winner)
	{
		this.winner = winner;
	}

}
