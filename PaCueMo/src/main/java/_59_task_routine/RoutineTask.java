package _59_task_routine;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimerTask;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.web.context.support.WebApplicationContextUtils;

import _50_gambling_facade.GamblingFacade;
import _9_41_member_model.MemberDAO_interface_Spring;
import _9_41_member_model.MemberVO;

/**
 * 在 TimerManager 这个类里面，大家一定要注意 时间点的问题。如果你设定在凌晨2点执行任务。但你是在2点以后
 * 发布的程序或是重启过服务，那这样的情况下，任务会立即执行，而不是等到第二天的凌晨2点执行。为了，避免这种情况
 * 发生，只能判断一下，如果发布或重启服务的时间晚于定时执行任务的时间，就在此基础上加一天。
 * 
 * @author wls
 *
 */
@Path(value = "routineTask") //RESTful
@Component(value = "taskRoutine")
public class RoutineTask extends TimerTask
{
	@Autowired
	private GamblingFacade gamblingFacade4; /* 變數名一定要叫 gamblingFacade4 → 因為GamblingFacade_Config定義太多型態相同的GamblingFacade */
	@Autowired
	private MemberDAO_interface_Spring mbDAO;
	//--------------------------------------------
	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	private static final String format1 = "yyyy-MM-dd";
	static String flag_isUpdate = "yet_update";

	public RoutineTask()// for RESTful
	{

	}

	/********************************************
	 ** 撰寫每日要routine的動作寫在 run() 裡面 **
	 ********************************************/
	@Override
	public void run()
	{
		flag_isUpdate = "start_Update";
		//distributPointTask();// 定時分派賭金(點數)的task
	}

	@Context
	private javax.servlet.ServletContext servletContext;// RESTful 取得servletContext

	@GET /* 前端Ajax_LongPolling.js持續監控本方法，當每日執行時間一到，flag_isUpdate=="start_Update" ，進行更新動作 */
	@Produces("text/plain;charset=UTF-8")
	public String distributPointTask(@Context HttpServletRequest request)// 定時分派賭金(點數)的task→RESTful service，由前端ajax持續監控
	{
		synchronized (flag_isUpdate)
		{
			if ("start_Update".equals(flag_isUpdate))
			{
				//----------------------------------------------------------------
				//ApplicationContext context = new AnnotationConfigApplicationContext(RootConfig.class);
				ApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(servletContext);
				RoutineTask routineTask = (RoutineTask) context.getBean("taskRoutine");
				System.out.println(" ****** 執行當前的時間 " + sdf.format(Calendar.getInstance().getTime()) + " ****** ");
				try
				{
//					routineTask.gamblingFacade4.test(); // 測試組裝成功			
					Date querydate = Calendar.getInstance().getTime();
					//querydate = addDay(querydate, -1);// 若設定自動執行的時間為 00:00:00 ，查詢場次的日期必須減一天 【TimerManager → getCalendarWithTime(0, 0, 0)】
					sdf.applyPattern(format1);// 使用 "yyyy-MM-dd" 格式
					String querydateStr = sdf.format(querydate).toString();
					System.out.println("查詢時間 ：" + querydateStr);

					/*********************** 【分派彩金&更新對戰比數邏輯】 *************************/
					routineTask.gamblingFacade4.splitPayoff(querydateStr, 0.2f);
					/*********************** 【分派彩金&更新對戰比數邏輯】 *************************/

					/************************* 【更新Session中會員資料】 *************************/
					String mbId = ((MemberVO) request.getSession().getAttribute("LoginOK")).getMemberId();
					Double pointsAfterAllocate = routineTask.mbDAO.findByPrimaryKey(mbId).getMemberPoint();
					((MemberVO) request.getSession().getAttribute("LoginOK")).setMemberPoint(pointsAfterAllocate);
					System.out.println(" ==== 更新 session 中會員的 point ====  " + pointsAfterAllocate);
					/************************* 【更新Session中會員資料】 *************************/

					String tmpFlag = flag_isUpdate; // 第一個Ajax請求進入，tmpFlag == "start_Update"
					flag_isUpdate = "yet_update";// 立即將flag_isUpdate → 設回未更新→以免第2個請求瞬間也進入，造成連續更新資料兩次
					return tmpFlag;// return "start_Update"
				}
				catch (Exception e)
				{
					flag_isUpdate = "yet_update";
					System.out.println("-------------﹝RoutineTask.java 查詢對戰組合﹞發生例外狀況--------------");
					e.printStackTrace();
				}
				finally
				{
					//((ConfigurableApplicationContext) context).close();
					System.out.println(" =========== ApplicationContext 關閉成功 ===========");
				}
			}
			else
			{
				flag_isUpdate = "yet_update";
			}
			return flag_isUpdate;
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
