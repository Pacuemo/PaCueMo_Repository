package _00_config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan({ "_41_login_service", "_9_41_member_model", "_42_register_service",
				"_9_43_friendsList_model", "_9_42_playerCard_model", "_43_member_service",
				"_44_playercard_service", "_43_member_service" })
public class LiyideScanConfig
{

}
