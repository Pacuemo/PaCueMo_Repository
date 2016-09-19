package _10_team_service;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import _9_10_team_model.TeamDAO_interface;
import _9_10_team_model.TeamVO;
import _9_11_teammember_model.TeamMemberDAO_interface;

@Component
@Transactional
public class TeamService
{

	@Autowired
	private TeamDAO_interface teamDAO;
	@Autowired
	private TeamMemberDAO_interface teamMemberDAO;

	public TeamService()
	{
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public void createTeam(TeamVO teamVO) throws SQLException
	{
		teamDAO.insert(teamVO);
		List<Integer> teamIdList = teamDAO.find_TeamId_With_TeamHead(teamVO.getTeamHead());
		Integer teamId = teamIdList.get(teamIdList.size() - 1);
		teamMemberDAO.insert(teamId, teamVO.getTeamHead());
		System.out.println("creatTeam");
	}

	public void update(Integer teamId, String teamName, Date createDate, Integer teamProp, String teamHead, Double avgRank)
	{
		TeamVO teamVO = new TeamVO();
		teamVO.setTeamId(teamId);
		teamVO.setTeamName(teamName);
		teamVO.setCreateDate(createDate);
		teamVO.setTeamProp(teamProp);
		teamVO.setTeamHead(teamHead);

		teamDAO.update(teamVO);
	}

	public void update(TeamVO teamVO)
	{
		teamDAO.update(teamVO);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public void delete(Integer teamId)
	{
		teamMemberDAO.deleteAll(teamId);
		teamDAO.delete(teamId);
	}

	public TeamVO getTeamById(Integer teamId)
	{
		System.out.println("TeamService : getTeamById");
		TeamVO teamVO = teamDAO.getTeamById(teamId);
		System.out.println("TeamService : getTeamById End");
		return teamVO;
	}

	public List<TeamVO> getAll()
	{
		return teamDAO.getAll();
	}

	public List<TeamVO> getOtherTeamList(String teamMemberId)
	{
		try
		{
			return teamDAO.getOther(teamMemberId);
		}
		catch (Exception e)
		{
			System.out.println("getOther no data!");
			return new ArrayList<TeamVO>();
		}
	}

	public List<TeamVO> getMyTeamList(String teamMemberId)
	{
		try
		{
			return teamDAO.getMy(teamMemberId);
		}
		catch (Exception e)
		{
			System.out.println("JoinedTeam no data!");
			return new ArrayList<TeamVO>();
		}
	}

	public List<Integer> find_TeamId_With_TeamHead(String teamHead)
	{
		try
		{
			return teamDAO.find_TeamId_With_TeamHead(teamHead);
		}
		catch (Exception e)
		{
			System.out.println("MineTeam no data!");
			return new ArrayList<Integer>();
		}
	}

	public List<TeamVO> find_TeamVOs_With_TeamHead(String teamHead)
	{
		return teamDAO.find_TeamVOs_With_TeamHead(teamHead);
	}
}
