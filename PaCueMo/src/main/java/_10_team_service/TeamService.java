package _10_team_service;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Component;

import _9_10_team_model.TeamDAO;
import _9_10_team_model.TeamDAO_interface;
import _9_10_team_model.TeamVO;
import _9_11_teammember_model.TeamMemberDAO;
import _9_11_teammember_model.TeamMemberDAO_interface;

@Component
public class TeamService
{

	private TeamDAO_interface teamDAO;
	private TeamMemberDAO_interface teamMemberDAO;

	public TeamService()
	{
		teamDAO = new TeamDAO();
		teamMemberDAO = new TeamMemberDAO();
	}

	// public void add(String teamName, Integer teamProp) {
	// TeamVO teamVO = new TeamVO();
	// teamVO.setTeamName(teamName);
	// teamVO.setTeamProp(teamProp);
	//
	// teamDAO.insert(teamVO);
	// }
	//
	// public void add(TeamVO teamVO) {
	// teamDAO.insert(teamVO);
	// }

//	public void createTeam(TeamVO teamVO) throws SQLException
//	{
//		teamDAO.createTeam(teamVO);
//	}

	public void createTeam(TeamVO teamVO) throws SQLException
	{
//		Connection connection = null;
//		try
//		{
//			Class.forName(GlobalService.DRIVER_NAME);
//			connection = DriverManager.getConnection(GlobalService.DB_URL, GlobalService.USERID, GlobalService.PASSWORD);
//			connection.setAutoCommit(false);
//			teamDAO = new TeamDAO(connection);
//			teamDAO.insert(teamVO);
//			Integer teamId = teamDAO.find_TeamId(teamVO.getTeamHead());
//			teamMemberDAO = new TeamMemberDAO(connection);
//			System.out.println(teamId);
//			teamMemberDAO.insert(teamId, teamVO.getTeamHead());
//			System.out.println("幹");
//			connection.commit();
//		}
//		catch (Exception e)
//		{
//			System.out.println("OK");
//			connection.rollback();
//			e.printStackTrace();
//		}
//		finally
//		{
//			connection.setAutoCommit(true);
//			connection.close();
//		}
	}

	public void update(Integer teamId, String teamName, Date createDate, Integer teamProp, String teamHead,
			Double avgRank)
	{
		TeamVO teamVO = new TeamVO();
		teamVO.setTeamId(teamId);
		teamVO.setTeamName(teamName);
		teamVO.setCreateDate(createDate);
		teamVO.setTeamProp(teamProp);
		teamVO.setTeamHead(teamHead);
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
