package _9_21_club_model;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

import _9_22_clubMember_model.ClubMemberVO;

public class ClubVO implements Serializable
{

	private static final long serialVersionUID = 1L;
	private int clubID;
	private String clubName;
	private String clubImageName;
	private Date clubDate;
	private int clubHead;
	private int clubProp;
	private List<ClubMemberVO> clubmembers;

	public ClubVO()
	{
	}

	public ClubVO(int clubID, String clubName, String clubImageName, Date clubDate, int clubHead, int clubProp, List<ClubMemberVO> clubmembers)
	{
		super();
		this.clubID = clubID;
		this.clubName = clubName;
		this.clubImageName = clubImageName;
		this.clubDate = clubDate;
		this.clubHead = clubHead;
		this.clubProp = clubProp;
		this.clubmembers = clubmembers;
	}

	public int getClubID()
	{
		return clubID;
	}

	public void setClubID(int clubID)
	{
		this.clubID = clubID;
	}

	public String getClubName()
	{
		return clubName;
	}

	public void setClubName(String clubName)
	{
		this.clubName = clubName;
	}

	public String getClubImageName()
	{
		return clubImageName;
	}

	public void setClubImageName(String clubImageName)
	{
		this.clubImageName = clubImageName;
	}

	public Date getClubDate()
	{
		return clubDate;
	}

	public void setClubDate(Date clubDate)
	{
		this.clubDate = clubDate;
	}

	public int getClubHead()
	{
		return clubHead;
	}

	public void setClubHead(int clubHead)
	{
		this.clubHead = clubHead;
	}

	public int getClubProp()
	{
		return clubProp;
	}

	public void setClubProp(int clubProp)
	{
		this.clubProp = clubProp;
	}

	public List<ClubMemberVO> getClubmembers()
	{
		return clubmembers;
	}

	public void setClubmembers(List<ClubMemberVO> clubmembers)
	{
		this.clubmembers = clubmembers;
	}

}
