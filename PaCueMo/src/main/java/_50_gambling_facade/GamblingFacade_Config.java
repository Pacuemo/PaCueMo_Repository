package _50_gambling_facade;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

import _00_config.LiyideScanConfig;
import _51_battleset_service.BattleSetBeans_Config;
import _51_battleset_service.BattleSetService;
import _53_goodsorder_service.GoodsOrderBeans_Config;
import _53_goodsorder_service.GoodsOrderService;
import _54_gambleorder_service.GambleOrderBeans_Config;
import _54_gambleorder_service.GambleOrderService;
import _9_41_member_model.MemberDAO_interface_Spring;

@Configuration
@ComponentScan({ "_50_gambling_facade" })
@Import({ BattleSetBeans_Config.class, GoodsOrderBeans_Config.class, GambleOrderBeans_Config.class, LiyideScanConfig.class })
public class GamblingFacade_Config
{
	@Bean(name = "gamblingFacade1")
	public GamblingFacade gamblingFacade(BattleSetService bSetService)
	{
		return new GamblingFacade(bSetService);
	}

	@Bean(name = "gamblingFacade2")
	public GamblingFacade gamblingFacade(BattleSetService bSetService, GoodsOrderService goodsOrderSvc)
	{
		return new GamblingFacade(bSetService, goodsOrderSvc);
	}

	@Bean(name = "gamblingFacade3")
	public GamblingFacade gamblingFacade(BattleSetService bSetService, GoodsOrderService goodsOrderSvc, MemberDAO_interface_Spring memberDAO)
	{
		return new GamblingFacade(bSetService, goodsOrderSvc, memberDAO);
	}

	@Bean(name = "gamblingFacade4")
	public GamblingFacade gamblingFacade(BattleSetService bSetService, GoodsOrderService goodsOrderSvc, MemberDAO_interface_Spring memberDAO, GambleOrderService gambleSvc)
	{
		return new GamblingFacade(bSetService, goodsOrderSvc, memberDAO, gambleSvc);
	}
}
