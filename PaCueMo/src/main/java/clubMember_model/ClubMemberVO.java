package clubMember_model;

import java.sql.Date;

public class ClubMemberVO
{

	private int clubId;
	private int clubMemberId;
	private Date joinDate;

//    private MemberVO member;
	public int getClubId()
	{
		return clubId;
	}

	public void setClubId(int clubId)
	{
		this.clubId = clubId;
	}

	public int getClubMemberId()
	{
		return clubMemberId;
	}

	public void setClubMemberId(int clubMemberId)
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
//	public MemberVO getMember()
//	{
//		return member;
//	}
//	public void setMember(MemberVO member)
//	{
//		this.member = member;
//	}

}
