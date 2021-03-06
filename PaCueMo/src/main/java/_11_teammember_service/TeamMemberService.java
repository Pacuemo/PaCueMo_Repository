package _11_teammember_service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import _9_11_teammember_model.TeamMemberDAO_interface;
import _9_11_teammember_model.TeamMemberVO;
import _9_41_member_model.MemberDAO_interface_Spring;
import _9_41_member_model.MemberVO;
import _9_42_playerCard_model.PlayerCardDAO_interface;
import _9_43_friendsList_model.FriendsListDAO_interface_Spring;
import _9_43_friendsList_model.FriendsListVO;

@Component
public class TeamMemberService
{
	@Autowired
	private TeamMemberDAO_interface dao;
	@Autowired
	private MemberDAO_interface_Spring memberDAO;
	@Autowired
	private PlayerCardDAO_interface playerCardDAO;
	@Autowired
	private FriendsListDAO_interface_Spring friendsListDAO_Spring;

	public TeamMemberService()
	{
	}

	public List<MemberVO> wrongWayGetMemberVOs(Integer teamId, String memberId)
	{
		System.out.println("wrongWayGetMemberVOs : careful use");
		List<FriendsListVO> friendsListVOs = friendsListDAO_Spring.getAllFriends(memberId);
		List<TeamMemberVO> teamMemberVOs = dao.getOneTeam(teamId);
		List<MemberVO> memberVOs = new ArrayList<>();
		for (FriendsListVO friendsListVO : friendsListVOs)
		{
			boolean flag = false;
			for (TeamMemberVO teamMemberVO : teamMemberVOs)
			{
				if (teamMemberVO.getTeamMemberId().equals(friendsListVO.getMemberFriendId()))
				{
					flag = true;
				}
			}
			if (!flag)
			{
				memberVOs.add(memberDAO.findByPrimaryKey(friendsListVO.getMemberFriendId()));
			}
		}
		System.out.println("ok");
		return memberVOs;
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
				teamMemberVO.setPlayerCardVO(playerCardDAO.getPlayerCardById(teamMemberVO.getTeamMemberId()));
			}
			System.out.println("TeamMemberService : getOneTeam End");
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
