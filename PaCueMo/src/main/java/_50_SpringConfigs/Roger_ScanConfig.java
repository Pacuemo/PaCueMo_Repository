package _50_SpringConfigs;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

import _50_gambling_facade.GamblingFacade_Config;
import _50_goodsorder_facade.GoodsOrderFacade_Config;
import _51_battleset_service.BattleSetBeans_Config;
import _52_nbateam_service.NbaTeamBeans_Config;
import _53_goodsorder_service.GoodsOrderBeans_Config;
import _54_gambleorder_service.GambleOrderBeans_Config;

@Configuration
@Import({ GoodsOrderBeans_Config.class,
				GambleOrderBeans_Config.class,
				NbaTeamBeans_Config.class,
				BattleSetBeans_Config.class,
				GoodsOrderFacade_Config.class,
				GamblingFacade_Config.class })
//=== @ComponentScan ==== 寫在個別config.java檔中
//@ComponentScan({ "_9_53_goodsorder_model", "_53_goodsorder_service" })
//@ComponentScan({ "_9_54_gambleorder_model", "_53_goodsorder_service" })
//@ComponentScan({ "_9_52_nbateam_model", "_52_nbateam_service" })
//@ComponentScan({ "_9_51_battleset_model", "_51_battleset_service" })
//@ComponentScan({ "_50_goodsorder_facade" })
//@ComponentScan({ "_50_gambling_facade", "_59_task_routine" })
public class Roger_ScanConfig
{

}
