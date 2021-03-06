package _9_10_team_model;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Component;

import _9_11_teammember_model.TeamMemberVO;
import _9_14_teamapply_model.TeamApplyVO;

@Component
public class TeamVO implements java.io.Serializable
{

	private static final long serialVersionUID = 1L;
	private Integer teamId;
	private String teamName;
	private Date createDate;
	private Integer teamProp;
	private Double avgRank;
	private String teamHead;
	private String content;
	private String location;
	private List<TeamMemberVO> teamMemberVOs;
	private List<TeamApplyVO> teamApplyVOs;

	public TeamVO()
	{

	}

	public TeamVO(Integer teamId, String teamName, Date createDate, Integer teamProp, Double avgRank, String teamHead, String content, String location)
	{
		this.teamId = teamId;
		this.teamName = teamName;
		this.createDate = createDate;
		this.teamProp = teamProp;
		this.avgRank = avgRank;
		this.teamHead = teamHead;
		this.content = content;
		this.location = location;
	}

	public Integer getTeamId()
	{
		return teamId;
	}

	public void setTeamId(Integer teamId)
	{
		this.teamId = teamId;
	}

	public String getTeamName()
	{
		return teamName;
	}

	public void setTeamName(String teamName)
	{
		this.teamName = teamName;
	}

	public Date getCreateDate()
	{
		return createDate;
	}

	public void setCreateDate(Date createDate)
	{
		this.createDate = createDate;
	}

	public Integer getTeamProp()
	{
		return teamProp;
	}

	public void setTeamProp(Integer teamProp)
	{
		this.teamProp = teamProp;
	}

	public Double getAvgRank()
	{
		return avgRank;
	}

	public void setAvgRank(Double avgRank)
	{
		this.avgRank = avgRank;
	}

	public String getContent()
	{
		return content;
	}

	public void setContent(String content)
	{
		this.content = content;
	}

	public String getTeamHead()
	{
		return teamHead;
	}

	public void setTeamHead(String teamHead)
	{
		this.teamHead = teamHead;
	}

	public List<TeamMemberVO> getTeamMemberVOs()
	{
		return teamMemberVOs;
	}

	public void setTeamMemberVOs(List<TeamMemberVO> teamMemberVOs)
	{
		this.teamMemberVOs = teamMemberVOs;
	}

	public List<TeamApplyVO> getTeamApplyVOs()
	{
		return teamApplyVOs;
	}

	public void setTeamApplyVOs(List<TeamApplyVO> teamApplyVOs)
	{
		this.teamApplyVOs = teamApplyVOs;
	}

	public String getLocation()
	{
		return location;
	}

	public void setLocation(String location)
	{
		this.location = location;
	}

}
