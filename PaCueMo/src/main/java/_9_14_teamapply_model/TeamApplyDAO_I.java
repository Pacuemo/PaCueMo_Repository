package _9_14_teamapply_model;

import java.util.List;

public interface TeamApplyDAO_I
{

	List<TeamApplyVO> getByTeam(Integer teamId);

	List<TeamApplyVO> getByMemberId_ALL(String memberId);

	List<TeamApplyVO> getByMemberId_Applying(String memberId);

	void add(TeamApplyVO teamApplyVO);

	void delete(Integer teamId, String memberId);

	void update(Integer invstatus, Integer teamId, String memberId);

	int count_checked(int teamId);

	int change_checked(int teamId);

	void deleteByTeamId(Integer teamId);

}
