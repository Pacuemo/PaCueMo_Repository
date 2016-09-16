package _59_task_routine;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class RoutineTaskListener implements ServletContextListener
{

	@Override
	public void contextInitialized(ServletContextEvent sce)
	{
		System.out.println("應用程式───誕生");
		new TimerManager();// 應用程式誕生時產生 TimerManager 管理所有 TimerTask
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce)
	{
		System.out.println("應用程式───結束");
	}

}
