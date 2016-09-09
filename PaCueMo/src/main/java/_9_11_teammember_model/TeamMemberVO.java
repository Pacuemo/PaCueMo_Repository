package _9_11_teammember_model;

import java.sql.Date;

import _9_41_member_model.MemberVO;

public class TeamMemberVO
{
	private Integer teamId;
	private String teamMemberId;
	private Date joinDate;
	private MemberVO memberVO;

	public TeamMemberVO()
	{

	}

	public TeamMemberVO(Integer teamId, String teamMemberId, Date joinDate)
	{
		super();
		this.teamId = teamId;
		this.teamMemberId = teamMemberId;
		this.joinDate = joinDate;
	}

	public Integer getTeamId()
	{
		return teamId;
	}

	public void setTeamId(Integer teamId)
	{
		this.teamId = teamId;
	}

	public String getTeamMemberId()
	{
		return teamMemberId;
	}

	public void setTeamMemberId(String teamMemberId)
	{
		this.teamMemberId = teamMemberId;
	}

	public Date getJoinDate()
	{
		return joinDate;
	}

	public void setJoinDate(Date joinDate)
	{
		this.joinDate = joinDate;
	}

	public MemberVO getMemberVO()
	{
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO)
	{
		this.memberVO = memberVO;
	}

}
