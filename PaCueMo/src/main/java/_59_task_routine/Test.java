package _59_task_routine;

import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Component;

import _50_gambling_facade.GamblingFacade;
import _50_gambling_facade.GamblingFacade_Config;

@Component(value = "ggg")
public class Test
{
//	@Autowired // BattleSetBeans_Config 有scan 【"_51_battleset_service"套件】 → 將其中定義的Bean注入 _51_battleset_service 套件中的類別
//	private BattleSetService battleSetSvc;
	@Autowired // BattleSetBeans_Config 有scan 【"_59_task_routine"套件】
	private GamblingFacade gamblingFacade4;// 變數名一定要叫 gamblingFacade4 ，因為GamblingFacade_Config類別中定義多個相同型態的Bean
	private static final String format1 = "dd/MM/yyyy";
	private static final String format2 = "yyyy-MM-dd";

	public Test()
	{
	}

	public static void main(String[] args) throws ParseException
	{
		///////////////////////////////////////【測試 GamblingFacade 】////////////////////////////////////////////////////
		ApplicationContext context = new AnnotationConfigApplicationContext(GamblingFacade_Config.class);
		Test obj = (Test) context.getBean("ggg");
//		obj.gamblingFacade4.test();
//		obj.gamblingFacade4.splitPayoff("2016-09-13", 0.2f);
		////////////////////////////////////////【測試 battleSetSvc 】開始///////////////////////////////////////
//		ApplicationContext context = new AnnotationConfigApplicationContext(BattleSetBeans_Config.class);
//		ApplicationContext context = new AnnotationConfigApplicationContext(GamblingFacade_Config.class);
//		Test obj = (Test) context.getBean("ggg");
//		//------------------------------------------------------------------
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		Date date = Calendar.getInstance().getTime();
////		Date querydate = Test.addDay(date, -1);
//		String querydateStr = sdf.format(date).toString();
//		System.out.println(querydateStr);
//
//		List<Map<String, Object>> list = obj.battleSetSvc.getSetsByDate(querydateStr);
//		for (Map<String, Object> map : list)
//		{
//			System.out.println(
//					map.get("battleTime") + "   " +
//							((NBATeamVO) map.get("home")).getTeamName() +
//							"  vs  " + ((NBATeamVO) map.get("away")).getTeamName());
//		}
		////////////////////////////////////////【測試 battleSetSvc 】結束///////////////////////////////////////
	}

	// 增加或减少天数
	public static Date addDay(Date date, int num)
	{
		Calendar startDT = Calendar.getInstance();
		startDT.setTime(date);
		startDT.add(Calendar.DAY_OF_MONTH, num);
		return startDT.getTime();
	}
}
