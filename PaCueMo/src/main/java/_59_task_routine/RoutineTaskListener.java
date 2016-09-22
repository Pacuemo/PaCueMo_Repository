package _59_task_routine;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class RoutineTaskListener implements ServletContextListener
{

	@Override
	public void contextInitialized(ServletContextEvent sce)
	{
		ServletContext context = sce.getServletContext();
		// 設定Timer起始時間
		context.setAttribute("timerHH", 0);
		context.setAttribute("timerMM", 0);
		context.setAttribute("timerSS", 0);
		//-------------------
		System.out.println("RoutineTaskListener : 應用程式啟動");
		new TimerManager(context);// 應用程式誕生時產生 TimerManager 管理所有 TimerTask
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce)
	{
		System.out.println("RoutineTaskListener : 應用程式結束");
	}

}
