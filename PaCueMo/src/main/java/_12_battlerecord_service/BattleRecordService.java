package _12_battlerecord_service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Component;

import _00_config.RootConfig;
import _10_steven_facade.StevenFacade;
import _9_10_team_model.TeamDAO;
import _9_10_team_model.TeamVO;
import _9_11_teammember_model.TeamMemberVO;
import _9_12_battlerecord_model.BattleRecordDAO_I;
import _9_12_battlerecord_model.BattleRecordVO;
import _9_31_court_model.CourtDAO;
import _9_41_member_model.MemberDAO_interface_Spring;
import _9_41_member_model.MemberVO;

@Component
public class BattleRecordService
{
	@Autowired
	private BattleRecordDAO_I battleRecordDAO;
	@Autowired
	private TeamDAO teamDAO;
	@Autowired
	private MemberDAO_interface_Spring memberDAO;
	@Autowired
	private StevenFacade stevenFacade;

	public BattleRecordService()
	{
	}

	@Transactional(rollbackOn = Exception.class)
	public void add(BattleRecordVO battleRecordVO)
	{
		System.out.println("BattleRecordService : add start");
		TeamVO teamAVO = stevenFacade.getTeamById(battleRecordVO.getTeamIdA());
		TeamVO teamBVO = stevenFacade.getTeamById(battleRecordVO.getTeamIdB());

		double bet = battleRecordVO.getBattleBet();
		for (TeamMemberVO teamMemberVO : teamAVO.getTeamMemberVOs())
		{
			System.out.println("bet = " + bet + " || TeamA 人數 = " + teamAVO.getTeamMemberVOs().size());
			double betA = (bet / teamAVO.getTeamMemberVOs().size() * 100 % 1) / 100;
			System.out.println("betA = " + betA);
			MemberVO memberVO = memberDAO.findByPrimaryKey(teamMemberVO.getTeamMemberId());
			double memberPoint = memberVO.getMemberPoint() - betA;
			memberVO.setMemberPoint(memberPoint);
			memberDAO.updatePointByPrimaryKey(memberVO);
		}
		for (TeamMemberVO teamMemberVO : teamBVO.getTeamMemberVOs())
		{
			System.out.println("bet = " + bet + " || TeamB 人數 = " + teamBVO.getTeamMemberVOs().size());
			double betB = (bet / teamBVO.getTeamMemberVOs().size() * 100 % 1) / 100;
			System.out.println("betB = " + betB);
			MemberVO memberVO = memberDAO.findByPrimaryKey(teamMemberVO.getTeamMemberId());
			double memberPoint = memberVO.getMemberPoint() - betB;
			memberVO.setMemberPoint(memberPoint);
			memberDAO.updatePointByPrimaryKey(memberVO);
		}

		System.out.println("BattleRecordService : add success");
		battleRecordDAO.add(battleRecordVO);
	}

	public void accept_Reject(Integer battleStatus, Integer battleId)
	{
		battleRecordDAO.accept_Reject(battleStatus, battleId);
	}

	public void reportA(BattleRecordVO battleRecordVO)
	{
		battleRecordDAO.reportA(battleRecordVO);
	}

	public void reportB(BattleRecordVO battleRecordVO)
	{
		battleRecordDAO.reportB(battleRecordVO);
	}

	public void accept_Reject(BattleRecordVO battleRecordVO)
	{
		battleRecordDAO.accept_Reject(battleRecordVO);
	}

	public void delete(Integer batteleRecordId)
	{
		battleRecordDAO.delete(batteleRecordId);
	}

	public BattleRecordVO findById(Integer battleId)
	{
		return battleRecordDAO.findById(battleId);
	}

	public List<BattleRecordVO> findByTeamIdA(Integer teamIdA)
	{
		List<BattleRecordVO> battleRecordVOs = battleRecordDAO.findByTeamIdA(teamIdA);
		for (BattleRecordVO battleRecordVO : battleRecordVOs)
		{
			battleRecordVO.setTeamAVO(teamDAO.getTeamById(battleRecordVO.getTeamIdA()));
			battleRecordVO.setTeamBVO(teamDAO.getTeamById(battleRecordVO.getTeamIdB()));
		}
		return battleRecordVOs;
	}

	public List<BattleRecordVO> findByTeamIdB(Integer teamIdB)
	{
		List<BattleRecordVO> battleRecordVOs = battleRecordDAO.findByTeamIdB(teamIdB);
		for (BattleRecordVO battleRecordVO : battleRecordVOs)
		{
			battleRecordVO.setTeamAVO(teamDAO.getTeamById(battleRecordVO.getTeamIdA()));
			battleRecordVO.setTeamBVO(teamDAO.getTeamById(battleRecordVO.getTeamIdB()));
		}
		return battleRecordVOs;
	}

	public List<BattleRecordVO> findByTeamIdB_NotDec(Integer teamIdB)
	{
		List<BattleRecordVO> battleRecordVOs = battleRecordDAO.findByTeamIdB_NotDec(teamIdB);
		CourtDAO courtDAO = new CourtDAO();
		for (BattleRecordVO battleRecordVO : battleRecordVOs)
		{
			battleRecordVO.setTeamAVO(teamDAO.getTeamById(battleRecordVO.getTeamIdA()));
			battleRecordVO.setTeamBVO(teamDAO.getTeamById(battleRecordVO.getTeamIdB()));
			battleRecordVO.setCourtVO(courtDAO.findByPrimaryKey(battleRecordVO.getCourtId()));
		}
		return battleRecordVOs;
	}

	public List<BattleRecordVO> getAll()
	{
		return battleRecordDAO.getAll();
	}

	public Double getAttendancePercent(Integer teamId)
	{
		return (100.0 - battleRecordDAO.getAbsencePercent(teamId));
	}

	public Double getWPCT(Integer teamId)
	{
		return battleRecordDAO.getWPCT(teamId);
	}

	public static void main(String[] args)
	{
		ApplicationContext context = new AnnotationConfigApplicationContext(RootConfig.class);
		BattleRecordService service = context.getBean(BattleRecordService.class);

		System.out.println(service.getAttendancePercent(4));
	}

}
