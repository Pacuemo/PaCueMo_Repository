package _9_13_invitation_model;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

import _00_config.RootConfig;

@Import(RootConfig.class)
@Configuration
@ComponentScan("_9_13_invitation_model")
public class InvitationConfig
{

}
