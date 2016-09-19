package _14_teamapply_service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

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

	public List<TeamApplyVO> getTeamApplyVOsById(String memberId)
	{
		return teamApplyDAO.getByMemberId_ALL(memberId);
	}

	public Integer count_Checked(Integer teamId)
	{
		return teamApplyDAO.count_checked(teamId);
	}

	public List<TeamApplyVO> get_TeamApply(int teamId)
	{
		List<TeamApplyVO> teamApplyVOs = teamApplyDAO.getByTeam(teamId);
		System.out.println("成功查詢 " + teamApplyVOs.size() + " 筆申請資料-傳入隊伍Id");
		for (TeamApplyVO vo : teamApplyVOs)
		{
			vo.setMemberVO(memberDAO.findByPrimaryKey(vo.getMemberId()));
		}
		System.out.println("成功放入 " + teamApplyVOs.size() + " 成員VO至隊伍申請VO");
		System.out.println("回傳 " + teamApplyVOs.size() + " 筆隊伍申請VO");
		return teamApplyVOs;
	}

	public int change_checked(int teamId)
	{
		return teamApplyDAO.change_checked(teamId);
	}

	//確認加入隊伍
	@Transactional(rollbackFor = Exception.class)
	public String checkJoinTeam(int teamId, String memberId)
	{
		System.out.println("TeamApplyService : checkJoinTeam");
		teamMemberDAO.insert(teamId, memberId);
		System.out.println("成功新增隊伍成員 ");
		teamApplyDAO.update(1, teamId, memberId);
		System.out.println("成功更改申請資料  - 接受");
		return "success";
	}

	//刪除加入社團
	public String rejectJoinTeam(int teamId, String memberId)
	{
		teamApplyDAO.update(-1, teamId, memberId);
		System.out.println("成功更改申請資料 - 拒絕 ");
		return "success";
	}
}
