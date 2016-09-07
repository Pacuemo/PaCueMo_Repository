package _9_13_teaminvite_model;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("TeamInviteVO")
public class TeamInviteVO implements java.io.Serializable
{
	private static final long serialVersionUID = 1L;

	private Integer teamId;
	private String memberId;
	private String teamMemberId;
	private Integer invstatus;
	private Date inviteDate;

	public TeamInviteVO()
	{
	}

	public TeamInviteVO(Integer teamId, String memberId, String teamMemberId, Integer invstatus, Date inviteDate)
	{
		super();
		this.teamId = teamId;
		this.memberId = memberId;
		this.teamMemberId = teamMemberId;
		this.invstatus = invstatus;
		this.inviteDate = inviteDate;
	}

	public Integer getTeamId()
	{
		return teamId;
	}

	public void setTeamId(Integer teamId)
	{
		this.teamId = teamId;
	}

	public String getMemberId()
	{
		return memberId;
	}

	public void setMemberId(String memberId)
	{
		this.memberId = memberId;
	}

	public String getTeamMemberId()
	{
		return teamMemberId;
	}

	public void setTeamMemberId(String teamMemberId)
	{
		this.teamMemberId = teamMemberId;
	}

	public Integer getInvstatus()
	{
		return invstatus;
	}

	public void setInvstatus(Integer invstatus)
	{
		this.invstatus = invstatus;
	}

	public Date getInviteDate()
	{
		return inviteDate;
	}

	public void setInviteDate(Date inviteDate)
	{
		this.inviteDate = inviteDate;
	}

	public static long getSerialversionuid()
	{
		return serialVersionUID;
	}

}
