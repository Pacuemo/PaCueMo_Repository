package _9_11_teammember_model;

import java.sql.Date;

public class TeamMemberVO {
	private Integer teamId;
	private Integer teamMemberId;
	private Date joinDate;

	public Integer getTeamId() {
		return teamId;
	}

	public void setTeamId(Integer teamId) {
		this.teamId = teamId;
	}

	public Integer getTeamMemberId() {
		return teamMemberId;
	}

	public void setTeamMemberId(Integer teamMemberId) {
		this.teamMemberId = teamMemberId;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

}
