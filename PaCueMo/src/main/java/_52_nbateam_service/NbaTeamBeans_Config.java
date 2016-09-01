package _52_nbateam_service;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.jdbc.core.JdbcTemplate;

import _00_config.RootConfig;
import _9_52_nbateam_model.NBATeamDAO;

@Configuration
@ComponentScan({ "_9_52_nbateam_model", "_52_nbateam_service" })
@Import(RootConfig.class)// DataSource 、JdbcTemplate
public class NbaTeamBeans_Config
{
//	@Autowired
//	RootConfig rootConfig;// DataSource 、JdbcTemplate

	@Bean
	public NBATeamDAO nbaTeamDAO(JdbcTemplate jdbcTemplate)/* 由 RootConfig 注入 */
	{
		return new NBATeamDAO(jdbcTemplate);
	}

	@Bean
	public NBATeamService nbaTeamService(NBATeamDAO nbaTeamDAO)
	{
		return new NBATeamService(nbaTeamDAO);
	}
}
