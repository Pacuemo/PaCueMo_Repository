package _54_gambleorder_service;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.jdbc.core.JdbcTemplate;

import _00_config.RootConfig;
import _51_battleset_service.BattleSetBeans_Config;
import _9_41_member_model.MemberDAO_Spring;
import _9_51_battleset_model.BattleSetDAO;
import _9_54_gambleorder_model.GambleOrderDAO;

@Configuration
@ComponentScan({ "_9_54_gambleorder_model", "_53_goodsorder_service" })
@Import({ RootConfig.class, BattleSetBeans_Config.class })
public class GambleOrderBeans_Config
{
	@Bean
	public GambleOrderDAO gambleOrderDAO(JdbcTemplate jdbcTemplate)
	{
		return new GambleOrderDAO(jdbcTemplate);
	}

//	@Bean
//	public GambleOrderService gambleOrderService(GambleOrderDAO gambleOrderDAO)
//	{
//		return new GambleOrderService(gambleOrderDAO);
//	}

	@Bean
	public GambleOrderService gambleOrderService(GambleOrderDAO gambleOrderDAO, MemberDAO_Spring memberDAO, BattleSetDAO bSetDAO)
	{
		return new GambleOrderService(gambleOrderDAO, memberDAO, bSetDAO);
	}
}
