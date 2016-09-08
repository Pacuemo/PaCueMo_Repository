package _00_config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan({ "_10_team_service", "_12_battlerecord_service", "_9_10_team_model", "_9_11_teammember_model", "_9_12_battlerecord_model",
				"_9_13_invitation_model" })
public class StevenScanConfig
{

}
