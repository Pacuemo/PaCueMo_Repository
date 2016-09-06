package _00_config;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jndi.JndiObjectFactoryBean;

import com.google.gson.Gson;

import _00_initial_service.GlobalService;

@Configuration
@ComponentScan({ "_21_club_service", "_9_21_club_model", "_9_41_member_model", "_9_22_clubMember_model",
				"_22_league_service", "_9_23_league_model", "_9_24_leagueClub_model", "_9_24_leagueClub_model", "_9_25_leagueRecord_model" })
public class RootConfig
{

	@Bean
	@Profile("prod")
	public DataSource dataSource()
	{

		JndiObjectFactoryBean factoryBean = new JndiObjectFactoryBean();
		factoryBean.setJndiName(GlobalService.JNDI_DB_NAME);
		factoryBean.setResourceRef(true);
		factoryBean.setProxyInterface(javax.sql.DataSource.class);
		return (DataSource) factoryBean.getObject();
	}

	@Bean
	@Profile("default")
	public DataSource dataS()
	{

		BasicDataSource ds = new BasicDataSource();
		ds.setDriverClassName(GlobalService.DRIVER_NAME);
		ds.setUrl(GlobalService.DB_URL);
		ds.setUsername(GlobalService.USERID);
		ds.setPassword(GlobalService.PASSWORD);
		ds.setInitialSize(5);
		ds.setMaxTotal(10);
		return ds;
	}

	@Bean
	@Autowired
	public JdbcTemplate jdbcTemplate(DataSource dataSource)
	{
		return new JdbcTemplate(dataSource);
	}

	@Bean
	public Gson gson()
	{
		return new Gson();
	}

}
