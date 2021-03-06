package _59_task_routine;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.TimerTask;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Component;

import _50_gambling_facade.GamblingFacade;
import _50_gambling_facade.GamblingFacade_Config;
import _51_battleset_service.BattleSetService;
import _9_52_nbateam_model.NBATeamVO;

/**
 * 在 TimerManager 这个类里面，大家一定要注意 时间点的问题。如果你设定在凌晨2点执行任务。但你是在2点以后
 * 发布的程序或是重启过服务，那这样的情况下，任务会立即执行，而不是等到第二天的凌晨2点执行。为了，避免这种情况
 * 发生，只能判断一下，如果发布或重启服务的时间晚于定时执行任务的时间，就在此基础上加一天。
 * 
 * @author wls
 *
 */
@Component(value = "taskPerDay")
public class RoutineTask_test_backup extends TimerTask
{
	@Autowired
	private BattleSetService battleSetSvc;
	@Autowired
	private GamblingFacade gamblingFacade4; /* 變數名一定要叫 gamblingFacade4 → 因為GamblingFacade_Config定義太多型態相同的GamblingFacade */
	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	private static final String format1 = "yyyy-MM-dd";

	public RoutineTask_test_backup()
	{

	}

	@Override
	public void run()
	{
		/*** 撰寫每日要routine的動作 ***/
		testTask();// 測試查詢BattleSet
	}

	private void distributPointTask()
	{

	}

	private void testTask()// 測試：查詢對戰組合
	{
		ApplicationContext context = new AnnotationConfigApplicationContext(GamblingFacade_Config.class);
		RoutineTask_test_backup routineTask = (RoutineTask_test_backup) context.getBean("taskPerDay");
		System.out.println(" ****** 執行當前的時間" + sdf.format(Calendar.getInstance().getTime()) + " ****** ");
		try
		{
			//routineTask.gamblingFacade4.test(); // 測試組裝成功
			Date querydate = Calendar.getInstance().getTime();
			//querydate = addDay(querydate, -1);// 若設定自動執行的時間為 00:00:00 ，查詢場次的日期必須減一天 【TimerManager → getCalendarWithTime(0, 0, 0)】
			sdf.applyPattern(format1);// 使用 "yyyy-MM-dd" 格式
			String querydateStr = sdf.format(querydate).toString();
			System.out.println("查詢時間 ：" + querydateStr);

			List<Map<String, Object>> list = routineTask.battleSetSvc.getSetsByDate(querydateStr);
			for (Map<String, Object> map : list)
			{
				System.out.println(
						map.get("battleTime") + "   " +
								((NBATeamVO) map.get("home")).getTeamName() +
								"  vs  " + ((NBATeamVO) map.get("away")).getTeamName());
			}
		}
		catch (Exception e)
		{
			System.out.println("-------------﹝RoutineTask.java 查詢對戰組合﹞發生例外狀況--------------");
			e.printStackTrace();
		}
		finally
		{
			((ConfigurableApplicationContext) context).close();
			System.out.println(" =========== ApplicationContext 關閉成功 ===========");
		}

	}

	// 增加或减少天数
	private Date addDay(Date date, int num)
	{
		Calendar startDT = Calendar.getInstance();
		startDT.setTime(date);
		startDT.add(Calendar.DAY_OF_MONTH, num);
		return startDT.getTime();
	}
}
