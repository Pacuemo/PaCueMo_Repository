package _00_config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan({ "_41_login_service", "_9_41_member_model", "_42_register_service" })
public class LiyideScanConfig
{

}
