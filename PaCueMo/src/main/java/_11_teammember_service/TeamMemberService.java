package _11_teammember_service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import _9_11_teammember_model.TeamMemberDAO_interface;
import _9_11_teammember_model.TeamMemberVO;
import _9_41_member_model.MemberDAO_interface_Spring;
import _9_42_playerCard_model.PlayerCardDAO_interface;

@Component
public class TeamMemberService
{
	@Autowired
	private TeamMemberDAO_interface dao;
	@Autowired
	private MemberDAO_interface_Spring memberDAO;
	@Autowired
	private PlayerCardDAO_interface playerCardDAO;

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
		System.out.println("TeamMemberService : getOneTeam");
		List<TeamMemberVO> teamMemberVOs = null;
		try
		{
			teamMemberVOs = dao.getOneTeam(teamId);
			for (TeamMemberVO teamMemberVO : teamMemberVOs)
			{
				teamMemberVO.setMemberVO(memberDAO.findByPrimaryKey(teamMemberVO.getTeamMemberId()));
				System.out.println();
				teamMemberVO.setPlayerCardVO(playerCardDAO.getPlayerCardById(teamMemberVO.getTeamMemberId()));
			}
			return teamMemberVOs;
		}
		catch (Exception e)
		{
			e.printStackTrace();
			System.out.println("fuck???");
			return new ArrayList<TeamMemberVO>();
		}
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
