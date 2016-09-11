package _9_54_gambleorder_model;

public class GambleOrderVO
{
	private Integer gambleId;
	private String memberId;
	private Integer battleId;
	private Double betMoney;
	private Integer betTeam;

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

	public Double getBetMoney()
	{
		return betMoney;
	}

	public void setBetMoney(Double betMoney)
	{
		this.betMoney = betMoney;
	}

	public Integer getBetTeam()
	{
		return betTeam;
	}

	public void setBetTeam(Integer betTeam)
	{
		this.betTeam = betTeam;
	}

}
