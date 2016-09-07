package _12_battlerecord_service;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

import _00_config.RootConfig;

@Configuration
@Import(RootConfig.class)
@ComponentScan("_12_battlerecord_service")
public class BattleRecordConfig
{

}
