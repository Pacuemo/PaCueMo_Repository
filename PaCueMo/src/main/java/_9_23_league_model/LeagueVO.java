package _9_23_league_model;

import java.util.Date;

public class LeagueVO
{

	private Integer leagueID;
	private String leagueName;
	private Integer clubAmount;
	private Date startDate;
	private Date endDate;
	private Integer placeID;

	public LeagueVO()
	{
	};

	public LeagueVO(Integer leagueID, String leagueName, Integer clubAmount, Date startDate, Date endDate, Integer placeID)
	{
		this.leagueID = leagueID;
		this.leagueName = leagueName;
		this.clubAmount = clubAmount;
		this.startDate = startDate;
		this.endDate = endDate;
		this.placeID = placeID;
	}

	public Integer getLeagueID()
	{
		return leagueID;
	}

	public void setLeagueID(Integer leagueID)
	{
		this.leagueID = leagueID;
	}

	public String getLeagueName()
	{
		return leagueName;
	}

	public void setLeagueName(String leagueName)
	{
		this.leagueName = leagueName;
	}

	public Integer getClubAmount()
	{
		return clubAmount;
	}

	public void setClubAmount(Integer clubAmount)
	{
		this.clubAmount = clubAmount;
	}

	public Date getStartDate()
	{
		return startDate;
	}

	public void setStartDate(Date startDate)
	{
		this.startDate = startDate;
	}

	public Date getEndDate()
	{
		return endDate;
	}

	public void setEndDate(Date endDate)
	{
		this.endDate = endDate;
	}

	public Integer getPlaceID()
	{
		return placeID;
	}

	public void setPlaceID(Integer placeID)
	{
		this.placeID = placeID;
	}

}
