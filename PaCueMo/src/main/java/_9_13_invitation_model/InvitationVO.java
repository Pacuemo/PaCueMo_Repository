package _9_13_invitation_model;

import org.springframework.stereotype.Component;

@Component("InvitationVO")
public class InvitationVO implements java.io.Serializable {

	private static final long serialVersionUID = 1L;

	private Integer invId;
	private String memberA;
	private String memberB;
	private Integer teamId;
	private Integer clubId;
	private Integer invstatus;

	public InvitationVO() {

	}

	public InvitationVO(Integer invId, String memberA, String memberB, Integer teamId, Integer clubId,
			Integer invstatus) {

	}

	public Integer getInvId() {
		return invId;
	}

	public void setInvId(Integer invId) {
		this.invId = invId;
	}

	public String getMemberA() {
		return memberA;
	}

	public void setMemberA(String memberA) {
		this.memberA = memberA;
	}

	public String getMemberB() {
		return memberB;
	}

	public void setMemberB(String memberB) {
		this.memberB = memberB;
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
