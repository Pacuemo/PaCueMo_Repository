package _9_11_teammember_model;

import java.sql.Date;

import org.springframework.stereotype.Component;

import _9_41_member_model.MemberVO;
import _9_42_playerCard_model.PlayerCardVO;

@Component
public class TeamMemberVO implements java.io.Serializable
{
	private static final long serialVersionUID = 1L;

	private Integer teamId;
	private String teamMemberId;
	private Date joinDate;
	private MemberVO memberVO;
	private PlayerCardVO playerCardVO;

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

	public PlayerCardVO getPlayerCardVO()
	{
		return playerCardVO;
	}

	public void setPlayerCardVO(PlayerCardVO playerCardVO)
	{
		this.playerCardVO = playerCardVO;
	}

}
