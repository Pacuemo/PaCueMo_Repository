package _00_config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@EnableWebMvc
//加入需要被裝載的控制器位置
@ComponentScan({ "_21_club_controller", "_22_league_controller", "_41_login_controller" })
public class WebConfig extends WebMvcConfigurerAdapter
{

//	宣告視圖解析器
	@Bean
	public ViewResolver viewResolver()
	{
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/");
		resolver.setSuffix(".jsp");
		resolver.setContentType("text/html;charset=UTF-8");
		resolver.setExposeContextBeansAsAttributes(true);
		return resolver;

	}

	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer)
	{
//靜態資源不透過Spring DispatcherServlet轉交
//理解(類似乎叫index.html或是default.html這種沒有動態產生的畫面，直接透過Tomcat內建的Servlet轉交即可)
		configurer.enable();
	}

}
