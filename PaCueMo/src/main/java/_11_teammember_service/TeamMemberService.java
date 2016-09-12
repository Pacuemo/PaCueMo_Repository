package _11_teammember_service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import _9_11_teammember_model.TeamMemberDAO_interface;
import _9_11_teammember_model.TeamMemberVO;

@Component
public class TeamMemberService
{
	@Autowired
	private TeamMemberDAO_interface dao;

	public TeamMemberService()
	{
	}

	public void add(TeamMemberVO teamMemberVO)
	{
		dao.insert(teamMemberVO);
	}

	public void add(Integer teamId, String teamMemberId)
	{
		dao.insert(teamId, teamMemberId);
	}

	public void update(TeamMemberVO teamMemberVO)
	{
		dao.update(teamMemberVO);
	}

	public void update(Integer teamId, String teamMemberId, Date joinDate)
	{
		TeamMemberVO teamMemberVO = new TeamMemberVO();
		teamMemberVO.setTeamId(teamId);
		teamMemberVO.setTeamMemberId(teamMemberId);
		teamMemberVO.setJoinDate(joinDate);
		dao.update(teamMemberVO);
	}

	public void deleteOne(Integer teamId, String teamMemberId)
	{
		dao.deleteOne(teamId, teamMemberId);
	}

	public void deleteAll(Integer teamId)
	{
		dao.deleteAll(teamId);
	}

	public TeamMemberVO getOne(Integer teamId, String teamMemberId)
	{
		return dao.findByPrimaryKey(teamId, teamMemberId);
	}

	public List<TeamMemberVO> getOneTeam(Integer teamId)
	{
		return dao.getOneTeam(teamId);
	}

	public List<TeamMemberVO> getAll()
	{
		return dao.getAll();
	}

	public List<TeamMemberVO> findByTeamMemberId(String TeamMemberId)
	{
		return dao.findByTeamMemberId(TeamMemberId);
	}

}
