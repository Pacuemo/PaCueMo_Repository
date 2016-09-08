package _22_league_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import _9_26_fightRecord_model.FightRecordDAO;
import _9_26_fightRecord_model.FightRecordVO;
import _9_41_member_model.MemberDAO_interface;

@Component
@Transactional
public class FightRecord_Service
{
	@Autowired
	private FightRecordDAO fightRecordDao;
	@Autowired
	private MemberDAO_interface memberDao;
	//聯賽-----------------------------------------------------------------------------------------------------------------------------------	

	//------刪除單場聯賽球員紀錄--------
	public int delete_One_fightRecord(int fightId, String memberId)
	{
		int success = fightRecordDao.delete_One(fightId, memberId);
		System.out.println("成功刪除單場球員紀錄        " + success + "   筆-回傳整數" + success);
		return success;
	}

	//------修改單筆聯賽球員紀錄------
	@Transactional(rollbackFor = Exception.class)
	public int update_One_fightRecord(FightRecordVO fRecordVO)
	{
		int success = delete_One_fightRecord(fRecordVO.getFightId(), fRecordVO.getClubMemberId());
		System.out.println("成功刪除需要修改球員紀錄        " + success + "   筆");
		int success1 = fightRecordDao.add_One(fRecordVO);
		System.out.println("成功新增單場球員紀錄     " + success1 + "    筆");
		return success1;
	}

	//-----新增多筆單場球員紀錄------
	@Transactional(rollbackFor = Exception.class)
	public int add_All_fightRecord(List<FightRecordVO> fRecordVOs)
	{
		int success = 0;
		for (FightRecordVO vo : fRecordVOs)
		{
			fightRecordDao.add_One(vo);
			success++;
		}
		System.out.println("成功新增單場球員紀錄         " + success + "    筆-並回傳整數" + success);
		return success;
	}

	//------取得多筆單場球員紀錄------
	public List<FightRecordVO> get_FightRecords_ByfightId(int fightId)
	{

		List<FightRecordVO> fightRecordVOs = fightRecordDao.find_All_By_fightId(fightId);
		System.out.println("成功查詢單場聯賽球員紀錄         " + fightRecordVOs.size() + "    筆" + "並回傳球員對戰紀錄VO" + fightRecordVOs.size() + "筆");
		for (FightRecordVO vo : fightRecordVOs)
		{
			vo.setMemberVO(memberDao.findByPrimaryKey(vo.getClubMemberId()));
		}
		System.out.println("成功查詢球員的MemberVO:         " + fightRecordVOs.size() + "    筆-放入單一聯賽球員紀錄VO內");
		System.out.println("回傳:  " + fightRecordVOs.size() + "     筆聯賽紀錄VOs(內包含多筆單一球員memberVO)");
		return fightRecordVOs;
	}

	//-----取得某球員多筆球賽紀錄
	public List<FightRecordVO> get_FightRecords_By_memberId(String memberId)
	{

		List<FightRecordVO> fightRecordVOs = fightRecordDao.find_All_By_clubMemberId(memberId);
		System.out.println("成功查詢單球員聯賽場次紀錄         " + fightRecordVOs.size() + "    筆" + "並回傳球員對戰紀錄VO" + fightRecordVOs.size() + "筆");
		for (FightRecordVO vo : fightRecordVOs)
		{
			vo.setMemberVO(memberDao.findByPrimaryKey(vo.getClubMemberId()));
		}
		System.out.println("成功查詢球員的MemberVO:         " + fightRecordVOs.size() + "    筆-放入單一聯賽球員紀錄VO內");
		System.out.println("回傳:  " + fightRecordVOs.size() + "     筆聯賽紀錄VOs(內包含多筆單一球員memberVO)");
		return fightRecordVOs;

	}
	//-----------------------------------------------------------------------------------------------------------------------------------	

}
