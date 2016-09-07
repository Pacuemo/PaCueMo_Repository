package _9_10_team_model;

import java.sql.SQLException;
import java.util.List;
import java.util.Set;

import _9_11_teammember_model.TeamMemberVO;

public interface TeamDAO_interface
{
	public void insert(TeamVO teamVO);

	public void createTeam(TeamVO teamVO) throws SQLException;

	public void update(TeamVO teamVO);

	public void delete(Integer teamId);

	public TeamVO findByPrimaryKey(Integer teamId);

	public List<TeamVO> getAll();

	public Set<TeamMemberVO> getMemsByTeamId(Integer teamId);

	public Integer find_TeamId(String teamHead) throws SQLException;
}
