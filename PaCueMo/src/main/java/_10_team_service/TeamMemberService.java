package _10_team_service;

import java.sql.Date;
import java.util.List;

import teammember_model.TeamMemberDAO;
import teammember_model.TeamMemberDAO_interface;
import teammember_model.TeamMemberVO;


public class TeamMemberService {
	private TeamMemberDAO_interface dao;

	TeamMemberService() {
		dao = new TeamMemberDAO();
	}
	
	public void add(TeamMemberVO teamMemberVO){
		dao.insert(teamMemberVO);
	}
	
	public void add(Integer teamId,Integer teamMemberId,Date joinDate,Boolean isCaptain){
		TeamMemberVO teamMemberVO = new TeamMemberVO();
		teamMemberVO.setTeamId(teamId);
		teamMemberVO.setTeamMemberId(teamMemberId);
		teamMemberVO.setJoinDate(joinDate);
		teamMemberVO.setIsCaptain(isCaptain);
		dao.insert(teamMemberVO);
	}
	
	public void update(TeamMemberVO teamMemberVO){
		dao.update(teamMemberVO);
	}
	
	public void update(Integer teamId,Integer teamMemberId,Date joinDate,Boolean isCaptain){
		TeamMemberVO teamMemberVO = new TeamMemberVO();
		teamMemberVO.setTeamId(teamId);
		teamMemberVO.setTeamMemberId(teamMemberId);
		teamMemberVO.setJoinDate(joinDate);
		teamMemberVO.setIsCaptain(isCaptain);
		dao.update(teamMemberVO);
	}
	
	public void delete(Integer teamMemberId) {
		dao.delete(teamMemberId);
	}
	
	public TeamMemberVO getOne(Integer teamMemberId) {	 
		return dao.findByPrimaryKey(teamMemberId);
	}
	
	public List<TeamMemberVO> getAll() {
		return dao.getAll();
	}
	
}
