package _11_teammember_service;

import java.sql.Date;
import java.util.List;

import _9_11_teammember_model.TeamMemberDAO;
import _9_11_teammember_model.TeamMemberDAO_interface;
import _9_11_teammember_model.TeamMemberVO;

public class TeamMemberService {
	private TeamMemberDAO_interface dao;

	public TeamMemberService() {
		dao = new TeamMemberDAO();
	}

	public void add(TeamMemberVO teamMemberVO) {
		dao.insert(teamMemberVO);
	}

	public void add(Integer teamId, Integer teamMemberId, Date joinDate) {
		TeamMemberVO teamMemberVO = new TeamMemberVO();
		teamMemberVO.setTeamId(teamId);
		teamMemberVO.setTeamMemberId(teamMemberId);
		teamMemberVO.setJoinDate(joinDate);
		dao.insert(teamMemberVO);
	}

	public void update(TeamMemberVO teamMemberVO) {
		dao.update(teamMemberVO);
	}

	public void update(Integer teamId, Integer teamMemberId, Date joinDate) {
		TeamMemberVO teamMemberVO = new TeamMemberVO();
		teamMemberVO.setTeamId(teamId);
		teamMemberVO.setTeamMemberId(teamMemberId);
		teamMemberVO.setJoinDate(joinDate);
		dao.update(teamMemberVO);
	}

	public void delete(Integer teamId, Integer teamMemberId) {
		dao.delete(teamId, teamMemberId);
	}

	public TeamMemberVO getOne(Integer teamId, Integer teamMemberId) {
		return dao.findByPrimaryKey(teamId, teamMemberId);
	}

	public List<TeamMemberVO> getAll() {
		return dao.getAll();
	}

}
