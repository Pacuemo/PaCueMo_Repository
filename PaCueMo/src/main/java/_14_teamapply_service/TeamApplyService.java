package _14_teamapply_service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import _9_10_team_model.TeamDAO_interface;
import _9_11_teammember_model.TeamMemberDAO_interface;
import _9_14_teamapply_model.TeamApplyDAO_I;
import _9_14_teamapply_model.TeamApplyVO;
import _9_41_member_model.MemberDAO_interface;

@Component
public class TeamApplyService
{

	@Autowired
	private TeamDAO_interface teamDAO;
	@Autowired
	private TeamMemberDAO_interface teamMemberDAO;
	@Autowired
	private MemberDAO_interface memberDAO;
	@Autowired
	private TeamApplyDAO_I teamApplyDAO;

	public TeamApplyService()
	{
	}

	public void add(Integer teamId, String memberId)
	{
		TeamApplyVO teamApplyVO = new TeamApplyVO();
		teamApplyVO.setTeamId(teamId);
		teamApplyVO.setMemberId(memberId);
		System.out.println("add        :    " + (null == teamApplyDAO));
		teamApplyDAO.add(teamApplyVO);
	}

	public List<TeamApplyVO> getByMemberId_Applying(String memberId)
	{
		try
		{
			return teamApplyDAO.getByMemberId_Applying(memberId);
		}
		catch (Exception e)
		{
			System.out.println("ApplyingTeam no data!");
			return new ArrayList<TeamApplyVO>();
		}
	}

	public void cancel(Integer teamId, String memberId)
	{
		teamApplyDAO.delete(teamId, memberId);
	}
}
