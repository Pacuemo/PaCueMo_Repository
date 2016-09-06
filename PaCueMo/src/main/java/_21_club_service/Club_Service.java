package _21_club_service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Component;

import _9_21_club_model.ClubConfig;
import _9_21_club_model.ClubDAO_I;
import _9_21_club_model.ClubVO;
import _9_22_clubMember_model.ClubMemberDAO_I;
import _9_22_clubMember_model.ClubMemberVO;
import _9_27_clubApply_model.ClubApplyDAO_I;
import _9_27_clubApply_model.ClubApplyVO;
import _9_28_clubInvite_model.ClubInviteDAO_I;
import _9_28_clubInvite_model.ClubInviteVO;
import _9_41_member_model.MemberDAO_interface;

@Component
public class Club_Service
{
	@Autowired
	private ClubDAO_I clubDAO;
	@Autowired
	private ClubMemberDAO_I clubMemberDAO;
	@Autowired
	private MemberDAO_interface memberDAO;
	@Autowired
	private ClubApplyDAO_I clubApplyDAO;
	@Autowired
	private ClubInviteDAO_I clubInviteDAO;

	//用社團名稱模糊比對
	public List<ClubVO> searchClub(String name)
	{
		return clubDAO.getAll_By_Name(name);
	}

	//註冊新社團
	public int registerClub(ClubVO clubVO)
	{
		return clubDAO.insert(clubVO);

	}

	//get社團、成員資訊
	public ClubVO getClub(int clubId)
	{

		ClubVO clubVO = clubDAO.findByPK(clubId);
		List<ClubMemberVO> clubMemberVOs = clubMemberDAO.getClubAll(clubId);
		for (ClubMemberVO vo : clubMemberVOs)
		{
			vo.setMember(memberDAO.findByPrimaryKey(vo.getClubMemberId()));
		}
		clubVO.setClubmembers(clubMemberVOs);
		return clubVO;
	}

	//get社團資訊by clubMemberID
	public ClubVO getClub_byMemberId(String memberId)
	{
		ClubMemberVO clubMemberVO = clubMemberDAO.findByPK(memberId);
		return getClub(clubMemberVO.getClubId());
	}

	//邀請進入社團
	public String applyClub(ClubApplyVO clubApplyVO)
	{

		if (clubMemberDAO.findByPK(clubApplyVO.getMemberId()).getClubMemberId() != null)
		{
			return "fail";
		}
		else
		{
			clubApplyDAO.add_One(clubApplyVO);
			return "success";
		}
	}

	//查詢申請進入社團
	public List<ClubApplyVO> get_ClubApply(int clubId)
	{
		List<ClubApplyVO> ClubApplyVOs = clubApplyDAO.get_All_ClubId(clubId);
		for (ClubApplyVO vo : ClubApplyVOs)
		{
			vo.setMemberVO(memberDAO.findByPrimaryKey(vo.getMemberId()));
		}
		return ClubApplyVOs;
	}

	//確認加入社團
	public String checkJoinClub(int clubId, String memberId)
	{
		if (clubMemberDAO.findByPK(memberId).getClubMemberId() != null)
		{
			return "fail";
		}
		else
		{
			ClubMemberVO clubMemberVO = new ClubMemberVO(clubId, memberId, new Date(System.currentTimeMillis()));
			clubMemberDAO.insert(clubMemberVO);
			clubApplyDAO.delete_One(clubId, memberId);
			return "success";
		}
	}

	//刪除加入社團
	public int deleteJoinClub(int clubId, String memberId)
	{
		return clubApplyDAO.delete_One(clubId, memberId);
	}

	//邀請加入社團
	public String inviteJoinClub(int clubId, String memberId, String clubMemberId)
	{
		try
		{
			clubInviteDAO.add_One(new ClubInviteVO(clubId, memberId, clubMemberId, new Date(System.currentTimeMillis())));
		}
		catch (Exception e)
		{
			return "fail";
		}
		return "success";
	}

	//獲取加入社團資訊
	public List<ClubInviteVO> get_Invite_By_Id(String MemberId)
	{
		List<ClubInviteVO> clubInviteVOs = clubInviteDAO.get_All_MemberId(MemberId);
		for (ClubInviteVO vo : clubInviteVOs)
		{
			vo.setClubVO(clubDAO.findByPK(vo.getClubId()));
			vo.setClubMemberVO(memberDAO.findByPrimaryKey(vo.getClubMemberId()));
		}
		return clubInviteVOs;
	}

	//同意邀請
	public String agreeInvite(int clubId, String memberId)
	{
		if (clubMemberDAO.findByPK(memberId).getClubMemberId() != null)
		{
			return "fail";
		}
		else
		{
			clubApplyDAO.add_One(new ClubApplyVO(clubId, memberId, new Date(System.currentTimeMillis())));
			clubInviteDAO.delete_One(clubId, memberId);
			return "success";
		}
	}

	//刪除邀請
	public int deleteInvite(int clubId, String memberId)
	{
		return clubInviteDAO.delete_One(clubId, memberId);
	}

	public static void main(String[] args)
	{

		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(ClubConfig.class);
		Club_Service service = context.getBean(Club_Service.class);
//		ClubApplyVO vo = new ClubApplyVO(1, "A693D741-7233-402B-B916-5CD1E83988A1", new Date(System.currentTimeMillis()));
//		System.out.println(service.applyClub(vo));
//		List<ClubApplyVO> clubApplyVOs = service.get_ClubApply(1);
//		for (ClubApplyVO vo : clubApplyVOs)
//		{
//			System.out.println(vo.getMemberVO().getMemberFirstName());
//			service.checkJoinClub(vo.getClubId(), vo.getMemberId());
//			System.out.println("社團新增成員成功");
//			System.out.println(vo.getMemberVO().getMemberFirstName());
//		}
//		String test = service.inviteJoinClub(1, "CA041536-FF15-4B5F-A954-D3D6979CE812", "D848ED5D-2516-42C9-ABDA-260996AB5545");
//		System.out.println(test);

//		--測試搜尋加入社團資訊--
//		List<ClubInviteVO> clubInvites = service.get_Invite_By_Id("E6F7FE28-DB03-494C-97EA-0E5AB147F51D");
//		for (ClubInviteVO vo : clubInvites)
//		{
//			System.out.println(vo.getClubVO().getClubName());
//		}
//		--測試同意邀請--
//		System.out.println(service.agreeInvite(1, "CA041536-FF15-4B5F-A954-D3D6979CE812"));

//		--刪除邀請--
		System.out.println(service.deleteInvite(1, "E6F7FE28-DB03-494C-97EA-0E5AB147F51D"));
		//		ClubVO vo;
//		try
//		{   //有社團 7A4A3654-149E-44C5-B240-253C5ACF926D
//			//沒社團 CC4116FB-5C04-4ACC-8F47-3E6E30395974
//			vo = service.getClub_byMemberId("CC4116FB-5C04-4ACC-8F47-3E6E30395974");
//			System.out.println(vo.getClubName());
//		}
//		catch (RuntimeException e)
//		{
//			System.out.println("該成員沒有社團");
//		}

	}

}
