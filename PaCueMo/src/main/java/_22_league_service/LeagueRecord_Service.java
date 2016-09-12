package _22_league_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import _9_21_club_model.ClubDAO_I;
import _9_25_leagueRecord_model.LeagueRecordDAO_I;
import _9_25_leagueRecord_model.LeagueRecordVO;
import _9_26_fightRecord_model.FightRecordDAO_I;
import _9_26_fightRecord_model.FightRecordVO;

@Component
@Transactional
public class LeagueRecord_Service
{
	@Autowired
	private LeagueRecordDAO_I leagueRecordDAO;
	@Autowired
	private FightRecordDAO_I fightRecordDao;
	@Autowired
	private ClubDAO_I clubDao;

//新增聯賽紀錄(賽程表)
	@Transactional(rollbackFor = Exception.class)
	public int add_LeaguesRecord(List<LeagueRecordVO> leagueRecordVOs)
	{

		int success = 0;
		for (LeagueRecordVO vo : leagueRecordVOs)
		{
			leagueRecordDAO.add_One(vo);
			success++;
		}
		System.out.println("成功新增聯賽紀錄表       " + success + "  筆-回傳整數       " + success);
		return success;
	}

//修改聯賽紀錄(賽程表)
	@Transactional(rollbackFor = Exception.class)
	public int update_LeagueRecord(List<LeagueRecordVO> leagueRecordVOs)
	{
		int success = 0;
		for (LeagueRecordVO vo : leagueRecordVOs)
		{
			leagueRecordDAO.update_One(vo);
			success++;
		}
		System.out.println("成功修改聯賽紀錄表       " + success + "  筆-回傳整數       " + success);
		return success;
	}

//查詢所有賽程
	public List<LeagueRecordVO> get_All_LeagueReacords(int leagueId)
	{

		List<LeagueRecordVO> leagueRecords = leagueRecordDAO.find_All(leagueId);
		System.out.println("成功查詢聯賽紀錄表      " + leagueRecords.size() + "    筆-回傳物件List<LeagueRecordVO>");
		return leagueRecords;
	}

//查詢社團賽程
	public List<LeagueRecordVO> get_One_LeagueRecord(int leagueId, int cludId)
	{
		List<LeagueRecordVO> leagueRecordVOs = leagueRecordDAO.find_One(leagueId, cludId);
		System.out.println("成功查詢單一社團於聯賽紀錄   " + leagueRecordVOs.size() + "筆");
		for (LeagueRecordVO vo : leagueRecordVOs)
		{
			List<FightRecordVO> fightRecordVOs = fightRecordDao.find_All_By_fightId(vo.getFightId());

			if (fightRecordVOs.size() == 0 || fightRecordVOs == null)
			{

			}
			else
			{
				vo.setFightRecordVOs(fightRecordVOs);
			}

		}
		System.out.println("成功將每場聯賽之球員紀錄裝入leagueRecordVO中-並傳回leagueRecordVOs物件");
		return leagueRecordVOs;
	}

//刪除聯賽紀錄表
	@Transactional(rollbackFor = Exception.class)
	public int delete_One_LeagueRecord(int fightId)
	{

		int success = fightRecordDao.delete_ALL(fightId);
		System.out.println("成功刪除fightRecords   " + success + " 筆");
		int success1 = leagueRecordDAO.delete_One(fightId);
		System.out.println("成功刪除leagueRecor   " + success1 + " 筆");
		return success1;
	}

//查詢社團聯賽
	public LeagueRecordVO get_By_FightId(int fightId)
	{
		LeagueRecordVO leagueRecordVO = leagueRecordDAO.find_One(fightId);
		leagueRecordVO.setClubA(clubDao.findByPK(leagueRecordVO.getClubIdA()));
		leagueRecordVO.setClubB(clubDao.findByPK(leagueRecordVO.getClubIdB()));
		return leagueRecordVO;
	}

}
