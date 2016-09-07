package _22_league_service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import _00_config.RootConfig;
import _9_21_club_model.ClubDAO_I;
import _9_23_league_model.LeagueDAO_I;
import _9_23_league_model.LeagueVO;
import _9_24_leagueClub_model.LeagueClubDAO_I;
import _9_24_leagueClub_model.LeagueClubVO;
import _9_25_leagueRecord_model.LeagueRecordDAO_I;
import _9_26_fightRecord_model.FightRecordDAO_I;
import _9_26_fightRecord_model.FightRecordVO;
import _9_31_court_model.CourtDAO;
import _9_31_court_model.CourtDAO_interface;
import _9_41_member_model.MemberDAO_interface;

@Component
@Transactional
public class _22_league_service
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

//---------------全部聯賽-------------

	public List<LeagueVO> getAll()
	{
		List<LeagueVO> LeagueVOs = leagueDao.find_All();
		for (LeagueVO vo : LeagueVOs)
		{
			vo.setCourtVO(courtDao.findByPrimaryKey(vo.getPlaceID()));
		}
		return LeagueVOs;
	}

//-----------------單一聯賽----------------
	public LeagueVO getOne(int leagueId)
	{
		LeagueVO leagueVO = leagueDao.findOne(leagueId);
		leagueVO.setCourtVO(courtDao.findByPrimaryKey(leagueVO.getPlaceID()));
		List<LeagueClubVO> leagueClubs = leagueClubDao.find_ALL(leagueId);
		for (LeagueClubVO vo : leagueClubs)
		{
			vo.setClubVO(clubDao.findByPK(vo.getClubId()));
		}
		leagueVO.setLeagueClubVOs(leagueClubs);
		leagueVO.setLeagueRecordVOs(leagueRecordDao.find_All(leagueId));
		return leagueVO;
	}

//----------------單場賽事------------------
	public List<FightRecordVO> getOneFightRecords(int fightId)
	{
		List<FightRecordVO> fightRecordVOs = fightRecordDao.find_All_By_fightId(fightId);
		for (FightRecordVO vo : fightRecordVOs)
		{
			vo.setMemberVO(memberDao.findByPrimaryKey(vo.getClubMemberId()));
		}
		return fightRecordVOs;
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public void insert()
	{
		leagueDao.addOne(new LeagueVO(4, "幹你娘", 12, new Date(System.currentTimeMillis()), new Date(System.currentTimeMillis()), 1));
		leagueClubDao.add_One(new LeagueClubVO(5, 1));
	}

	public static void main(String[] args)
	{
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(RootConfig.class);
		_22_league_service dao = context.getBean(_22_league_service.class);
		dao.insert();
		System.out.println("成功");
	}
}
