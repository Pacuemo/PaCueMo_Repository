package team_model;

import java.sql.Date;

public class TeamVO implements java.io.Serializable{
	private Integer teamId;
	private String teamName;
	private Date createDate;
	private Integer teamProp;
	private Double avgRank;
	private String content;
	
	public Integer getTeamId() {
		return teamId;
	}
	public void setTeamId(Integer teamId) {
		this.teamId = teamId;
	}
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Integer getTeamProp() {
		return teamProp;
	}
	public void setTeamProp(Integer teamProp) {
		this.teamProp = teamProp;
	}
	public Double getAvgRank() {
		return avgRank;
	}
	public void setAvgRank(Double avgRank) {
		this.avgRank = avgRank;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
}
