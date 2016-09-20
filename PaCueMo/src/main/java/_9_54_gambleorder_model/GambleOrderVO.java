package _9_54_gambleorder_model;

import _9_41_member_model.MemberVO;

public class GambleOrderVO
{
	private Integer gambleId;
	private String memberId;
	private Integer battleId;
	private Double betHome;
	private Double betAway;
	private java.sql.Timestamp betTime;
	private MemberVO memberVO;// 嵌入 會員

	public Integer getGambleId()
	{
		return gambleId;
	}

	public void setGambleId(Integer gambleId)
	{
		this.gambleId = gambleId;
	}

	public String getMemberId()
	{
		return memberId;
	}

	public void setMemberId(String memberId)
	{
		this.memberId = memberId;
	}

	public Integer getBattleId()
	{
		return battleId;
	}

	public void setBattleId(Integer battleId)
	{
		this.battleId = battleId;
	}

	public Double getBetHome()
	{
		return betHome;
	}

	public void setBetHome(Double betHome)
	{
		this.betHome = betHome;
	}

	public Double getBetAway()
	{
		return betAway;
	}

	public void setBetAway(Double betAway)
	{
		this.betAway = betAway;
	}

	public java.sql.Timestamp getBetTime()
	{
		return betTime;
	}

	public void setBetTime(java.sql.Timestamp betTime)
	{
		this.betTime = betTime;
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
