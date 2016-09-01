package _9_24_leagueClub_model;

import java.io.Serializable;

import org.springframework.stereotype.Component;

import _9_21_club_model.ClubVO;

@Component("LeagueClubVO")
public class LeagueClubVO implements Serializable
{
	private static final long serialVersionUID = 1L;

	int leagueId;
	int clubId;
	ClubVO clubVO;

	public LeagueClubVO()
	{

	}

	public LeagueClubVO(int leagueId, int clubId)
	{
		this.leagueId = leagueId;
		this.clubId = clubId;
	}

	public int getLeagueId()
	{
		return leagueId;
	}

	public void setLeagueId(int leagueId)
	{
		this.leagueId = leagueId;
	}

	public int getClubId()
	{
		return clubId;
	}

	public void setClubId(int clubId)
	{
		this.clubId = clubId;
	}

	public ClubVO getClubVO()
	{
		return clubVO;
	}

	public void setClubVO(ClubVO clubVO)
	{
		this.clubVO = clubVO;
	}

}
