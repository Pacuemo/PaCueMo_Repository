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
		// *************** (1). 更新﹝對戰組合﹞主客隊點數 =====
		bVO.setAwaybet(bVO.getAwaybet() + homeCoins);
		bVO.setHomebet(bVO.getHomebet() + awayCoins);
		bSetSvc.updateBattleSet(bVO);
		System.out.println(" 1.== GamblingFacade BattleSetVO 點數更新成功！== \n =========================================");
		// *************** (2). 更新﹝會員﹞點數 ===============
		Double newCoins = mVO.getMemberPoint() - (homeCoins + awayCoins);
		mVO.setMemberPoint(newCoins);
		memberDAO.updatePointByPrimaryKey(mVO);
		System.out.println(" 2.== GamblingFacade MemberVO 點數更新成功！== \n ============================================");
		// *************** (3). 新增﹝GambleOrder﹞一筆 ========
		GambleOrderVO gamblebVO = new GambleOrderVO();
		gamblebVO.setMemberId(mVO.getMemberId());
		gamblebVO.setBattleId(bVO.getBattleId());
		gamblebVO.setBetHome(Double.valueOf(homeCoins));
		gamblebVO.setBetAway(Double.valueOf(awayCoins));
		System.out.print(" 3.== GamblingFacade  ");
		gambleSvc.addOne(gamblebVO);
		//=====================================================
		return "success";
	}

	//==========================================================================================
	//================================【自動分派彩金】==========================================
	//==========================================================================================
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public String splitPayoff(String queryDate, Float commission)
	{
		System.out.println(" ======== 呼叫 GamblingFacade → splitPayoff() 分配彩金方法 =======\n");
		// 
		List<BattleSetVO> bSetList = bSetSvc.getAllBattleSetByDate(queryDate);
		DecimalFormat df = new DecimalFormat("##.00");
		for (BattleSetVO bSetVO : bSetList)
		{
			Integer battleId = bSetVO.getBattleId();
			Double homeBet = bSetVO.getHomebet();
			Double awayBet = bSetVO.getAwaybet();
			Double total = Double.parseDouble(df.format((homeBet + awayBet) * (1 - commission))); // 官方抽20%
			Double oddsHome = Double.parseDouble(df.format(total / homeBet)); // 主隊賠率
			Double oddsAway = Double.parseDouble(df.format(total / awayBet)); // 客隊賠率

			// ====================================================================
			// =====【更新比分為0的比賽場次】---- 產生不重複的 score 並 UPDATE ====
			// ====================================================================
			Integer homeScore = bSetVO.getHomeScore();
			Integer awayScore = bSetVO.getAwayScore();
			if (homeScore == 0 || awayScore == 0)
			{
				homeScore = (int) (Math.random() * (100 - 50 + 1)) + 50;// 50~100 之間亂數
				awayScore = (int) (Math.random() * (100 - 50 + 1)) + 50;
				while (homeScore == awayScore)
				{
					homeScore = (int) (Math.random() * (100 - 50 + 1)) + 50;
				}
			}
			bSetVO.setHomeScore(homeScore);
			bSetVO.setAwayScore(awayScore);
			bSetSvc.updateBattleSet(bSetVO);
			// ====================================================================
			System.out.println(
					String.format("%3s \t %10s ﹝%3s(主) : %-3s(客)﹞ %5s %5s %10s %10s \t total(抽 20%% 後):%-10s  odds:%5s(主賠) %5s(客賠)",
							bSetVO.getBattleId(),
							bSetVO.getBattleDateTime(),
							bSetVO.getHomeScore(),
							bSetVO.getAwayScore(),
							bSetVO.getHomeId(),
							bSetVO.getAwayId(),
							bSetVO.getHomebet(),
							bSetVO.getAwaybet(),
							total,
							oddsHome,
							oddsAway));

			List<MemberVO> mbList = gambleSvc.getMembersByBattleId(battleId);
			for (MemberVO mbVO : mbList)
			{
				System.err.println(String.format("◎◎◎%3s 分派前有 %8s 點", mbVO.getMemberFirstName(), mbVO.getMemberPoint()) + "\t" + mbVO.getMemberMail());
				List<GambleOrderVO> orderList = gambleSvc.getOrdersByMemberId(mbVO.getMemberId());
				for (GambleOrderVO orderVO : orderList)
				{
					Double betHome = orderVO.getBetHome();// user在本場次 主隊 的下注點數
					Double betAway = orderVO.getBetAway();// user在本場次 客隊 的下注點數
					Double totalBet = betHome + betAway; // user在本場次 總共 的下注點數
					//System.out.print("\t" + betHome + "\t" + betAway + "\t" + "本場次下注總額：" + totalBet + " ||| ");
					System.out.print(String.format("   (主)：%6s (客)%6s   \t本次下注總額：%-7s   |||", betHome, betAway, totalBet));
					Double bonusHome = (orderVO.getBetHome() * oddsHome);// 下主隊贏可獲得的點數
					Double bonusAway = (orderVO.getBetAway() * oddsAway);// 下客隊贏可獲得的點數
					//Double bonusTotal = bonusHome + bonusAway;// user在本場總共可獲得的點數

					if (homeScore > awayScore)
					{
						System.out.println(
								String.format("\t bonusHome : %5s(贏) \t bonusAway : %5s \t", bonusHome, bonusAway));
					}
					else
					{
						System.out.println(
								String.format("\t bonusHome : %5s \t bonusAway(贏) : %5s \t", bonusHome, bonusAway));
					}

					// ────────────────────────────────────────
					// ────── 設定每個會員要分派(update)的點數值 ──────
					// ────────────────────────────────────────
					if (homeScore > awayScore)// 主隊贏
					{
						mbVO.setMemberPoint(mbVO.getMemberPoint() + bonusHome);//更新結算點數 = 該會員原本的點數 + earn
					}
					else // 客隊贏
					{
						mbVO.setMemberPoint(mbVO.getMemberPoint() + bonusAway);//更新結算點數 = 該會員原本的點數 + earn
					}
					Double earn = totalBet - (bonusHome + bonusAway);
					//mbVO.setMemberPoint(mbVO.getMemberPoint() + bonusTotal);//更新結算點數 = 該會員原本的點數 + 總Bouns
					memberDAO.updatePointByPrimaryKey(mbVO);
					System.err.println("=================================【 更新 " + mbVO.getMemberFirstName() + " 點數: " + (mbVO.getMemberPoint()) + " "
							+ "\t賺： "
							+ totalBet + " - (" + bonusHome + " + " + bonusAway + ") = " + earn
							+ " 】===============================================");
				}
			}
		}
		System.out.println("●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●");
		System.out.println("●●●●●●●●●●●●●●●●●【分派獎金完成】●●●●●●●●●●●●●●●●●●");
		System.out.println("●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●");
		return "success";
	}

	public void test()
	{
		System.out.println("facadeService.test()：GGGGGGGGGGGGGGGGGGGGGGGGGGG");
	}

	public static void main(String[] args)
	{
		ApplicationContext context = new AnnotationConfigApplicationContext("_50_gambling_facade");
		GamblingFacade facadeService = (GamblingFacade) context.getBean("gamblingFacade4");
		//====================【測試 組裝成功】=========================
//		facadeService.test();
		//============== 【測試 splitPayoff() 分派點數】 =================
//		facadeService.splitPayoff("2016-09-14", 0.2f);
		//============== 【測試 memberDAO】 ==============================
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
