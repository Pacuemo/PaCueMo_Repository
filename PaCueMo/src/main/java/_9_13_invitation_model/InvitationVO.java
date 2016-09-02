package _9_13_invitation_model;

public class InvitationVO implements java.io.Serializable {
	private Integer invId;
	private Integer memberId;
	private Integer teamId;
	private Integer clubId;
	private Integer invstatus;

	public Integer getInvId() {
		return invId;
	}

	public void setInvId(Integer invId) {
		this.invId = invId;
	}

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public Integer getTeamId() {
		return teamId;
	}

	public void setTeamId(Integer teamId) {
		this.teamId = teamId;
	}

	public Integer getClubId() {
		return clubId;
	}

	public void setClubId(Integer clubId) {
		this.clubId = clubId;
	}

	public Integer getInvstatus() {
		return invstatus;
	}

	public void setInvstatus(Integer invstatus) {
		this.invstatus = invstatus;
	}

}
