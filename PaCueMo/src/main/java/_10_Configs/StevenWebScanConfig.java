package _10_Configs;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan({ "_10_team_controller", "_12_battlerecord_controller" })
public class StevenWebScanConfig
{
}
