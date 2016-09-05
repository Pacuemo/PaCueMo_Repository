package _9_23_league_model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Component;

import _9_24_leagueClub_model.LeagueClubVO;
import _9_25_leagueRecord_model.LeagueRecordVO;
import _9_31_court_model.CourtVO;

@Component("LeagueVO")
public class LeagueVO implements Serializable
{

	private static final long serialVersionUID = 1L;
	private Integer leagueID;
	private String leagueName;
	private Integer clubAmount;
	private Date startDate;
	private Date endDate;
	private Integer placeID;
	private CourtVO courtVO;
	private List<LeagueClubVO> leagueClubVOs;
	private List<LeagueRecordVO> leagueRecordVOs;

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

	public CourtVO getCourtVO()
	{
		return courtVO;
	}

	public void setCourtVO(CourtVO courtVO)
	{
		this.courtVO = courtVO;
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

	public List<LeagueClubVO> getLeagueClubVOs()
	{
		return leagueClubVOs;
	}

	public void setLeagueClubVOs(List<LeagueClubVO> leagueClubVOs)
	{
		this.leagueClubVOs = leagueClubVOs;
	}

	public List<LeagueRecordVO> getLeagueRecordVOs()
	{
		return leagueRecordVOs;
	}

	public void setLeagueRecordVOs(List<LeagueRecordVO> leagueRecordVOs)
	{
		this.leagueRecordVOs = leagueRecordVOs;
	}

}
