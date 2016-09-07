package _53_gambling_facade;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import _51_battleset_service.BattleSetService;
import _53_goodsorder_service.GoodsOrderService;
import _9_51_battleset_model.BattleSetVO;

@Transactional
public class GamblingFacade
{
	private BattleSetService bSetSvc;
	private GoodsOrderService goodsOrderSvc;

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

	// readOnly=true : 唯讀,不能更新,刪除
	// PROPAGATION_REQUIRED	 : 支援現在的交易，如果沒有的話就建立一個新的交易
	// PROPAGATION_MANDATORY : 方法必須在一個現存的交易中進行，否則丟出例外
	// @Transactional(rollbackFor=Exception.class) //指定回滾,需要捕獲的例外(throw new Exception(“");)不會回滾
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public String updateMemberAndBattleSetCoin(BattleSetVO vo)
	{
		// -- 更新﹝對戰組合﹞主客隊點數 --
		vo.getBattleId();// pk
		vo.getBattleDateTime();
		vo.getAwayId();
		vo.getHomeId();
		vo.getAwayScore();
		vo.getHomeScore();
		vo.getAwaybet();
		vo.getHomebet();
		bSetSvc.updateBattleSet(vo);
		// -- 更新﹝會員﹞點數 --

		System.out.println(" 0.== call 【GamblingFacade】 == \n 1.== BattleSetVO 點數更新成功！== \n 2.== MemberVO 點數更新成功！== \n ===========================================");
		return "success";
	}

	public static void main(String[] args)
	{
		ApplicationContext context = new AnnotationConfigApplicationContext("_53_gambling_facade");
		GamblingFacade facade2 = (GamblingFacade) context.getBean("gamblingFacade2");
		// ========== 【測試更新BattleSetVO】 ==============
		BattleSetVO bSetVO = new BattleSetVO();
		bSetVO.setBattleId(1);
		bSetVO.setBattleDateTime(java.sql.Timestamp.valueOf("2014-04-27 08:05:33"));
		bSetVO.setHomeId(5);
		bSetVO.setAwayId(7);
		bSetVO.setHomeScore(77);
		bSetVO.setAwayScore(80);
		bSetVO.setHomebet(98000.0);
		bSetVO.setAwaybet(97000.0);
		facade2.updateMemberAndBattleSetCoin(bSetVO);

	}
}
