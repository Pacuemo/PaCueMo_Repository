package _00_config;

import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.Profile;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.jndi.JndiObjectFactoryBean;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.warrenstrange.googleauth.GoogleAuthenticator;

import _00_initial_service.GlobalService;
import _10_Configs.StevenScanConfig;
import _50_SpringConfigs.Roger_ScanConfig;
import _9_21_club_model.ClubConfig;
import _9_23_league_model.LeagueConfig;

@Configuration
@ComponentScan({ "_9_41_member_model", "_00_initial_service" })
@Import({ ClubConfig.class, LeagueConfig.class, StevenScanConfig.class, LiyideScanConfig.class, Roger_ScanConfig.class })
@EnableTransactionManagement
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
//		ds.setUrl(GlobalService.DB_URL);
		//MAGICJACK_MAIN
		ds.setUrl("jdbc:sqlserver://" + GlobalService.HOST + ":1433;databaseName=MagicJack_main");
		ds.setUsername(GlobalService.USERID);
		ds.setPassword(GlobalService.PASSWORD);
		ds.setInitialSize(5);
		ds.setMaxTotal(10);
		return ds;
	}

	@Bean
	public DataSourceTransactionManager dataSourceTransactionManager(DataSource dataS)
	{
		return new DataSourceTransactionManager(dataS);
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

	@Bean
	public JsonObject jsonObject()
	{
		return new JsonObject();
	}

	@Bean
	public GoogleAuthenticator gAuth()
	{
		return new GoogleAuthenticator();
	}

	@Bean
	public MailSender mailSender()
	{
		JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
		Properties mailProperties = new Properties();
		mailProperties.put("mail.smtp.auth", "true");
		mailProperties.put("mail.smtp.starttls.enable", "true");
		mailSender.setHost("smtp.gmail.com");
		mailSender.setPort(587);
		mailSender.setUsername(GlobalService.EMAIL_USERNAME);
		mailSender.setPassword(GlobalService.EMAIL_PASSWORD);
		mailSender.setJavaMailProperties(mailProperties);
		mailSender.setDefaultEncoding("UTF-8");
		return mailSender;
	}
}
