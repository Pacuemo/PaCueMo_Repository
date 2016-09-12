package _50_gambling_facade;

import java.text.DecimalFormat;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import _51_battleset_service.BattleSetService;
import _53_goodsorder_service.GoodsOrderService;
import _54_gambleorder_service.GambleOrderService;
import _9_41_member_model.MemberDAO_interface_Spring;
import _9_41_member_model.MemberVO;
import _9_51_battleset_model.BattleSetVO;
import _9_54_gambleorder_model.GambleOrderVO;

@Transactional
public class GamblingFacade
{
	private BattleSetService bSetSvc;
	private GoodsOrderService goodsOrderSvc;
	private MemberDAO_interface_Spring memberDAO;
	private GambleOrderService gambleSvc;

	public GamblingFacade()
	{

	}

	public GamblingFacade(BattleSetService bSetService)
	{
		this.bSetSvc = bSetService;
	}

	public GamblingFacade(BattleSetService bSetSvc, GoodsOrderService goodsOrderSvc)
	{
		this.bSetSvc = bSetSvc;
		this.goodsOrderSvc = goodsOrderSvc;
	}

	public GamblingFacade(BattleSetService bSetSvc, GoodsOrderService goodsOrderSvc, MemberDAO_interface_Spring memberDAO)
	{
		this.bSetSvc = bSetSvc;
		this.goodsOrderSvc = goodsOrderSvc;
		this.memberDAO = memberDAO;
	}

	public GamblingFacade(BattleSetService bSetSvc, GoodsOrderService goodsOrderSvc, MemberDAO_interface_Spring memberDAO, GambleOrderService gambleSvc)
	{
		this.bSetSvc = bSetSvc;
		this.goodsOrderSvc = goodsOrderSvc;
		this.memberDAO = memberDAO;
		this.gambleSvc = gambleSvc;
	}

	// readOnly=true : 唯讀,不能更新,刪除
	// PROPAGATION_REQUIRED	 : 支援現在的交易，如果沒有的話就建立一個新的交易
	// PROPAGATION_MANDATORY : 方法必須在一個現存的交易中進行，否則丟出例外
	// @Transactional(rollbackFor=Exception.class) //指定回滾,需要捕獲的例外(throw new Exception(“");)不會回滾
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public String updateMemberAndBattleSetCoin(BattleSetVO bVO, MemberVO mVO, Integer homeCoins, Integer awayCoins)
	{
		System.out.println(" ======== 呼叫 GamblingFacade → updateMemberAndBattleSetCoin(BattleSetVO bVO , MemberVO mVO) 方法 =======");
		// *************** 更新﹝對戰組合﹞主客隊點數 =====
		bVO.setAwaybet(bVO.getAwaybet() + homeCoins);
		bVO.setHomebet(bVO.getHomebet() + awayCoins);
		bSetSvc.updateBattleSet(bVO);
		System.out.println(" 1.== BattleSetVO 點數更新成功！== \n =========================================");
		// *************** 更新﹝會員﹞點數 ===============
		Double newCoins = mVO.getMemberPoint() - (homeCoins + awayCoins);
		mVO.setMemberPoint(newCoins);
		memberDAO.updatePointByPrimaryKey(mVO);
		//---
		System.out.println(" 2.== MemberVO 點數更新成功！== \n ===========================================");
		return "success";
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public String splitPayoff(String queryDate, Float commission)
	{
		System.out.println(" ======== 呼叫 GamblingFacade → splitPayoff() 分配彩金方法 =======\n");
		// 
		List<BattleSetVO> bSetList = bSetSvc.getAllBattleSetByDate(queryDate);
		DecimalFormat df = new DecimalFormat("##.00");
		for (BattleSetVO vo : bSetList)
		{
			Integer battleId = vo.getBattleId();
			Double homeBet = vo.getHomebet();
			Double awayBet = vo.getAwaybet();
			Double total = Double.parseDouble(df.format((homeBet + awayBet) * commission)); // 官方抽20%
			Double oddsHome = Double.parseDouble(df.format(total / homeBet)); // 賠率
			Double oddsAway = Double.parseDouble(df.format(total / awayBet)); // 賠率
			System.out.println(String.format("%3s \t %10s %8s %5s %10s %10s  \t total:%8s \t odds:%5s %5s",
					vo.getBattleId(), vo.getBattleDateTime(), vo.getHomeId(), vo.getAwayId(), vo.getHomebet(), vo.getAwaybet(),
					total, oddsHome, oddsAway));

			List<MemberVO> mbList = gambleSvc.getMembersByBattleId(battleId);
			for (MemberVO mbVO : mbList)
			{
				System.err.println(String.format("%3s %8s", mbVO.getMemberFirstName(), mbVO.getMemberPoint()) + "\t");
				List<GambleOrderVO> orderList = gambleSvc.getOrdersByMemberId(mbVO.getMemberId());
				for (GambleOrderVO orderVO : orderList)
				{
					System.out.print("\t\t" + orderVO.getBetHome() + "\t" + orderVO.getBetAway() + "\t\t");
					Double bonusHome = (orderVO.getBetHome() * oddsHome);
					Double bonusAway = (orderVO.getBetAway() * oddsAway);
					Double bonusTotal = bonusHome + bonusAway;
					String str = String.format("bonusHome : %5s \t bonusAway : %5s \t bonusTotal: %5s ", bonusHome, bonusAway, (bonusTotal));
					System.out.println(str);
//					System.out.println("bonusHome : " + bonusHome + "   " + "bonusAway : " + bonusAway + "   total:  " + (bonusHome + bonusAway));
					mbVO.setMemberPoint(mbVO.getMemberPoint() + bonusTotal);// 原本的點數 + Bouns
					memberDAO.updatePointByPrimaryKey(mbVO);
					System.err.println("==========================================【 更新 " + mbVO.getMemberFirstName() + " 點數" + (mbVO.getMemberPoint()) + " 】===============================================");
				}
			}
		}
//		gambleSvc.getMembersByBattleId(BattleId)
		return "success";
	}

	public static void main(String[] args)
	{
		ApplicationContext context = new AnnotationConfigApplicationContext("_50_gambling_facade");
		GamblingFacade facadeService = (GamblingFacade) context.getBean("gamblingFacade4");
		//============== 【測試 splitPayoff()】 =================
		facadeService.splitPayoff("2016-09-13", 0.2f);
		//============== 【測試 memberDAO】 =================
//		int ii = facadeService.testUpdateMemberPoints("jyurjh920790@pchome.com.tw");
//		System.out.println(" 更新 " + ii + " 筆點數資料");
//		// ========== 【測試更新BattleSetVO】 ==============
//		BattleSetVO bSetVO = new BattleSetVO();
//		bSetVO.setBattleId(1);
//		bSetVO.setBattleDateTime(java.sql.Timestamp.valueOf("2014-04-27 08:05:33"));
//		bSetVO.setHomeId(5);
//		bSetVO.setAwayId(7);
//		bSetVO.setHomeScore(77);
//		bSetVO.setAwayScore(80);
//		bSetVO.setHomebet(98000.0);
//		bSetVO.setAwaybet(97000.0);
//		facadeService.updateMemberAndBattleSetCoin(bSetVO);

	}
}

//// 測試memberDAO spring
//public int testUpdateMemberPoints(String memberMail)
//{
//	MemberVO vo = memberDAO.findByUserMail(memberMail);
//	vo.setMemberPoint(9999);
//	return memberDAO.updatePointByPrimaryKey(vo);
//}
