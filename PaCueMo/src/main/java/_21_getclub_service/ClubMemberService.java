package _21_getclub_service;

import java.sql.Date;
import java.util.List;

import _9_22_clubMember_model.ClubMemberDAO;
import _9_22_clubMember_model.ClubMemberVO;

public class ClubMemberService
{
	ClubMemberDAO dao = new ClubMemberDAO();

	public void save(int clubId, int clubMemberId, Date joinDate)
	{
		ClubMemberVO memberVO = new ClubMemberVO();
		memberVO.setClubId(clubId);
		memberVO.setClubMemberId(clubMemberId);
		memberVO.setJoinDate(joinDate);
		dao.insert(memberVO);

	}

	public void delete(int clubMemberId)
	{
		dao.delete(clubMemberId);
	}

	public ClubMemberVO findOne(int clubMemberId)
	{
		ClubMemberVO memberVO = dao.findByPK(clubMemberId);
		return memberVO;
	}

	public List<ClubMemberVO> findAll()
	{
		List<ClubMemberVO> memberVOs = dao.getAll();
		return memberVOs;
	}

	public List<ClubMemberVO> findOneClubMmb(int clubId)
	{
		List<ClubMemberVO> memberVOs = dao.getClubAll(clubId);
		return memberVOs;
	}

}
