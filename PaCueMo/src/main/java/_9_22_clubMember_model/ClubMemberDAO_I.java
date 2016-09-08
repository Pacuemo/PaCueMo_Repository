package _9_22_clubMember_model;

import java.util.List;

public interface ClubMemberDAO_I
{

	int insert(ClubMemberVO clubMemberVO);

	int delete(String clubMemberID);

	ClubMemberVO findByPK(String clubMemberID);

	List<ClubMemberVO> getAll();

	List<ClubMemberVO> getClubAll(int clubId);

}
