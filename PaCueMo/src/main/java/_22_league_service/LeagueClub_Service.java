package _22_league_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import _9_21_club_model.ClubDAO_I;
import _9_24_leagueClub_model.LeagueClubDAO_I;
import _9_24_leagueClub_model.LeagueClubVO;
import _9_25_leagueRecord_model.LeagueRecordDAO_I;
import _9_25_leagueRecord_model.LeagueRecordVO;
import _9_26_fightRecord_model.FightRecordDAO_I;

@Component
@Transactional
public class LeagueClub_Service
{
	@Autowired
	private LeagueClubDAO_I leagueClubDao;
	@Autowired
	private LeagueRecordDAO_I leagueRecordDao;
	@Autowired
	private FightRecordDAO_I fightRecordDao;
	@Autowired
	private ClubDAO_I clubDAO_I;

	// ---------新增聯賽球隊-------
	public int add_League_club(int leagueId, int clubId)
	{

		int success = leagueClubDao.add_One(new LeagueClubVO(leagueId, clubId));
		System.out.println("成功新增 1 筆聯賽社團");
		System.out.println("並回傳整數  " + success);
		return success;
	}

//修改社團
	public int update_LeagueClub(LeagueClubVO leagueClubVO)
	{

		return leagueClubDao.update(leagueClubVO);
	}

//-------------查詢全部社團-------
	public List<LeagueClubVO> get_All(int leagueId)
	{

		List<LeagueClubVO> leagueClubs = leagueClubDao.find_ALL(leagueId);
		for (LeagueClubVO vo : leagueClubs)
		{
			vo.setClubVO(clubDAO_I.findByPK(vo.getClubId()));
		}
		return leagueClubs;
	}

//	查詢社團參加多少聯賽
	public List<LeagueClubVO> get_All_By_ClubId(int clubId)
	{

		return leagueClubDao.get_ClubVOs_By_ClubId(clubId);
	}

	//--------刪除參加社團--------
	public int delete_league_club(int leagueId, int clubId)
	{

		List<LeagueRecordVO> leagueRecordVOs = leagueRecordDao.find_One(leagueId, clubId);
		System.out.println("查詢要刪除社團有      " + leagueRecordVOs.size() + "    筆聯賽場次紀錄");
		if (leagueRecordVOs.size() != 0)
		{
			for (LeagueRecordVO VO : leagueRecordVOs)
			{
				int deleteNumbers = fightRecordDao.delete_ALL(VO.getFightId());
				System.out.println("成功先刪除擁有該社團的場次球員紀錄    " + deleteNumbers + "  筆");
				int deleteNumbers1 = leagueRecordDao.delete_One(VO.getFightId());
				System.out.println("成功先刪除擁有該社團的聯賽場次紀錄    " + deleteNumbers1 + "  筆");
			}
		}
		int success = leagueClubDao.delete_One(new LeagueClubVO(leagueId, clubId));
		System.out.println("成功刪除聯賽社團       " + success + "   筆-回傳整數   " + success);
		return success;
	}

}
