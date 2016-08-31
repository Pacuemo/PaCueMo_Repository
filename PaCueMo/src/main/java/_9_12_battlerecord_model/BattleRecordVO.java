package _9_12_battlerecord_model;

import java.sql.*;

public class BattleRecordVO {
	private Integer battleId;
	private Integer teamIdA;
	private Integer teamIdB;
	private Boolean battleStatus;
	private Integer courtId;
	private Integer battleMode;
	private Double battleBet;
	private Timestamp battleDateTime;
	private Integer result;
	private Integer reportA;
	private Integer reportB;
	
	public Integer getBattleId() {
		return battleId;
	}
	public void setBattleId(Integer battleId) {
		this.battleId = battleId;
	}
	public Integer getTeamIdA() {
		return teamIdA;
	}
	public void setTeamIdA(Integer teamIdA) {
		this.teamIdA = teamIdA;
	}
	public Integer getTeamIdB() {
		return teamIdB;
	}
	public void setTeamIdB(Integer teamIdB) {
		this.teamIdB = teamIdB;
	}
	public Boolean getBattleStatus() {
		return battleStatus;
	}
	public void setBattleStatus(Boolean battleStatus) {
		this.battleStatus = battleStatus;
	}
	public Integer getCourtId() {
		return courtId;
	}
	public void setCourtId(Integer courtId) {
		this.courtId = courtId;
	}
	public Integer getBattleMode() {
		return battleMode;
	}
	public void setBattleMode(Integer battleMode) {
		this.battleMode = battleMode;
	}
	public Double getBattleBet() {
		return battleBet;
	}
	public void setBattleBet(Double battleBet) {
		this.battleBet = battleBet;
	}
	public Timestamp getBattleDateTime() {
		return battleDateTime;
	}
	public void setBattleDateTime(Timestamp battleDateTime) {
		this.battleDateTime = battleDateTime;
	}
	public Integer getResult() {
		return result;
	}
	public void setResult(Integer result) {
		this.result = result;
	}
	public Integer getReportA() {
		return reportA;
	}
	public void setReportA(Integer reportA) {
		this.reportA = reportA;
	}
	public Integer getReportB() {
		return reportB;
	}
	public void setReportB(Integer reportB) {
		this.reportB = reportB;
	}
}
