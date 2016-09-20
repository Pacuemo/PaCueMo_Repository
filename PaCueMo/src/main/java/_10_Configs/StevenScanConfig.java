package _10_Configs;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan({ "_10_steven_facade",
				"_10_team_service", "_9_10_team_model",
				"_11_teammember_service", "_9_11_teammember_model",
				"_12_battlerecord_service", "_9_12_battlerecord_model",
				"_9_13_teaminvite_model",
				"_14_teamapply_service", "_9_14_teamapply_model" })
public class StevenScanConfig
{

}
