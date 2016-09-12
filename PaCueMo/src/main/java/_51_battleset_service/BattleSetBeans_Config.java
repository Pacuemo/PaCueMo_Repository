package _51_battleset_service;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.jdbc.core.JdbcTemplate;

import _52_nbateam_service.NBATeamService;
import _52_nbateam_service.NbaTeamBeans_Config;
import _9_51_battleset_model.BattleSetDAO;

@Configuration
@ComponentScan({ "_9_51_battleset_model", "_51_battleset_service", "_59_task_routine" })
@Import({ NbaTeamBeans_Config.class }) /* jdbcTemplate、dataSource 、NBATeamService */
public class BattleSetBeans_Config
{
//	@Autowired
//	RootConfig rootConfig; /* jdbcTemplate、dataSource */

	@Bean
	public BattleSetDAO bSetDAO(JdbcTemplate jdbcTemplate)
	{
		return new BattleSetDAO(jdbcTemplate);
	}

	@Bean
	public BattleSetService bSetService(BattleSetDAO bSetDAO, NBATeamService nbaSvc)
	{
		return new BattleSetService(bSetDAO, nbaSvc);
	}

//	@Bean
//	public RoutineTask routineTask(BattleSetService battleSetSvc)
//	{
//		return new RoutineTask(battleSetSvc);
//	}
}
