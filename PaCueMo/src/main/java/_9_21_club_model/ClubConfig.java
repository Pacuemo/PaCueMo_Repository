package _9_21_club_model;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

import _00_config.RootConfig;

@Import(RootConfig.class)
@Configuration
@ComponentScan({ "_9_21_club_model", "_9_22_clubMember_model", "_21_club_service",
				"_9_27_clubApply_model", "_9_28_clubInvite_model" })
public class ClubConfig
{

}
