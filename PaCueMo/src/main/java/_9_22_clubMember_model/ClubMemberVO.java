package _9_22_clubMember_model;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

import _9_41_member_model.MemberVO;

@Component
public class ClubMemberVO implements Serializable
{

	private static final long serialVersionUID = 1L;

	private int clubId;
	private String clubMemberId;
	private Date joinDate;
	private MemberVO member;

	public ClubMemberVO()
	{

	}

	public ClubMemberVO(int clubId, String clubMemberId, Date joinDate)
	{
		super();
		this.clubId = clubId;
		this.clubMemberId = clubMemberId;
		this.joinDate = joinDate;
	}

	public int getClubId()
	{
		return clubId;
	}

	public void setClubId(int clubId)
	{
		this.clubId = clubId;
	}

	public String getClubMemberId()
	{
		return clubMemberId;
	}

	public void setClubMemberId(String clubMemberId)
	{
		this.clubMemberId = clubMemberId;
	}

	public Date getJoinDate()
	{
		return joinDate;
	}

	public void setJoinDate(Date joinDate)
	{
		this.joinDate = joinDate;
	}

	public MemberVO getMember()
	{
		return member;
	}

	public void setMember(MemberVO member)
	{
		this.member = member;
	}

}
