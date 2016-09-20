package _54_gambleorder_service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import _00_config.RootConfig;
import _9_41_member_model.MemberDAO_Spring;
import _9_41_member_model.MemberDAO_interface_Spring;
import _9_41_member_model.MemberVO;
import _9_51_battleset_model.BattleSetDAO_interface;
import _9_51_battleset_model.BattleSetVO;
import _9_54_gambleorder_model.GambleOrderDAO;
import _9_54_gambleorder_model.GambleOrderVO;

public class GambleOrderService
{

	private GambleOrderDAO gambleOrderDAO;
	private MemberDAO_interface_Spring memberDAO;
	private BattleSetDAO_interface battleSetDAO;

	public GambleOrderService()
	{
	}

	public GambleOrderService(GambleOrderDAO gambleOrderDAO, MemberDAO_Spring memberDAO, BattleSetDAO_interface battleSetDAO)
	{
		this.gambleOrderDAO = gambleOrderDAO;
		this.memberDAO = memberDAO;
		this.battleSetDAO = battleSetDAO;
	}

	public Integer addOne(GambleOrderVO vo)
	{
		return gambleOrderDAO.insert(vo);
	}

	public Integer update(GambleOrderVO vo)
	{
		return gambleOrderDAO.update(vo);
	}

	public Integer delete(Integer gambleId)
	{
		return gambleOrderDAO.delete(gambleId);
	}

	public GambleOrderVO getOne(Integer gambleId)
	{
		return gambleOrderDAO.findByPrimaryKey(gambleId);
	}

	public List<GambleOrderVO> getAll()
	{
		return gambleOrderDAO.getAll();
	}

	//------ 查所有gambleOrder，包含會員資料 -----------
	public List<GambleOrderVO> getAll_EmbedMember()
	{
		List<GambleOrderVO> returnList = new ArrayList<>();
		List<GambleOrderVO> orderList = gambleOrderDAO.getAll();
		for (GambleOrderVO gambleOrderVO : orderList)
		{
			String mbId = gambleOrderVO.getMemberId();
			MemberVO mb = memberDAO.findByPrimaryKey(mbId);
			gambleOrderVO.setMemberVO(mb);
			returnList.add(gambleOrderVO);
		}
		return returnList;
	}

	public List<GambleOrderVO> getOrdersByMemberId(String memberId)
	{
		return gambleOrderDAO.getByMemberId(memberId);
	}

	public List<GambleOrderVO> getOrdersByBattleId(Integer battleId)
	{
		return gambleOrderDAO.getByBattleId(battleId);
	}

	public List<MemberVO> getMembersByBattleId(Integer BattleId)// 根據battleId查詢所有下注該場的會員VO
	{
		List<MemberVO> returnList = new ArrayList<>();
		List<GambleOrderVO> orderList = gambleOrderDAO.getByBattleId(BattleId);
		for (GambleOrderVO gambleOrderVO : orderList)
		{
			String pk = gambleOrderVO.getMemberId();
			MemberVO mbvo = memberDAO.findByPrimaryKey(pk);
			returnList.add(mbvo);
		}
		return returnList;
	}

	public List<BattleSetVO> getBattleSetsByMbId(String memberId)// 根據battleId查詢所有下注該場的會員VO
	{
		List<BattleSetVO> returnList = new ArrayList<>();
		List<GambleOrderVO> orderList = gambleOrderDAO.getByMemberId(memberId);
		for (GambleOrderVO gambleOrderVO : orderList)
		{
			Integer pk = gambleOrderVO.getBattleId();
			BattleSetVO btVO = battleSetDAO.findByPrimaryKey(pk);
			returnList.add(btVO);
		}
		return returnList;
	}

	public static void main(String[] args)
	{
//		ApplicationContext context = new AnnotationConfigApplicationContext(GambleOrderBeans_Config.class);
		ApplicationContext context = new AnnotationConfigApplicationContext(RootConfig.class);
		GambleOrderService svc = context.getBean(GambleOrderService.class);
		//========= 【測試】getAll_EmbedMember() ==========
//		List<GambleOrderVO> list = svc.getAll_EmbedMember();
//		for (GambleOrderVO gbVO : list)
//		{
//			String str = String.format("%3s %3s \t %10s %10s %10s",
//					gbVO.getMemberVO().getMemberLastName(),
//					gbVO.getMemberVO().getMemberFirstName(),
//					gbVO.getBetTime(),
//					gbVO.getBetHome(),
//					gbVO.getBetAway());
//			System.out.println(str);
//		}
		//========= 【測試】addOne() ==========
//		GambleOrderVO vvo = new GambleOrderVO();
//		vvo.setMemberId("01BF5304-DBCF-4BA9-A2C6-7200C98D7B9B");
//		vvo.setBattleId(254);
//		vvo.setBetHome(999.0);
//		vvo.setBetAway(999.0);
//		vvo.setBetTime(java.sql.Timestamp.valueOf("2016-09-19 11:23:00"));
//		svc.addOne(vvo);
		//========= 【測試】Update() ==========
//		GambleOrderVO vvo = new GambleOrderVO();
//		vvo.setGambleId(46);
//		vvo.setMemberId("01BF5304-DBCF-4BA9-A2C6-7200C98D7B9B");
//		vvo.setBattleId(254);
//		vvo.setBetHome(888.0);
//		vvo.setBetAway(888.0);
//		vvo.setBetTime(java.sql.Timestamp.valueOf("2016-09-19 11:23:00"));
//		svc.update(vvo);
		//========= 【測試】getOne() ==========
//		GambleOrderVO vo = svc.getOne(1);
//		System.out.println(
//				String.format("%1s %40s %5s %10s %10s \t %10s",
//						vo.getGambleId(),
//						vo.getMemberId(),
//						vo.getBattleId(),
//						vo.getBetHome(),
//						vo.getBetAway(),
//						vo.getBetTime()));
		//========= 【測試】getAll() ==========
//		List<GambleOrderVO> list = svc.getAll();
//		for (GambleOrderVO vo : list)
//		{
//			String tmp = String.format("%1s %40s %5s %10s %10s \t %10s",
//					vo.getGambleId(),
//					vo.getMemberId(),
//					vo.getBattleId(),
//					vo.getBetHome(),
//					vo.getBetAway(),
//					vo.getBetTime());
//			System.out.println(tmp);
//		}
		//========= 【測試】getMembersByBattleId() ==========
//		List<MemberVO> list = svc.getMembersByBattleId(2);
//		for (MemberVO vo : list)
//		{
//			System.out.println(vo.getMemberFirstName() + " " + vo.getMemberLastName());
//		}
		//========= 【測試】getBattleSetsByMbId() ==========
//		List<BattleSetVO> list = svc.getBattleSetsByMbId("091CA478-5C43-40F9-AEEB-63A509B90E21");
//		for (BattleSetVO vo : list)
//		{
//			System.out.println(vo.getBattleDateTime() + " " + vo.getBattleId());
//		}
		//========= 【測試】getOrdersByBattleId() ==========
//		List<GambleOrderVO> list = svc.getOrdersByBattleId(315);
//		for (GambleOrderVO vo : list)
//		{
//			String tmp = String.format("%1s %40s %5s %10s %10s \t %10s",
//					vo.getGambleId(),
//					vo.getMemberId(),
//					vo.getBattleId(),
//					vo.getBetHome(),
//					vo.getBetAway(),
//					vo.getBetTime());
//			System.out.println(tmp);
//		}
	}

}
