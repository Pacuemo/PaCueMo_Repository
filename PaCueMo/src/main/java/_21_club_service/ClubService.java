package _21_club_service;

import java.sql.Date;
import java.util.List;

import com.google.gson.Gson;

import _9_21_club_model.ClubDAO;
import _9_21_club_model.ClubVO;
import _9_22_clubMember_model.ClubMemberVO;
import _9_41_member_model.MemberDAO;

public class ClubService
{
	ClubDAO dao = new ClubDAO();

	public void save(String clubName, String clubImageName, Date clubDate, String clubHead, int clubProp)
	{
		ClubVO clubVO = new ClubVO();
		clubVO.setClubName(clubName);
		clubVO.setClubImageName(clubImageName);
		clubVO.setClubDate(clubDate);
		clubVO.setClubHead(clubHead);
		clubVO.setClubProp(clubProp);
		dao.insert(clubVO);

	}

	public void delete(int clubID)
	{
		dao.delete(clubID);
	}

	public String findOne(int clubID)
	{
		ClubVO clubVO = dao.findByPK(clubID);
		//一個社團全部成員	
		ClubMemberService ms = new ClubMemberService();
		List<ClubMemberVO> clubMembers = ms.findOneClubMmb(clubID);

		for (ClubMemberVO mmb : clubMembers)
		{
			MemberDAO mdao = new MemberDAO();
			mmb.setMember(mdao.findByPrimaryKey(mmb.getClubMemberId()));
		}
		//透過傳入社團ID找尋社團全部成員
		clubVO.setClubmembers(clubMembers);

		Gson gson = new Gson();
		String club = gson.toJson(clubVO);
		return club;
	}

	public List<ClubVO> findAll()
	{
		List<ClubVO> clubVOs = dao.getAll();
		return clubVOs;
	}

	public static void main(String[] args)
	{
		Date date = new Date(System.currentTimeMillis());
		ClubService s = new ClubService();
		s.save("姬八人", "j8.jpg", date, "150", 1);
		System.out.println("success");
	}

}
