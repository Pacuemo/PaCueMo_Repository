package _9_22_clubMember_model;

import java.util.List;

public interface ClubMemberDAO_I
{

	void insert(ClubMemberVO clubMemberVO);

	void delete(int clubMemberID);

	ClubMemberVO findByPK(int clubMemberID);

	List<ClubMemberVO> getAll();

	List<ClubMemberVO> getClubAll(int clubId);

}
