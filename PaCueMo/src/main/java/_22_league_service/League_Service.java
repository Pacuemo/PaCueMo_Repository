package _22_league_service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import _00_config.RootConfig;
import _9_21_club_model.ClubDAO_I;
import _9_23_league_model.LeagueDAO_I;
import _9_23_league_model.LeagueVO;
import _9_24_leagueClub_model.LeagueClubDAO_I;
import _9_24_leagueClub_model.LeagueClubVO;
import _9_25_leagueRecord_model.LeagueRecordDAO_I;
import _9_25_leagueRecord_model.LeagueRecordVO;
import _9_26_fightRecord_model.FightRecordDAO_I;
import _9_31_court_model.CourtDAO;
import _9_31_court_model.CourtDAO_interface;
import _9_41_member_model.MemberDAO_interface;

@Component
@Transactional
public class League_Service
{
	@Autowired
	private LeagueDAO_I leagueDao;
	@Autowired
	private LeagueClubDAO_I leagueClubDao;
	@Autowired
	private LeagueRecordDAO_I leagueRecordDao;
	@Autowired
	private ClubDAO_I clubDao;
	@Autowired
	private FightRecordDAO_I fightRecordDao;
	@Autowired
	private MemberDAO_interface memberDao;
	private CourtDAO_interface courtDao = new CourtDAO();

//---------------查詢全部聯賽-------------

	public List<LeagueVO> getAll()
	{
		List<LeagueVO> LeagueVOs = leagueDao.find_All();
		System.out.println("成功查詢全部聯賽: " + LeagueVOs.size() + " 筆");
		for (LeagueVO vo : LeagueVOs)
		{
			vo.setCourtVO(courtDao.findByPrimaryKey(vo.getPlaceID()));
		}
		System.out.println("並成功加入:   " + LeagueVOs.size() + "  筆場地VO至聯賽VO");
		System.out.println("回傳: " + LeagueVOs.size() + " 筆聯賽VO");
		return LeagueVOs;
	}

//-----------------查詢單一聯賽----------------
	public LeagueVO getOne(int leagueId)
	{
		LeagueVO leagueVO = leagueDao.findOne(leagueId);
		System.out.println("成功查詢聯賽:  1    筆-傳入值為聯賽Id");
		leagueVO.setCourtVO(courtDao.findByPrimaryKey(leagueVO.getPlaceID()));
		System.out.println("並成功加入:  1    筆場地VO至聯賽VO");
		List<LeagueClubVO> leagueClubs = leagueClubDao.find_ALL(leagueId);
		System.out.println("並成功查詢該聯賽參予聯賽社團VO:   " + leagueClubs.size());
		for (LeagueClubVO vo : leagueClubs)
		{
			vo.setClubVO(clubDao.findByPK(vo.getClubId()));
		}
		System.out.println("並成功透過聯賽社團VOs       " + leagueClubs.size() + "     筆查詢社團VO，且放入聯賽社團VOs");
		leagueVO.setLeagueClubVOs(leagueClubs);
		System.out.println("將聯賽社團VOs放入聯賽VO內(聯賽VO內的聯賽社團VOs以完善)");
		List<LeagueRecordVO> LeagueRecordVO = leagueRecordDao.find_All(leagueId);
		System.out.println("並成功透過聯賽Id查詢聯賽場次紀錄VOs       " + LeagueRecordVO.size() + "    筆");
		leagueVO.setLeagueRecordVOs(LeagueRecordVO);
		System.out.println("將聯賽場次紀錄VOs放入聯賽VO內(聯賽VO內的聯賽場次紀錄VOs已完善)");
		System.out.println("回傳: 1     筆聯賽VO(內包含   參予聯賽社團資訊  及   目前該聯賽場次紀錄)");
		return leagueVO;
	}

//	---------新增聯賽---------
	public int add_League(LeagueVO leagueVO)
	{
		int success = leagueDao.addOne(leagueVO);
		System.out.println("成功新增 1 筆聯賽資訊");
		System.out.println("並回傳整數  " + success);
		return success;

	}

//------取得某社團多	

	//------交易測試--------
	@Transactional(rollbackFor = Exception.class)
	public void insert()
	{
		leagueDao.addOne(new LeagueVO(4, "幹你娘", 12, new Date(System.currentTimeMillis()), new Date(System.currentTimeMillis()), 1));
		leagueClubDao.add_One(new LeagueClubVO(10, 1));
	}

	public static void main(String[] args)
	{
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(RootConfig.class);
		League_Service dao = context.getBean(League_Service.class);
		dao.insert();
		System.out.println("成功");
	}
}
