package _59_task_routine;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Component;

import _51_battleset_service.BattleSetBeans_Config;
import _51_battleset_service.BattleSetService;
import _9_52_nbateam_model.NBATeamVO;

@Component(value = "ggg")
public class Test
{
	@Autowired
	private BattleSetService battleSetSvc;
	private static final String format1 = "dd/MM/yyyy";
	private static final String format2 = "yyyy-MM-dd";

	public Test()
	{
	}

	public static void main(String[] args) throws ParseException
	{
		ApplicationContext context = new AnnotationConfigApplicationContext(BattleSetBeans_Config.class);
		Test obj = (Test) context.getBean("ggg");
		//------------------------------------------------------------------
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = Calendar.getInstance().getTime();
		Date querydate = Test.addDay(date, -1);
		String querydateStr = sdf.format(querydate).toString();
		System.out.println(querydateStr);

		List<Map<String, Object>> list = obj.battleSetSvc.getSetsByDate(querydateStr);
		for (Map<String, Object> map : list)
		{
			System.out.println(((NBATeamVO) map.get("home")).getTeamName() + "  vs  " + ((NBATeamVO) map.get("away")).getTeamName());
		}

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
