package _50_goodsorder_facade;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import _53_goodsorder_service.GoodsOrderService;
import _9_41_member_model.MemberDAO_interface_Spring;

@Configuration
@ComponentScan({ "_50_goodsorder_facade" })
//@Import({ GoodsOrderBeans_Config.class, LiyideScanConfig.class })
public class GoodsOrderFacade_Config
{
	@Bean(name = "goodsOrderFacade2")
	public GoodsOrderFacade goodsOrderFacade(MemberDAO_interface_Spring memberDAO, GoodsOrderService goodsOrderService)
	{
		return new GoodsOrderFacade(memberDAO, goodsOrderService);
	}
}
