package _59_task_routine;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Timer;

import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

/**
 * java定时任务，每天定时执行任务
 * 
 * @author wls
 *
 */

@Path("/TimerManager")
public class TimerManager
{
	//時間間隔
	private static final long PERIOD_DAY = 24 * 60 * 60 * 1000; // 時間間隔﹝一天﹞
//	private static final long PERIOD_DAY = 10 * 60 * 1000; // 時間間隔﹝十分鐘﹞
	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	private int hour;
	private int min;
	private int sec;

	public TimerManager()
	{
		//--- 建構子 ----
		this.hour = 9;
		this.min = 35;
		this.sec = 30;
		//---------------
		setTimerTask(this.hour, this.min, this.sec);
	}

	@POST
	@Produces("text/plain;charset=UTF-8")
	@Path("/setAllocateTime")// 設定分派彩金時間(後台功能)
	public String setPointsTime(@FormParam("hour") Integer hour, @FormParam("min") Integer min, @FormParam("sec") Integer sec)
	{
		System.out.println("呼叫RESTful setPointsTime() 傳入的： hour : " + hour + "  min : " + min + " sec : " + sec);
		this.hour = hour;
		this.min = min;
		this.sec = sec;
		//------------------------------
		try
		{
			setTimerTask(hour, min, sec);
			return "success";
		}
		catch (Exception e)
		{
			return "fail";
		}
		//------------------------------
	}

	private void setTimerTask(int hour, int min, int sec)
	{
		/*** 設定每日 00:00:00 執行方法 ***/
		Calendar calendar = getCalendarWithTime(hour, min, sec);//【設定每天的幾點執行】時、分、秒  ──  24h制
		Date dateMain = calendar.getTime(); //第一次執行任務的時間

//		System.out.println("TimerManager ── " + sdf.format(dateMain));
//		System.out.println("TimerManager ── before 方法比较：" + dateMain.before(new Date()));
//		若第一次執行定時任務的時間小於目前時間，加一天
//		此時要在 第一次執行定时任務的時間 加一天，以便此任務可在下個時間點執行。如果不加一天，任務會立即執行。循環執行的週期以當前時間為準
		if (dateMain.before(new Date()))
		{
			dateMain = this.addDay(dateMain, 1);
			System.out.println("TimerManager ── " + sdf.format(dateMain));
		}
		/*************** MainTimer *********************/
		Timer timerMain = new Timer();
		RoutineTask task = new RoutineTask(); //TimerTask
		//============================================================
		//=== 安排指定的任務在指定的時間開始進行重覆的固定延遲執行 ===
		//============================================================
		timerMain.schedule(task, dateMain, PERIOD_DAY); // ※Main Timer
	}

	// 設定要執行的時間
	public Calendar getCalendarWithTime(int hh, int mm, int ss)
	{
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.HOUR_OF_DAY, hh);
		calendar.set(Calendar.MINUTE, mm);
		calendar.set(Calendar.SECOND, ss);
		return calendar;
	}

	// 增加或减少天数
	public Date addDay(Date date, int num)
	{
		Calendar startDT = Calendar.getInstance();
		startDT.setTime(date);
		startDT.add(Calendar.DAY_OF_MONTH, num);
		return startDT.getTime();
	}
}
