package _51_battleset_service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;

import _52_nbateam_service.NBATeamService;
import _9_51_battleset_model.BattleSetDAO;
import _9_51_battleset_model.BattleSetVO;
import _9_52_nbateam_model.NBATeamVO;

public class BattleSetService
{
	private NBATeamService nbaSvc; /* BattleSetBeans_Config 注入 */
	private BattleSetDAO bSetDAO; /* BattleSetBeans_Config 注入 */

	public BattleSetService()
	{

	}

	public BattleSetService(BattleSetDAO bSetDAO)
	{
		this.bSetDAO = bSetDAO;
	}

	public BattleSetService(BattleSetDAO bSetDAO, NBATeamService nbaSvc) /* BattleSetBeans_Config 注入 */
	{
		this.bSetDAO = bSetDAO;
		this.nbaSvc = nbaSvc;
	}

	public void setNbaSvc(NBATeamService nbaSvc) /* NBA_service */
	{
		this.nbaSvc = nbaSvc;
	}

	public void addBattleSet(BattleSetVO vo)
	{
		bSetDAO.insert(vo);
	}

	public void updateBattleSet(BattleSetVO vo)
	{
		bSetDAO.update(vo);
	}

	public void deleteBattleSet(Integer battleId)
	{
		bSetDAO.delete(battleId);
	}

	public BattleSetVO getOneBattleSet(Integer battleId)
	{
		return bSetDAO.findByPrimaryKey(battleId);
	}

	public List<BattleSetVO> getAllBattleSet()
	{
		List<BattleSetVO> list = bSetDAO.getAll();
		return list;
	}

	public List<BattleSetVO> getAllBattleSetByDate(String queryDate)
	{
		return bSetDAO.getSetsByDate(queryDate);
	}

	public Integer getCountByDate(String queryDate)
	{
		return bSetDAO.getBattleSetsCountByDate(queryDate);
	}

	//=========================================
	//============= 進階查詢 ==================
	//=========================================
	public Map<String, Object> getOneBattleSetById(Integer battleId) /* 回傳nbaTeamVO物件 */
	{
		BattleSetVO bSetVO = bSetDAO.findByPrimaryKey(battleId);

		NBATeamVO awayVO = nbaSvc.getByTeamId(bSetVO.getAwayId());
		NBATeamVO homeVO = nbaSvc.getByTeamId(bSetVO.getHomeId());

		Map<String, Object> myMap = new HashMap<String, Object>();

		myMap.put("home", homeVO);
		myMap.put("away", awayVO);
		myMap.put("battleTime", bSetVO.getBattleDateTime().toString().substring(0, 16));
		myMap.put("battleId", bSetVO.getBattleId());
		myMap.put("homeScore", bSetVO.getHomeScore().toString());
		myMap.put("awayScore", bSetVO.getAwayScore().toString());
		myMap.put("homebet", bSetVO.getHomebet().toString());
		myMap.put("awaybet", bSetVO.getAwaybet().toString());
		return myMap;
	}

	public List<Map<String, Object>> getLogoURLs(String queryDate)// -----modify:2016/08/12：增加對戰時間 Map<String, NBATeamVO> 改為 Map<String, Object>
	{
		List<BattleSetVO> list_BattleSet = bSetDAO.getAll();
		List<Map<String, Object>> retern_list = new ArrayList<>();// -----modify:2016/08/12：增加對戰時間 Map<String, NBATeamVO> 改為 Map<String, Object>

//		NBATeamService nbaSvc = new NBATeamService(); /* 原本 Local 變數自己new → 改Spring注入*/

		for (BattleSetVO vo : list_BattleSet)
		{
			String battleDate = vo.getBattleDateTime().toString().substring(0, 10);
			String battleTime = vo.getBattleDateTime().toString().substring(10, 16);

			if (queryDate.equals(battleDate))
			{
				int homeId = vo.getHomeId();
				NBATeamVO homeVO = nbaSvc.getByTeamId(homeId);

				int awayId = vo.getAwayId();
				NBATeamVO awayVO = nbaSvc.getByTeamId(awayId);

				Map<String, Object> myMap = new HashMap<>();// -----modify:2016/08/12：增加對戰時間 Map<String, NBATeamVO> 改為 Map<String, Object>
				myMap.put("home", homeVO);
				myMap.put("away", awayVO);
				myMap.put("battleTime", battleTime);

				retern_list.add(myMap);
			}

		}
		return retern_list;
	}

	public List<Map<String, Object>> getSetsByName(String teamName)// modify:2016/08/12：增加對戰時間
	{
		List<Map<String, Object>> retern_list = new ArrayList<>();// modify:2016/08/12：增加對戰時間
		//------------【根據輸入的teamName找到對應的teamID】------------------------

//		NBATeamService nbaSvc = new NBATeamService(); /* 原本 Local 變數自己new → 改Spring注入*/

		try
		{
			teamName = nbaSvc.getByTeamName(teamName).getTeamName();//根據輸入的隊名模糊查詢(Like)出正確隊名
		}
		catch (org.springframework.dao.EmptyResultDataAccessException e)
		{
			e.printStackTrace();
			return null;// 若輸入的teamName查不到，直接丟null
		}

		List<NBATeamVO> list1 = nbaSvc.getAllTeam();
		int teamId = -1;
		for (NBATeamVO nbaTeamVO : list1)
		{
			String tmp_name = nbaTeamVO.getTeamName();
			if (tmp_name.equals(teamName))
			{
				teamId = nbaTeamVO.getTeamID();
//				System.out.println("id = " + teamId + "    name=" + nbaTeamVO.getTeamName());
				break;
			}
		}
		if (teamId == -1)//若在DB中找不到對應的ID , return null;
		{
			return null;
		}
		//------------【根據找到的teamID查詢有此ID的對戰場次】---------
		List<BattleSetVO> list_battleSet = bSetDAO.getSetsById(teamId);
		for (BattleSetVO vo : list_battleSet)
		{

			//----由此場次的 homeId、awayID 找到teamVO
			NBATeamVO homeVO = nbaSvc.getByTeamId(vo.getHomeId());
			NBATeamVO awayVO = nbaSvc.getByTeamId(vo.getAwayId());

			Map<String, Object> myMap = new HashMap<>();// modify:2016/08/12：增加對戰時間 ， 將 Map<String, NBATeamVO> 改為 Map<String, Object>
			myMap.put("home", homeVO);
			myMap.put("away", awayVO);
			myMap.put("battleTime", vo.getBattleDateTime().toString().substring(0, 16));

			myMap.put("battleId", vo.getBattleId());
			myMap.put("homeScore", vo.getHomeScore().toString());
			myMap.put("awayScore", vo.getAwayScore().toString());
			myMap.put("homebet", vo.getHomebet().toString());
			myMap.put("awaybet", vo.getAwaybet().toString());

			retern_list.add(myMap);
		}
		return retern_list;
	}

	public List<Map<String, Object>> getSetsByDate(String queryDate)// modify:2016/08/12 增加對戰時間
	{
		List<Map<String, Object>> return_list = new ArrayList<>();// modify:2016/08/12 增加對戰時間
		List<BattleSetVO> list = bSetDAO.getSetsByDate(queryDate);

		//NBATeamService nbaSvc = new NBATeamService(); /* 原本 Local 變數自己new → 改Spring注入*/

		for (BattleSetVO vo : list)
		{
//			System.out.println(vo.getHomeId() + " vs " + vo.getAwayId());
//			System.out.println(vo.getBattleDateTime().toString().substring(11, 16));

			String battleTime = vo.getBattleDateTime().toString().substring(11, 16);// modify:2016/08/12 增加對戰時間
			NBATeamVO home = nbaSvc.getByTeamId(vo.getHomeId());
			NBATeamVO away = nbaSvc.getByTeamId(vo.getAwayId());

			Map<String, Object> myMap = new HashMap<>();// modify:2016/08/12 增加對戰時間

			myMap.put("home", home);
			myMap.put("away", away);
			myMap.put("battleTime", battleTime);

			myMap.put("battleId", vo.getBattleId());
			myMap.put("homeScore", vo.getHomeScore().toString());
			myMap.put("awayScore", vo.getAwayScore().toString());
			myMap.put("homebet", vo.getHomebet().toString());
			myMap.put("awaybet", vo.getAwaybet().toString());

			return_list.add(myMap);
		}

		return return_list;
	}

	public List<Map<String, Object>> getSetsByDateAndPage(String queryDate, Integer pageNo)
	{
		List<Map<String, Object>> return_list = new ArrayList<>();// modify:2016/08/12 增加對戰時間
		List<BattleSetVO> list = bSetDAO.getSetsByDateAndPage(queryDate, pageNo);

		//NBATeamService nbaSvc = new NBATeamService(); /* 原本 Local 變數自己new → 改Spring注入*/

		for (BattleSetVO vo : list)
		{
//			System.out.println(vo.getHomeId() + " vs " + vo.getAwayId());
//			System.out.println(vo.getBattleDateTime().toString().substring(11, 16));

			String battleTime = vo.getBattleDateTime().toString().substring(11, 16);// modify:2016/08/12 增加對戰時間
			NBATeamVO home = nbaSvc.getByTeamId(vo.getHomeId());
			NBATeamVO away = nbaSvc.getByTeamId(vo.getAwayId());

			Map<String, Object> myMap = new HashMap<>();// modify:2016/08/12 增加對戰時間
			myMap.put("home", home);
			myMap.put("away", away);
			myMap.put("battleTime", battleTime);

			myMap.put("battleId", vo.getBattleId());
			myMap.put("homeScore", vo.getHomeScore().toString());
			myMap.put("awayScore", vo.getAwayScore().toString());
			myMap.put("homebet", vo.getHomebet().toString());
			myMap.put("awaybet", vo.getAwaybet().toString());

			return_list.add(myMap);
		}

		return return_list;
	}

	public List<Map<String, Object>> getSetsByNameAndPage(String teamName, Integer pageNo)
	{
		List<Map<String, Object>> return_list = new ArrayList<>();

		Integer teamId = nbaSvc.getByTeamName(teamName).getTeamID(); // 由隊名查詢到對應的teamId

		List<BattleSetVO> list = bSetDAO.getSetsByIdAndPage(teamId, pageNo);

		//NBATeamService nbaSvc = new NBATeamService(); /* 原本 Local 變數自己new → 改Spring注入*/

		for (BattleSetVO vo : list)
		{
//			System.out.println(vo.getHomeId() + " vs " + vo.getAwayId());
//			System.out.println(vo.getBattleDateTime().toString().substring(11, 16));

//			String battleTime = vo.getBattleDateTime().toString().substring(11, 16);// modify:2016/08/12 增加對戰時間
			String battleTime = vo.getBattleDateTime().toString().substring(0, 16);// modify:2016/08/12 增加對戰時間
			NBATeamVO home = nbaSvc.getByTeamId(vo.getHomeId());
			NBATeamVO away = nbaSvc.getByTeamId(vo.getAwayId());

			Map<String, Object> myMap = new HashMap<>();// modify:2016/08/12 增加對戰時間
			myMap.put("home", home);
			myMap.put("away", away);
			myMap.put("battleTime", battleTime);

			myMap.put("battleId", vo.getBattleId());
			myMap.put("homeScore", vo.getHomeScore().toString());
			myMap.put("awayScore", vo.getAwayScore().toString());
			myMap.put("homebet", vo.getHomebet().toString());
			myMap.put("awaybet", vo.getAwaybet().toString());

			return_list.add(myMap);
		}

		return return_list;
	}

	public static void main(String[] args)
	{
		AbstractApplicationContext context = new AnnotationConfigApplicationContext("_51_battleset_service");
		BattleSetService svc = (BattleSetService) context.getBean("bSetService");
//=====================【【測試】依日期查詢每日比賽場數=====================【
//		Integer num = svc.getCountByDate("2016-09-09");
//		System.out.println("比賽場數：" + num);
//=====================【getOneBattleSetById】===========================
//		Map<String, Object> bSetVO = svc.getOneBattleSetById(314);
//		System.out.println(((NBATeamVO) bSetVO.get("away")).getTeamName());
// ====================【getSetsByNameAndPage】==========================
//		List<Map<String, Object>> list = svc.getSetsByNameAndPage("湖人", 1);
//		for (Map<String, Object> map : list)
//		{
//			String temp = String.format("%3s %5s %15s %15s %13s %10s %10s %10s %10s",
//					((NBATeamVO) map.get("home")).getTeamID(), ((NBATeamVO) map.get("away")).getTeamID(),
//					((NBATeamVO) map.get("home")).getTeamName(), ((NBATeamVO) map.get("away")).getTeamName(),
//					((String) map.get("battleTime")),
//					((String) map.get("homeScore")),
//					((String) map.get("awayScore")),
//					((String) map.get("homebet")),
//					((String) map.get("awaybet")));
//			System.out.println("battleId : " + map.get("battleId") + "  " + temp);
//		}
// ====================【getSetsByDate】==========================
//		BattleSetService svc = new BattleSetService();
//		List<Map<String, Object>> list = svc.getSetsByDate("2016-09-07");
//		for (Map<String, Object> map : list)
//		{
//			String temp = String.format("%3s %5s %15s %15s %13s %10s %10s %10s %10s",
//					((NBATeamVO) map.get("home")).getTeamID(), ((NBATeamVO) map.get("away")).getTeamID(),
//					((NBATeamVO) map.get("home")).getTeamName(), ((NBATeamVO) map.get("away")).getTeamName(),
//					((String) map.get("battleTime")),
//					((String) map.get("homeScore")),
//					((String) map.get("awayScore")),
//					((String) map.get("homebet")),
//					((String) map.get("awaybet")));
//			System.out.println("battleId : " + map.get("battleId") + "  " + temp);
//		}
//====================【getSetsByDateAndPage】根據日期及分頁編號查詢==========================
//		List<Map<String, Object>> list = svc.getSetsByDateAndPage("2016-09-08", 1);
//		System.out.println(list);
//		for (Map<String, Object> map : list)
//		{
//			String temp = String.format("%3s %5s %15s %15s %13s %10s %10s %10s %10s",
//					((NBATeamVO) map.get("home")).getTeamID(), ((NBATeamVO) map.get("away")).getTeamID(),
//					((NBATeamVO) map.get("home")).getTeamName(), ((NBATeamVO) map.get("away")).getTeamName(),
//					((String) map.get("battleTime")),
//					((String) map.get("homeScore")),
//					((String) map.get("awayScore")),
//					((String) map.get("homebet")),
//					((String) map.get("awaybet")));
//			System.out.println("battleId : " + map.get("battleId") + "  " + temp);
//		}
//====================【getLogoURLs】==========================
//		BattleSetService svc = new BattleSetService();
//		List<Map<String, Object>> list = svc.getLogoURLs("2016-09-02");
//		for (Map<String, Object> map : list)
//		{
//			System.out.println(((NBATeamVO) map.get("home")).getTeamName() +
//					"     " + ((NBATeamVO) map.get("away")).getTeamName() +
//					"     " + map.get("battleTime"));
//		}
		//-------------依隊名查詢【getSetsByName】(加入 對戰時間)--------------
//		BattleSetService svc = new BattleSetService();
//		List<Map<String, Object>> list = svc.getSetsByName("小牛");
//		System.out.println(list);
//		System.out.println("總筆數 : " + list.size());
//		for (Map<String, Object> map : list)
//		{
//			String temp = String.format("%3s %5s %15s %15s %13s %20s %20s %10s %10s",
//					((NBATeamVO) map.get("home")).getTeamID(), ((NBATeamVO) map.get("away")).getTeamID(),
//					((NBATeamVO) map.get("home")).getTeamName(), ((NBATeamVO) map.get("away")).getTeamName(),
//					((String) map.get("battleTime")),
//					((String) map.get("homeScore")),
//					((String) map.get("awayScore")),
//					((String) map.get("homebet")),
//					((String) map.get("awaybet")));
//			System.out.println("battleId : " + map.get("battleId") + "  " + temp);
//		}
		//-------------依日期查詢--------------
//		BattleSetService svc = new BattleSetService();
//		List<Map<String, Object>> ans = svc.getSetsByDate("2015-11-06");
//		for (Map<String, Object> map : ans)
//		{
//			String home = ((NBATeamVO) map.get("home")).getTeamName();
//			String away = ((NBATeamVO) map.get("away")).getTeamName();
//
//			System.out.println(home + " ---vs--- " + away);
//		}
		//-------------結束==依日期查詢==結束--------------
//		BattleSetService svc = new BattleSetService();
//		List<Map<String, Object>> list = svc.getSetsByName("達拉斯小牛");
//		for (Map<String, Object> map : list)
//		{
//			System.out.println(((NBATeamVO) map.get("home")).getTeamName() + "   vs   " + ((NBATeamVO) map.get("away")).getTeamName());
//		}

//////////////
//		List<Map<String, Object>> list = svc.getLogoURLs("2016-09-02");
//		for (Map<String, Object> map : list)
//		{
//			System.out.println(map.get("home").getTeamLogoURL() + "      " + map.get("away").getTeamLogoURL());
//
//		}
///////////////【測試】新增/////////////////////
//		BattleSetVO vo = new BattleSetVO();
//		vo.setBattleDateTime(java.sql.Timestamp.valueOf("2016-04-27 08:05:33"));
//		vo.setHomeId(5);
//		vo.setAwayId(7);
//		vo.setHomeScore(77);
//		vo.setAwayScore(80);
//		vo.setHomebet(9000.0);
//		vo.setAwaybet(9500.0);
//		svc.addBattleSet(vo);

///////////////【測試】更新 /////////////////////
//		BattleSetVO vo = new BattleSetVO();
//		vo.setBattleId(1); /* 主鍵 */
//		vo.setBattleDateTime(java.sql.Timestamp.valueOf("2016-04-27 08:05:33"));
//		vo.setHomeId(5);
//		vo.setAwayId(7);
//		vo.setHomeScore(77);
//		vo.setAwayScore(80);
//		vo.setHomebet(9000.0);
//		vo.setAwaybet(9500.0);
//		svc.updateBattleSet(vo);

///////////////【測試】刪除 /////////////////////
//		svc.deleteBattleSet(314);

//		BattleSetVO vo2 = svc.getOneBattleSet(4);
//		System.out.println(vo2.getHomeId() + "  " + vo2.getAwayId());

///////////////【測試】查全部 /////////////////////
//		NBATeamService NBAsvc = (NBATeamService) context.getBean("nbaTeamService");/* 用Spring, BattleSetBeans_Config 要 @Import({ RootConfig.class, NbaTeamBeans_Config.class }) */
////		NBATeamService NBAsvc = new NBATeamService();
//		List<BattleSetVO> list = svc.getAllBattleSet();
//		int num = 1;
//		for (BattleSetVO vvo : list)
//		{
//			System.out.println("編號:" + (num++) + "   " + vvo.getHomeId() + "   " + vvo.getAwayId());
////			NBATeamVO nbavo = NBAsvc.getByTeamId(vvo.getHomeId());
////			System.out.println(nbavo.getTeamLogoURL());
//		}
	}

}
