package _53_goodsorder_service;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.jdbc.core.JdbcTemplate;

import _00_config.RootConfig;
import _9_53_goodsorder_model.GoodsOrderDAO;

@Configuration
@ComponentScan({ "_9_53_goodsorder_model", "_53_goodsorder_service" })
@Import(RootConfig.class)
public class GoodsOrderBeans_Config
{
	@Bean
	public GoodsOrderDAO goodsOrderDAO(JdbcTemplate jdbcTemplate)
	{
		return new GoodsOrderDAO(jdbcTemplate);
	}

	@Bean(name = "goodsService")
	public GoodsOrderService goodsOrderService(GoodsOrderDAO goodsOrderDAO)
	{
		return new GoodsOrderService(goodsOrderDAO);
	}
}
