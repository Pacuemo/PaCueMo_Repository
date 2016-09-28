package _21_club_service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import _00_config.RootConfig;
import _9_21_club_model.ClubDAO_I;
import _9_21_club_model.ClubVO;
import _9_22_clubMember_model.ClubMemberDAO_I;
import _9_22_clubMember_model.ClubMemberVO;
import _9_25_leagueRecord_model.LeagueRecordDAO_I;
import _9_25_leagueRecord_model.LeagueRecordVO;
import _9_27_clubApply_model.ClubApplyDAO_I;
import _9_27_clubApply_model.ClubApplyVO;
import _9_28_clubInvite_model.ClubInviteDAO_I;
import _9_28_clubInvite_model.ClubInviteVO;
import _9_41_member_model.MemberDAO_interface_Spring;

@Component
@Transactional
public class Club_Service
{
	@Autowired
	private LeagueRecordDAO_I LeagueRecordDAO;
	@Autowired
	private ClubDAO_I clubDAO;
	@Autowired
	private ClubMemberDAO_I clubMemberDAO;
	@Autowired
	private MemberDAO_interface_Spring memberDAO;
	@Autowired
	private ClubApplyDAO_I clubApplyDAO;
	@Autowired
	private ClubInviteDAO_I clubInviteDAO;

	//用社團名稱模糊比對
	public List<ClubVO> searchClub(String name)
	{
		List<ClubVO> clubVOs = clubDAO.getAll_By_Name(name);
		System.out.println("成功查詢社團: " + clubVOs.size() + " 筆-傳入模糊社團名稱");
		System.out.println("回傳: " + clubVOs.size() + " 筆社團VO");
		return clubVOs;

	}

	@Transactional(rollbackFor = Exception.class)
	public int registerClub(ClubVO clubVO)
	{

		clubDAO.insert(clubVO);
		System.out.println("成功新增社團:" + clubVO.getClubName());
		List<ClubVO> clubVOs = clubDAO.getAll_By_Name(clubVO.getClubName());
		int success = clubMemberDAO.insert(new ClubMemberVO(clubVOs.get(clubVOs.size() - 1).getClubID(), clubVO.getClubHead(), new Date(System.currentTimeMillis())));
		System.out.println("並同時新增團長至社團成員");
		System.out.println("回傳新增社團成功數: " + success + " 筆");
		return success;

	}

	//getAll
	public List<ClubVO> getAll()
	{
		return clubDAO.getAll();
	}

	//get社團、成員資訊
	public ClubVO getClub(int clubId)
	{

		ClubVO clubVO = clubDAO.findByPK(clubId);
		System.out.println("成功查詢社團:1筆-傳入社團ID");
		List<ClubMemberVO> clubMemberVOs = clubMemberDAO.getClubAll(clubId);
		for (ClubMemberVO vo : clubMemberVOs)
		{
			vo.setMember(memberDAO.findByPrimaryKey(vo.getClubMemberId()));
		}
		clubVO.setClubmembers(clubMemberVOs);
		System.out.println("成功查詢社團成員: " + clubMemberVOs.size() + " 筆-並放入社團物件中");
		List<LeagueRecordVO> leagueRecordVOs = LeagueRecordDAO.find_ALL_BY_ClubID(clubId);
		for (LeagueRecordVO leagueRecordVO : leagueRecordVOs)
		{
			leagueRecordVO.setClubA(clubDAO.findByPK(leagueRecordVO.getClubIdA()));

			leagueRecordVO.setClubB(clubDAO.findByPK(leagueRecordVO.getClubIdB()));
		}
		clubVO.setLeagueRecordVOs(leagueRecordVOs);
		System.out.println("回傳1筆社團VO");
		return clubVO;
	}

	//查詢社團資料
	public ClubVO getOnlyClub(int clubId)
	{

		ClubVO clubVO = clubDAO.findByPK(clubId);
		System.out.println("成功查詢社團:1筆-傳入社團ID");
		List<ClubMemberVO> clubMemberVOs = clubMemberDAO.getClubAll(clubId);
		for (ClubMemberVO vo : clubMemberVOs)
		{
			vo.setMember(memberDAO.findByPrimaryKey(vo.getClubMemberId()));
		}
		clubVO.setClubmembers(clubMemberVOs);
		System.out.println("成功查詢社團成員: " + clubMemberVOs.size() + " 筆-並放入社團物件中");
		return clubVO;
	}

	//退出社團
	public int delete_clubMember(String memberId)
	{
		return clubMemberDAO.delete(memberId);
	}

	//退出社團
	public int deleteClub(int clubId)
	{
		return clubDAO.delete(clubId);
	}

	//get社團資訊by clubMemberID
	public ClubVO getClub_byMemberId(String memberId)
	{
		ClubMemberVO clubMemberVO = clubMemberDAO.findByPK(memberId);
		System.out.println("成功查詢社團成員:1筆-傳入社團成員Id");
		ClubVO clubVO = getClub(clubMemberVO.getClubId());
		System.out.println("成功查詢社團:1筆-傳入社團成員VO內的社團ID");
		System.out.println("回傳1筆社團VO");
		List<ClubMemberVO> clubMemberVOs = clubMemberDAO.getClubAll(clubVO.getClubID());
		for (ClubMemberVO vo : clubMemberVOs)
		{
			vo.setMember(memberDAO.findByPrimaryKey(vo.getClubMemberId()));
		}
		clubVO.setClubmembers(clubMemberVOs);
		System.out.println("成功查詢社團成員: " + clubMemberVOs.size() + " 筆-並放入社團物件中");
		List<LeagueRecordVO> leagueRecordVOs = LeagueRecordDAO.find_ALL_BY_ClubID(clubVO.getClubID());
		for (LeagueRecordVO leagueRecordVO : leagueRecordVOs)
		{
			leagueRecordVO.setClubA(clubDAO.findByPK(leagueRecordVO.getClubIdA()));

			leagueRecordVO.setClubB(clubDAO.findByPK(leagueRecordVO.getClubIdB()));
		}
		clubVO.setLeagueRecordVOs(leagueRecordVOs);
		System.out.println("回傳1筆社團VO");
		return clubVO;
	}

	//get社團資訊by clubMemberID
	public ClubVO getClub_by_Login(String memberId)
	{

		ClubMemberVO clubMemberVO = clubMemberDAO.findByPK(memberId);
		if (clubMemberVO != null)
		{
			System.out.println("成功查詢社團成員:1筆-傳入社團成員Id");
			ClubVO clubVO = getClub(clubMemberVO.getClubId());
			System.out.println("回傳1筆社團VO");
			return clubVO;
		}
		else
		{
			return null;
		}
	}

	//邀請進入社團
	public String applyClub(int clubId, String memberId)
	{

		if (clubMemberDAO.findByPK(memberId) != null)
		{
			System.out.println("查詢社團成員成功-傳入會員Id");
			System.out.println("回傳字串-fail 不允許申請進入社團");
			return "fail";
		}
		else
		{
			System.out.println("查詢社團成員失敗-傳入會員Id");
			int success = clubApplyDAO.add_One(new ClubApplyVO(clubId, memberId, new Date(System.currentTimeMillis()), 0));
			if (success == 1)
			{
				System.out.println("成功新增 " + success + " 筆申請資料");
				System.out.println("回傳字串-success 允許申請進入社團");
				return "success";
			}
			else
			{
				System.out.println("回傳字串-already 已申請進入社團");
				return "already";
			}
		}
	}

	//查詢申請進入社團
	public List<ClubApplyVO> get_ClubApply(int clubId)
	{
		List<ClubApplyVO> ClubApplyVOs = clubApplyDAO.get_All_ClubId(clubId);
		System.out.println("成功查詢 " + ClubApplyVOs.size() + " 筆申請資料-傳入社團Id");
		for (ClubApplyVO vo : ClubApplyVOs)
		{
			vo.setMemberVO(memberDAO.findByPrimaryKey(vo.getMemberId()));
		}
		System.out.println("成功放入 " + ClubApplyVOs.size() + " 成員VO至社團申請VO");
		System.out.println("回傳 " + ClubApplyVOs.size() + " 筆社團申請VO");
		return ClubApplyVOs;
	}

	//確認加入社團
	@Transactional(rollbackFor = Exception.class)
	public String checkJoinClub(int clubId, String memberId)
	{
		if (clubMemberDAO.findByPK(memberId) != null)
		{
			System.out.println("查詢社團成員成功-傳入會員Id");
			System.out.println("回傳字串-fail 不允許進入新社團");
			return "fail";
		}
		else
		{
			System.out.println("查詢社團成員失敗-傳入會員Id");
			int success = clubMemberDAO.insert(new ClubMemberVO(clubId, memberId, new Date(System.currentTimeMillis())));
			System.out.println("成功新增社團成員 " + success + " 筆");
			int success1 = clubApplyDAO.delete_One(clubId, memberId);
			System.out.println("成功刪除申請資料 " + success1 + " 筆-並回傳字傳-success");
			return "success";
		}
	}

	//刪除加入社團
	public String deleteJoinClub(int clubId, String memberId)
	{
		int success = clubApplyDAO.delete_One(clubId, memberId);
		System.out.println("成功刪除申請資料 " + success + " 筆-並回傳整數:" + success);
		return "success";
	}

//計算未讀訊息有多少
	public int count_Checked(int clubId)
	{
		return clubApplyDAO.count_checked(clubId);

	}

//改變未讀狀態
	public int change_checked(int clubId)
	{
		return clubApplyDAO.change_checked(clubId);

	}

//查詢已申請社團資訊
	public List<ClubApplyVO> get_All_memberId(String memberId)
	{

		List<ClubApplyVO> clubApplyVOs = clubApplyDAO.get_All_MemberId(memberId);
		if (clubApplyVOs.size() != 0)
		{
			for (ClubApplyVO vo : clubApplyVOs)
			{
				vo.setClubVO(clubDAO.findByPK(vo.getClubId()));

			}
			return clubApplyVOs;
		}
		else
		{
			return null;
		}
	}

	//邀請加入社團
	public int inviteJoinClub(int clubId, String memberId, String clubMemberId)
	{
		int success = 0;
		try
		{
			success = clubInviteDAO.add_One(new ClubInviteVO(clubId, memberId, clubMemberId, new Date(System.currentTimeMillis())));
		}
		catch (Exception e)
		{
			System.out.println("失敗新增邀請會員加入社團 " + success + " 筆(已邀請)-並回傳整數: " + success);
			return success;
		}
		System.out.println("成功新增邀請會員加入社團 " + success + " 筆-並回傳整數: " + success);
		return success;
	}

	//獲取加入社團資訊
	public List<ClubInviteVO> get_Invite_By_Id(String MemberId)
	{
		List<ClubInviteVO> clubInviteVOs = clubInviteDAO.get_All_MemberId(MemberId);
		System.out.println("成功查詢邀請加入社團資訊 " + clubInviteVOs.size() + " 筆-傳入資料會員Id");
		for (ClubInviteVO vo : clubInviteVOs)
		{
			vo.setClubVO(clubDAO.findByPK(vo.getClubId()));
			vo.setClubMemberVO(memberDAO.findByPrimaryKey(vo.getClubMemberId()));
		}
		System.out.println("並成功放入邀請社團VO及邀請人VO " + clubInviteVOs.size() + " 筆");
		System.out.println("回傳社團邀請VO " + clubInviteVOs.size() + " 筆");
		return clubInviteVOs;
	}

	//同意邀請
	public String agreeInvite(int clubId, String memberId)
	{
		if (clubMemberDAO.findByPK(memberId).getClubMemberId() != null)
		{
			System.out.println("查詢社團成員成功-傳入會員Id");
			System.out.println("回傳字串-fail 不允許同意邀請");
			return "fail";
		}
		else
		{
			System.out.println("查詢社團成員失敗-傳入會員Id");
			int success = clubApplyDAO.add_One(new ClubApplyVO(clubId, memberId, new Date(System.currentTimeMillis()), 0));
			System.out.println("成功新增社團申請VO " + success + " 筆");
			int success2 = clubInviteDAO.delete_One(clubId, memberId);
			System.out.println("成功刪除社團邀請VO " + success2 + " 筆");
			System.out.println("回傳字串-success 同意邀請");
			return "success";
		}
	}

	//刪除邀請
	public int deleteInvite(int clubId, String memberId)
	{
		int success = clubInviteDAO.delete_One(clubId, memberId);
		System.out.println("成功刪除社團邀請VO " + success + " 筆-並回傳整數: " + success);
		return success;
	}

	public static void main(String[] args)
	{

		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(RootConfig.class);
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
//		System.out.println(service.deleteInvite(1, "E6F7FE28-DB03-494C-97EA-0E5AB147F51D"));
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

		ClubVO clubVO = service.getClub_byMemberId("9f9fde57-21be-435d-b6c5-0909efdaad92");
		System.out.println(clubVO.getClubID());
	}

}
