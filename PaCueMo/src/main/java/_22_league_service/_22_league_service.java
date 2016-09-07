package _22_league_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

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
}
