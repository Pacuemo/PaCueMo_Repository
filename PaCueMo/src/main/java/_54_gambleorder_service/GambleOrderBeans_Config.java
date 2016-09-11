package _54_gambleorder_service;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.jdbc.core.JdbcTemplate;

import _00_config.RootConfig;
import _9_54_gambleorder_model.GambleOrderDAO;

@Configuration
@ComponentScan({ "_9_54_gambleorder_model" })
@Import({ RootConfig.class })
public class GambleOrderBeans_Config
{
	@Bean
	public GambleOrderDAO gambleOrderDAO(JdbcTemplate jdbcTemplate)
	{
		return new GambleOrderDAO(jdbcTemplate);
	}

}
