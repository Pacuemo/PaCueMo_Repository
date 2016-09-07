package _9_13_teaminvite_model;

import java.util.List;

public interface TeamInviteDAO_I
{

	List<TeamInviteVO> getByTeam(Integer teamId);

	List<TeamInviteVO> getByMemberId_ALL(String memberId);

	List<TeamInviteVO> getByMemberId(String memberId);

	List<TeamInviteVO> getByTeamMemberId_ALL(String teamMemberId);

	List<TeamInviteVO> getByTeamMemberId(String teamMemberId);

	void add(TeamInviteVO teamInviteVO);

	void delete(Integer invId, String memberId);

}
