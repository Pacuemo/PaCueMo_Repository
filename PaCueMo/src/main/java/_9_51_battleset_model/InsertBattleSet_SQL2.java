package _9_51_battleset_model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Random;
import java.util.Set;
import java.util.TreeSet;

class Battle
{
	public String year;
	public String month;
	public String day;
	public String hour;
	public String min;
	public String homeId;
	public String awayId;
	public String homeScore;
	public String awayScore;
	public String homeBet;
	public String awayBet;
}

public class InsertBattleSet_SQL2
{

	public static void main(String[] args) throws ParseException
	{
		int yearBegin = 2015;
		int yearEnd = 2016;
		int monthBegin = 11;
		int monthEnd = 10 + 12;

		String[] mon = new String[monthEnd - monthBegin + 1];//比賽月份
		int i = 0;
		for (Integer mm = monthBegin ; mm <= monthEnd ; mm++)
		{
			String strMM = mm.toString();
			if (mm > 12)
			{
				if (mm - 12 < 10)
				{
					strMM = yearEnd + " 0" + String.valueOf(mm - 12);
				}
				else
				{
					strMM = yearEnd + " " + String.valueOf(mm - 12);
				}
			}
			else
			{
				strMM = yearBegin + " " + strMM;
			}
			mon[i++] = strMM;
		}
//		for (String string : mon)
//		{
//			System.out.println(string);
//		}
		/////////////////////////////////////////////////////////////////
		Random rand = new Random();
		int perMon = 15; // 每月幾天有比賽
		int count = 0;
		ArrayList<Battle> arrList = new ArrayList<>();
		for (String year_Mon : mon)
		{
//			System.out.println(year_Mon.substring(0, 4));
//			System.out.println(year_Mon.substring(5, 7));
			Integer[] date = noRepateRandom(30, perMon);
			for (int j = 0 ; j < perMon ; j++)// 每月的幾號
			{
				//System.out.println(date[j]);
				String dd = String.valueOf(date[j]);
				int perDayBattle = (int) (Math.random() * (10 - 5 + 1)) + 5;// 每天有 5~10 場

				Integer[] btSetTeamNum = RandomArray(noRepateRandom2(30, perDayBattle * 2));
				int numTeam = 0;
				//
				for (int k = 0 ; k < perDayBattle ; k++)
				{
					java.util.Date date1 = new java.util.Date(System.currentTimeMillis());

//					java.util.Date date2 = new java.util.Date(Integer.valueOf(year_Mon.substring(0, 4)),
//							Integer.valueOf(year_Mon.substring(5, 7)),
//							Integer.valueOf(dd));

					java.sql.Date date2 = java.sql.Date.valueOf(year_Mon.substring(0, 4) + "-" + year_Mon.substring(5, 7) + "-" + dd);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					String strDate1 = sdf.format(date1);
					String strDate2 = sdf.format(date2);
//					System.out.println("today0  " + strDate1);
//					System.out.println("batDate0 " + strDate2);
//					System.out.println(strDate1.equals(strDate2));
					if (strDate1.equals(strDate2))
					{
						continue;// 不產生當天的資料，當天資料在SSMS中寫
					}

					Battle bt = new Battle();
					bt.year = year_Mon.substring(0, 4);
					bt.month = year_Mon.substring(5, 7);
					bt.day = dd;
					//
					int hh = (int) (Math.random() * (23 - 0 + 1)) + 0;
					if (hh < 10)
					{
						bt.hour = "0" + String.valueOf(hh);
					}
					else
					{
						bt.hour = String.valueOf(hh);
					}
					//
					int mm = (int) (Math.random() * (59 - 0 + 0)) + 0;
					if (mm < 10)
					{
						bt.min = "0" + String.valueOf(mm);
					}
					else
					{
						bt.min = String.valueOf(mm);
					}
					/////////////// 對戰組合 //////////////////
					Integer homeId = btSetTeamNum[numTeam];
					Integer awayId = btSetTeamNum[++numTeam];
					numTeam++;
					bt.homeId = String.valueOf(homeId);
					bt.awayId = String.valueOf(awayId);
					//////////////// 比分 /////////////////////
					Integer homeScore = null;
					Integer awayScore = null;

					java.util.Date today = new java.util.Date(System.currentTimeMillis());
					java.sql.Date batDate = java.sql.Date.valueOf(bt.year + "-" + bt.month + "-" + bt.day);
					if (batDate.after(today))
					{
						homeScore = 0;
						awayScore = 0;
					}
					else
					{
						do
						{
							homeScore = (int) (Math.random() * (100 - 60 + 1)) + 60;
							awayScore = (int) (Math.random() * (100 - 60 + 1)) + 60;
						}
						while ((homeScore - awayScore) == 0);
					}

					bt.homeScore = String.valueOf(homeScore);
					bt.awayScore = String.valueOf(awayScore);
					///////////////// 賭金 ////////////////////
					int homeBet = 0;
					int awayBet = 0;
					do
					{
						homeBet = (rand.nextInt(50000) + 1) * 100;
						awayBet = (rand.nextInt(50000) + 1) * 100;
					}
					while (Math.abs(Double.valueOf(homeBet - awayBet)) == 0.0);
					bt.homeBet = String.valueOf(homeBet);
					bt.awayBet = String.valueOf(awayBet);
					arrList.add(bt);
					//count++;
				}

			}

		}
//		for (Battle battle : arrList)
//		{
//			String tmp = String.format("%10s %6s %6s %6s %10s %10s %10s %10s %10s %10s %10s",
//					battle.year, battle.month, battle.date, battle.hour, battle.min, battle.homeId, battle.awayId,
//					battle.homeScore, battle.awayScore, battle.homeBet, battle.awayBet);
////			System.out.print((Double.valueOf(battle.homeBet) / Double.valueOf(battle.awayBet)) + "   ");
//			System.out.println(tmp);
//		}
//		System.out.println("arrList.size() = " + arrList.size());
//		System.out.println("total " + count);
		//==============================================================================================
		//==============================================================================================
		//==============================================================================================
		//==============================================================================================
		//==============================================================================================
//		System.out.println(arrList.get(0).year + "  " + arrList.get(0).month + "   " + arrList.get(0).date);
		//System.out.println("共 " + arrList.size() + " 場");
		for (Battle battle : arrList)
		{
			myformat(battle.year, battle.month, battle.day, battle.hour, battle.min, battle.homeId, battle.awayId, battle.homeScore, battle.awayScore, battle.homeBet, battle.awayBet);
		}

	}

	public static Integer[] noRepateRandom(int range, int num)
	{
		Set<Integer> set = new TreeSet<>();
		Random rand = new Random();
		while (set.size() < num)
		{
			int aa = rand.nextInt(range) + 1;
			set.add(aa);
		}
		Integer[] arr = new Integer[set.size()];
		int i = 0;
		for (Integer iii : set)
		{
			arr[i++] = iii;
		}
		return arr;
	}

	public static Integer[] noRepateRandom2(int range, int num)
	{
		Set<Integer> set = new HashSet<>();
		Random rand = new Random();
		while (set.size() < num)
		{
			int aa = rand.nextInt(range) + 1;
			set.add(aa);
		}
		Integer[] arr = new Integer[set.size()];
		int i = 0;
		for (Integer iii : set)
		{
			arr[i++] = iii;
		}
		return arr;
	}

	private static Integer[] RandomArray(Integer[] integers)
	{
		int mLength = integers.length;
		int mRandom, mNumber;

		for (int i = 0 ; i < mLength ; i++)
		{
			mRandom = (int) (Math.random() * mLength);
			mNumber = integers[i];
			integers[i] = integers[mRandom];
			integers[mRandom] = mNumber;
		}

		return integers;
	}

	private static final void myformat(String year, String month, String date, String hour, String min, String homeId, String awayId, String homeScore, String awayScore, String homeBet, String awayBet)
	{
//		System.out.println();
		System.out.println("INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )");
		System.out.print("VALUES");
		System.out.println(String.format("('%s-%s-%s %s:%s', %s , %s , %s , %s , %s , %s)", year, month, date, hour, min, homeId, awayId, homeScore, awayScore, homeBet, awayBet));
	}
}
