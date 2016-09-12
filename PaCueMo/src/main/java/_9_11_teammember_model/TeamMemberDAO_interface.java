package _9_11_teammember_model;

import java.util.List;

public interface TeamMemberDAO_interface
{

	void insert(Integer teamId, String teamMemberId);

	void insert(TeamMemberVO teamMemberVO);

	void update(TeamMemberVO teamMemberVO);

	void deleteOne(Integer teamId, String teamMemberId);

	TeamMemberVO findByPrimaryKey(Integer teamId, String teamMemberId);

	List<TeamMemberVO> getOneTeam(Integer teamId);

	List<TeamMemberVO> getAll();

	List<TeamMemberVO> findByTeamMemberId(String TeamMemberId);

	void deleteAll(Integer teamId);

}
