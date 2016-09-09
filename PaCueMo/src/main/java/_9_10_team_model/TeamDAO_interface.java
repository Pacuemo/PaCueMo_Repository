package _9_10_team_model;

import java.sql.SQLException;
import java.util.List;
import java.util.Set;

import _9_11_teammember_model.TeamMemberVO;

public interface TeamDAO_interface
{

	void insert(TeamVO teamVO);

	List<Integer> find_TeamId_With_TeamHead(String teamHead) throws SQLException;

	void createTeam(TeamVO teamVO) throws SQLException;

	void update(TeamVO teamVO);

	void delete(Integer teamId);

	TeamVO findByPrimaryKey(Integer teamId);

	List<TeamVO> getAll();

	Set<TeamMemberVO> getMemsByTeamId(Integer teamId);

	void updateAvg(Integer teamId);

}
