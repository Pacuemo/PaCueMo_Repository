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
		new TimerManager();
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce)
	{
		// TODO Auto-generated method stub
		System.out.println("應用程式───結束");
	}

}
