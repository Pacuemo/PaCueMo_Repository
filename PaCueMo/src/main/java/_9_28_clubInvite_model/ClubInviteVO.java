package _9_28_clubInvite_model;

import java.sql.Date;

import org.springframework.stereotype.Component;

import _9_21_club_model.ClubVO;
import _9_41_member_model.MemberVO;

@Component
public class ClubInviteVO
{
	private int clubId;
	private String memberId;
	private String clubMemberId;
	private Date inviteDay;
	private MemberVO memberVO;
	private MemberVO clubMemberVO;
	private ClubVO clubVO;

	public ClubInviteVO()
	{
	}

	public ClubInviteVO(int clubId, String memberId, String clubMemberId, Date inviteDay)
	{

		this.clubId = clubId;
		this.memberId = memberId;
		this.clubMemberId = clubMemberId;
		this.inviteDay = inviteDay;
	}

	public int getClubId()
	{
		return clubId;
	}

	public void setClubId(int clubId)
	{
		this.clubId = clubId;
	}

	public String getMemberId()
	{
		return memberId;
	}

	public void setMemberId(String memberId)
	{
		this.memberId = memberId;
	}

	public String getClubMemberId()
	{
		return clubMemberId;
	}

	public void setClubMemberId(String clubMemberId)
	{
		this.clubMemberId = clubMemberId;
	}

	public Date getInviteDay()
	{
		return inviteDay;
	}

	public void setInviteDay(Date inviteDay)
	{
		this.inviteDay = inviteDay;
	}

	public MemberVO getMemberVO()
	{
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO)
	{
		this.memberVO = memberVO;
	}

	public MemberVO getClubMemberVO()
	{
		return clubMemberVO;
	}

	public void setClubMemberVO(MemberVO clubMemberVO)
	{
		this.clubMemberVO = clubMemberVO;
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
