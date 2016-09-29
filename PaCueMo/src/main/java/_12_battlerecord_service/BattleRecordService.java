package _12_battlerecord_service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Component;

import _00_config.RootConfig;
import _10_steven_facade.StevenFacade;
import _9_10_team_model.TeamDAO_interface;
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
	private TeamDAO_interface teamDAO;
	@Autowired
	private MemberDAO_interface_Spring memberDAO;
	@Autowired
	private StevenFacade stevenFacade;
	@Autowired
	private CourtDAO courtDAO;

	public BattleRecordService()
	{
	}

	public void add(BattleRecordVO battleRecordVO)
	{
		battleRecordDAO.add(battleRecordVO);
	}

	public void accept_Reject(Integer battleStatus, Integer battleId)
	{
		battleRecordDAO.accept_Reject(battleStatus, battleId);
	}

	public void reportA(BattleRecordVO battleRecordVO)
	{
		battleRecordDAO.reportA(battleRecordVO);
		chkResult(battleRecordVO);
	}

	public void reportB(BattleRecordVO battleRecordVO)
	{
		battleRecordDAO.reportB(battleRecordVO);
		chkResult(battleRecordVO);
	}

	public void chkResult(BattleRecordVO battleRecordVO)
	{
		System.out.println("BattleRecordService : chkResult");
		battleRecordVO = battleRecordDAO.findById(battleRecordVO.getBattleId());
		try
		{
			System.out.println("result = " + battleRecordVO.getResult());
			if (battleRecordVO.getResult() == 1)
			{
				System.out.println("BattleRecordService : chkResult TeamA win");
				TeamVO teamAVO = stevenFacade.getTeamById(battleRecordVO.getTeamIdA());
				double bet = battleRecordVO.getBattleBet() * 2;
				for (TeamMemberVO teamMemberVO : teamAVO.getTeamMemberVOs())
				{
					System.out.println("2*bet = " + bet + " || TeamA 人數 = " + teamAVO.getTeamMemberVOs().size());
					double betA = (bet / teamAVO.getTeamMemberVOs().size() * 100);
					betA = (Math.round(betA) / 100);
					System.out.println("發放點數(每人) = " + betA);
					MemberVO memberVO = memberDAO.findByPrimaryKey(teamMemberVO.getTeamMemberId());
					double memberPoint = memberVO.getMemberPoint() + betA;
					memberVO.setMemberPoint(memberPoint);
					memberDAO.updatePointByPrimaryKey(memberVO);
				}

			}
			else if (battleRecordVO.getResult() == 2)
			{
				System.out.println("BattleRecordService : chkResult TeamB win");
				TeamVO teamBVO = stevenFacade.getTeamById(battleRecordVO.getTeamIdB());
				double bet = battleRecordVO.getBattleBet() * 2;
				for (TeamMemberVO teamMemberVO : teamBVO.getTeamMemberVOs())
				{
					System.out.println("bet = " + bet + " || TeamB 人數 = " + teamBVO.getTeamMemberVOs().size());
					double betB = (bet / teamBVO.getTeamMemberVOs().size() * 100);
					betB = (Math.round(betB) / 100);
					System.out.println("發放點數 = " + betB);
					MemberVO memberVO = memberDAO.findByPrimaryKey(teamMemberVO.getTeamMemberId());
					double memberPoint = memberVO.getMemberPoint() + betB;
					memberVO.setMemberPoint(memberPoint);
					memberDAO.updatePointByPrimaryKey(memberVO);
				}
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
			System.out.println("WTF GG 幹幹幹");
		}
	}

	@Transactional(rollbackOn = Exception.class)
	public void accept_Reject(BattleRecordVO battleRecordVO)
	{
		System.out.println("BattleRecordService : accept_Reject start");

		battleRecordDAO.accept_Reject(battleRecordVO);

		TeamVO teamAVO = stevenFacade.getTeamById(battleRecordVO.getTeamIdA());
		TeamVO teamBVO = stevenFacade.getTeamById(battleRecordVO.getTeamIdB());

		double bet = battleRecordVO.getBattleBet();
		for (TeamMemberVO teamMemberVO : teamAVO.getTeamMemberVOs())
		{
			System.out.println("bet = " + bet + " || TeamA 人數 = " + teamAVO.getTeamMemberVOs().size());
			double betA = (bet / teamAVO.getTeamMemberVOs().size() * 100);
			betA = (Math.round(betA) / 100);
			System.out.println("betA = " + betA);
			MemberVO memberVO = memberDAO.findByPrimaryKey(teamMemberVO.getTeamMemberId());
			double memberPoint = memberVO.getMemberPoint() - betA;
			memberVO.setMemberPoint(memberPoint);
			memberDAO.updatePointByPrimaryKey(memberVO);
		}
		for (TeamMemberVO teamMemberVO : teamBVO.getTeamMemberVOs())
		{
			System.out.println("bet = " + bet + " || TeamB 人數 = " + teamBVO.getTeamMemberVOs().size());
			double betB = (bet / teamBVO.getTeamMemberVOs().size() * 100);
			betB = (Math.round(betB) / 100);
			System.out.println("betB = " + betB);
			MemberVO memberVO = memberDAO.findByPrimaryKey(teamMemberVO.getTeamMemberId());
			double memberPoint = memberVO.getMemberPoint() - betB;
			memberVO.setMemberPoint(memberPoint);
			memberDAO.updatePointByPrimaryKey(memberVO);
		}

		System.out.println("BattleRecordService : accept_Reject success");
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
