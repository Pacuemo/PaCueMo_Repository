package _9_14_teamapply_model;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class TeamApplyVO implements java.io.Serializable
{
	private static final long serialVersionUID = 1L;

	private Integer teamId;
	private String memberId;
	private Integer applystatus;
	private Date applyDate;
	private Integer checked;

	public TeamApplyVO()
	{
	}

	public TeamApplyVO(Integer teamId, String memberId, Integer applystatus, Date applyDate, Integer checked)
	{
		super();
		this.teamId = teamId;
		this.memberId = memberId;
		this.applystatus = applystatus;
		this.applyDate = applyDate;
		this.checked = checked;
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

	public Integer getApplystatus()
	{
		return applystatus;
	}

	public void setApplystatus(Integer applystatus)
	{
		this.applystatus = applystatus;
	}

	public Date getApplyDate()
	{
		return applyDate;
	}

	public void setApplyDate(Date applyDate)
	{
		this.applyDate = applyDate;
	}

	public static long getSerialversionuid()
	{
		return serialVersionUID;
	}

	public Integer getChecked()
	{
		return checked;
	}

	public void setChecked(Integer checked)
	{
		this.checked = checked;
	}

}
