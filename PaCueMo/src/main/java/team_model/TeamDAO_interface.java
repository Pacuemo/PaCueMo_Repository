package team_model;

import java.util.List;
import java.util.Set;

import teammember_model.TeamMemberVO;

public interface TeamDAO_interface
{
	public void insert(TeamVO teamVO);

	public void update(TeamVO teamVO);

	public void delete(Integer teamId);

	public TeamVO findByPrimaryKey(Integer teamId);

	public List<TeamVO> getAll();

	public Set<TeamMemberVO> getMemsByTeamId(Integer teamId);
}
