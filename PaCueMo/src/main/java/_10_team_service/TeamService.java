package _10_team_service;

import java.sql.Date;
import java.util.List;

import _11_teammember_service.TeamMemberService;
import _9_10_team_model.TeamDAO;
import _9_10_team_model.TeamDAO_interface;
import _9_10_team_model.TeamVO;

public class TeamService
{
	private TeamDAO_interface teamDAO;
	private TeamMemberService teamMemService;

	TeamService()
	{
		teamDAO = new TeamDAO();
	}

	public void add(Integer teamId, String teamName, Date createDate, Integer teamProp)
	{
		TeamVO teamVO = new TeamVO();
		teamVO.setTeamId(teamId);
		teamVO.setTeamName(teamName);
		teamVO.setCreateDate(createDate);
		teamVO.setTeamProp(teamProp);

		teamDAO.insert(teamVO);
	}

	public void add(TeamVO teamVO)
	{
		teamDAO.insert(teamVO);
	}

	public void update(Integer teamId, String teamName, Date createDate, Integer teamProp, Double avgRank)
	{
		TeamVO teamVO = new TeamVO();
		teamVO.setTeamId(teamId);
		teamVO.setTeamName(teamName);
		teamVO.setCreateDate(createDate);
		teamVO.setTeamProp(teamProp);
		teamVO.setAvgRank(avgRank);

		teamDAO.update(teamVO);
	}

	public void update(TeamVO teamVO)
	{
		teamDAO.update(teamVO);
	}

	public void delete(Integer teamId)
	{
		teamDAO.delete(teamId);
	}

	public TeamVO getOne(Integer teamId)
	{
		return teamDAO.findByPrimaryKey(teamId);
	}

	public List<TeamVO> getAll()
	{
		return teamDAO.getAll();
	}
}
