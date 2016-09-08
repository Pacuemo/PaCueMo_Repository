package _9_13_invitation_model;

import java.util.List;

public interface InvitationDAO_I
{

	List<InvitationVO> getByTeam(Integer teamId);

	List<InvitationVO> getByClub(Integer clubId);

	List<InvitationVO> getByMemberA_ALL(String memberId);

	List<InvitationVO> getByMemberA(String memberId);

	List<InvitationVO> getByMemberB_ALL(String memberId);

	List<InvitationVO> getByMemberB(String memberId);

	// 新增
	void add(InvitationVO invitationVO);

	// 刪除
	void delete(Integer invId);

}
