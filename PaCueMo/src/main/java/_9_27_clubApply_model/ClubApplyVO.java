package _9_27_clubApply_model;

import java.sql.Date;

import org.springframework.stereotype.Component;

import _9_21_club_model.ClubVO;
import _9_41_member_model.MemberVO;

@Component
public class ClubApplyVO
{

	private int clubId;
	private String memberId;
	private Date applyDate;
	private MemberVO memberVO;
	private int checked;
	private ClubVO clubVO;

	public ClubApplyVO()
	{

	}

	public ClubApplyVO(int clubId, String memberId, Date applyDate, int checked)
	{
		this.clubId = clubId;
		this.memberId = memberId;
		this.applyDate = applyDate;
		this.checked = checked;
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

	public Date getApplyDate()
	{
		return applyDate;
	}

	public void setApplyDate(Date applyDate)
	{
		this.applyDate = applyDate;
	}

	public MemberVO getMemberVO()
	{
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO)
	{
		this.memberVO = memberVO;
	}

	public int getChecked()
	{
		return checked;
	}

	public void setChecked(int checked)
	{
		this.checked = checked;
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
