package _54_gambleorder_service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

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

	public List<MemberVO> getMembersByBattleId(Integer BattleId)// 根據battleId查詢所有下注該場的會員VO
	{
		List<MemberVO> returnList = new ArrayList<>();
		List<GambleOrderVO> orderList = gambleOrderDAO.getBybattleId(BattleId);
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
		ApplicationContext context = new AnnotationConfigApplicationContext(GambleOrderBeans_Config.class);
		GambleOrderService svc = context.getBean(GambleOrderService.class);

		//========= 【測試】addOne() ==========
//		GambleOrderVO vvo = new GambleOrderVO();
//		vvo.setMemberId("FB59BB9B-6A41-48B7-8410-5C39FCACCB82");
//		vvo.setBattleId(254);
//		vvo.setBetMoney(2300.0);
//		vvo.setBetTeam(0);
//		svc.addOne(vvo);
		//========= 【測試】Update() ==========
//		GambleOrderVO vvo = new GambleOrderVO();
//		vvo.setGambleId(11);
//		vvo.setMemberId("FB59BB9B-6A41-48B7-8410-5C39FCACCB82");
//		vvo.setBattleId(114);
//		vvo.setBetMoney(8000.0);
//		vvo.setBetTeam(1);
//		svc.update(vvo);

		//========= 【測試】getOne() ==========
//		GambleOrderVO vo = svc.getOne(1);
//		System.out.println(vo.getMemberId());
		//========= 【測試】getAll() ==========
//		List<GambleOrderVO> list = svc.getAll();
//		for (GambleOrderVO vo : list)
//		{
//			String tmp = String.format("%1s %40s %5s %10s %10s", vo.getGambleId(), vo.getMemberId(), vo.getBattleId(), vo.getBetMoney(), vo.getBetTeam());
//			System.out.println(tmp);
//		}
		//========= 【測試】getMembersByBattleId() ==========
//		List<MemberVO> list = svc.getMembersByBattleId(2);
//		for (MemberVO vo : list)
//		{
//			System.out.println(vo.getMemberFirstName() + " " + vo.getMemberLastName());
//		}
		//========= 【測試】getBattleSetsByMbId() ==========
		List<BattleSetVO> list = svc.getBattleSetsByMbId("382F736E-F2BF-48C7-8A60-466FD01AE887");
		for (BattleSetVO vo : list)
		{
			System.out.println(vo.getBattleDateTime() + " " + vo.getBattleId());
		}
	}

}
