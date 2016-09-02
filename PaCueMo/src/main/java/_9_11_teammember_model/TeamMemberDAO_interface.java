package _9_11_teammember_model;

import java.util.List;

public interface TeamMemberDAO_interface {
	public void insert(TeamMemberVO teamMemberVO);

	public void update(TeamMemberVO teamMemberVO);

	public void delete(Integer teamId, String teamMemberId);

	public TeamMemberVO findByPrimaryKey(Integer teamId, String teamMemberId);

	public List<TeamMemberVO> getAll();

	public List<TeamMemberVO> getOneTeam(Integer teamId);

}
