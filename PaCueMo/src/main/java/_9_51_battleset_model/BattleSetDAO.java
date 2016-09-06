package _9_51_battleset_model;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;

public class BattleSetDAO implements BattleSetDAO_interface
{
//	String driver = GlobalService.DRIVER_NAME;
//	String url = GlobalService.DB_URL;
//	String userid = GlobalService.USERID;
//	String passwd = GlobalService.PASSWORD;
	///////
	private JdbcTemplate jdbcTemplate;

	public BattleSetDAO()
	{
	}

	public BattleSetDAO(JdbcTemplate jdbcTemplate)
	{
		this.jdbcTemplate = jdbcTemplate;
	}

	//========================================
	private static final String QUERY_ALL_STMT = "SELECT battleId , battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet FROM BattleSet;";
	private static final String QUERY_ONE_STMT = "SELECT battleId , battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet "
			+ "                                     FROM BattleSet WHERE battleId = ?";
	private static final String INSERT_STMT = "INSERT INTO BattleSet ( battleDateTime, homeId, awayId, homeScore, awayScore, homebet, awaybet )" +
			"                                    VALUES ( ? , ? , ? , ? , ? , ? ,? )";
	private static final String DELETE_STMT = "DELETE FROM BattleSet WHERE battleId = ?";
	private static final String UPDATE_STMT = "UPDATE BattleSet SET battleDateTime= ? ,homeId= ?,awayId= ?,homeScore= ?,awayScore= ?,homebet= ?,awaybet= ?" +
			"                                    WHERE battleId= ?";
	private static final String QUERY_BY_TEAMNAME_STMT = "SELECT battleId , battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet FROM BattleSet"
			+ "                                             JOIN NBATeam "
			+ "                                             ON NBATeam.teamId = BattleSet.homeId"
			+ "                                             WHERE homeId = ? OR awayId = ? "
			+ "                                             ORDER BY battleDateTime DESC";
	private static final String QUERY_BY_DATE_STMT = "SELECT battleId , battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet "
			+ "                                          FROM BattleSet "
			+ "                                          WHERE battleDateTime BETWEEN   ?   AND   ?   ORDER BY battleDateTime DESC";
	private static final String QUERY_BY_DATE_PAGE_STMT = ""
			+ "SELECT battleId , battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet FROM "
			+ " 		(SELECT ROW_NUMBER() OVER (ORDER BY battleDateTime DESC) AS RowNum , "
			+ "				battleId , battleDateTime , homeId , awayId ,homeScore ,"
			+ "				awayScore , homebet , awaybet FROM BattleSet WHERE battleDateTime BETWEEN  ?  AND  ?  ) as tmp "
			+ " WHERE tmp.RowNum  BETWEEN   ?   AND   ?  ";
	private static final String QUERY_BY_NAME_PAGE_STMT = "SELECT battleId , battleDateTime , homeId , awayId , homeScore ,awayScore , homebet , awaybet  "
			+ "FROM (SELECT ROW_NUMBER() OVER (ORDER BY battleDateTime DESC) AS RowNum"
			+ ", battleId , battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet "
			+ "FROM BattleSet WHERE homeId = ? OR awayId = ?) AS tmp "
			+ "WHERE tmp.RowNum  BETWEEN   ?   AND   ?  ";

	//========================================
	@Override
	public void insert(BattleSetVO vo)
	{
		jdbcTemplate.update(INSERT_STMT, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement ps) throws SQLException
			{
				ps.setTimestamp(1, vo.getBattleDateTime());
				ps.setInt(2, vo.getHomeId());
				ps.setInt(3, vo.getAwayId());
				ps.setInt(4, vo.getHomeScore());
				ps.setInt(5, vo.getAwayScore());
				ps.setDouble(6, vo.getHomebet());
				ps.setDouble(7, vo.getAwaybet());
			}

		});
		System.out.println(" ========== BattleSet ---> 資料【新增】成功 ========== ");
	}

	@Override
	public int delete(Integer battleId)
	{
		int num = jdbcTemplate.update(DELETE_STMT, battleId);
		System.out.println(" ========= 刪除 BattleSet " + num + " 筆資料 =========");
		return num;
	}

	@Override
	public int update(BattleSetVO vo)
	{
		int num = jdbcTemplate.update(UPDATE_STMT,
				vo.getBattleDateTime(),
				vo.getHomeId(),
				vo.getAwayId(),
				vo.getHomeScore(),
				vo.getAwayScore(),
				vo.getHomebet(),
				vo.getAwaybet(),
				vo.getBattleId() /* Primary Key */);

		System.out.println(" ========= 更新 BattleSet " + num + " 筆資料 =========");
		return num;
	}

	@Override
	public BattleSetVO findByPrimaryKey(Integer battleId)
	{
		return jdbcTemplate.queryForObject(QUERY_ONE_STMT, new BattleSetRowMapper(), battleId);
	}

	@Override
	public List<BattleSetVO> getAll()
	{
		return jdbcTemplate.query(QUERY_ALL_STMT, new BattleSetRowMapper());
	}

	@Override
	public List<BattleSetVO> getSetsById(Integer battleId)
	{
		return jdbcTemplate.query(QUERY_BY_TEAMNAME_STMT, new BattleSetRowMapper(), battleId, battleId);
	}

	@Override
	public List<BattleSetVO> getSetsByDate(String queryDate)
	{
		Calendar calendar = Calendar.getInstance();
		String[] qDate = queryDate.split("-");
		Integer yyyy = Integer.valueOf(qDate[0]);
		Integer mm = Integer.valueOf(qDate[1]);
		Integer dd = Integer.valueOf(qDate[2]);

		/**
		 * Calendar.YEAR 代表加減年
		 * Calendar.MONTH 代表加減月份
		 * Calendar.DATE 代表加減天數
		 * Calendar.HOUR 代表加減小時數
		 * Calendar.MINUTE 代表加減分鐘數
		 * Calendar.SECOND 代表加減秒數
		 */
		calendar.set(yyyy, mm - 1, dd);//設定時間為輸入的QueryDate (※ 注意: Calendar 月份 -1)
		calendar.add(Calendar.DATE, 1);
		//----------------------------------
		String date1 = queryDate;
		String date2 = (new Date(calendar.getTimeInMillis())).toString();
//		System.out.println("date1 : ---" + date1);
//		System.out.println("date2 : ---" + date2);
		//----------------------------------
		return jdbcTemplate.query(QUERY_BY_DATE_STMT, new BattleSetRowMapper(), date1, date2);
	}

	@Override
	public List<BattleSetVO> getSetsByDateAndPage(String queryDate, Integer pageNo)
	{
		Calendar calendar = Calendar.getInstance();
		String[] qDate = queryDate.split("-");
		Integer yyyy = Integer.valueOf(qDate[0]);
		Integer mm = Integer.valueOf(qDate[1]);
		Integer dd = Integer.valueOf(qDate[2]);
		/*
		 * Calendar.YEAR 代表加減年
		 * Calendar.MONTH 代表加減月份
		 * Calendar.DATE 代表加減天數
		 * Calendar.HOUR 代表加減小時數
		 * Calendar.MINUTE 代表加減分鐘數
		 * Calendar.SECOND 代表加減秒數
		 */
		calendar.set(yyyy, mm - 1, dd);//設定時間為輸入的QueryDate (※ 注意: Calendar 月份 -1)
		calendar.add(Calendar.DATE, 1);
		//----------------------------------
		String date1 = queryDate;
		String date2 = (new Date(calendar.getTimeInMillis())).toString();
//		System.out.println("date1 : ---" + date1);
//		System.out.println("date2 : ---" + date2);
		//----------------------------------
		//------------------【頁碼】---------------------------
		int recordsPerPage = 3;
		int startProductNo = (pageNo - 1) * recordsPerPage + 1;
		int endProductNo = pageNo * recordsPerPage;
		return jdbcTemplate.query(QUERY_BY_DATE_PAGE_STMT, new BattleSetRowMapper(), date1, date2, startProductNo, endProductNo);
	}

	@Override
	public List<BattleSetVO> getSetsByIdAndPage(Integer teamId, Integer pageNo)
	{
		//------------------【頁碼】---------------------------
		int recordsPerPage = 5;
		int startProductNo = (pageNo - 1) * recordsPerPage + 1;
		int endProductNo = pageNo * recordsPerPage;
		return jdbcTemplate.query(QUERY_BY_NAME_PAGE_STMT, new BattleSetRowMapper(), teamId, teamId, startProductNo, endProductNo);
	}

	public static void main(String[] args)
	{
		//-------- 測試 Calendar ----------
//		Calendar calendar = Calendar.getInstance();
//
//		calendar.set(2016, 7, 6);//設定時間為輸入的QueryDate
//		calendar.add(Calendar.DATE, 1);
//		String date2 = (new Date(calendar.getTimeInMillis())).toString();
//
//		System.out.println(date2);
		//------------------------------------------------------------------
//【【【【【【【【【【【【【【【 Spring 】】】】】】】】】】】】】】】】】】】】
//		ApplicationContext context = new AnnotationConfigApplicationContext(BattleSetBeans_Config.class);
//		BattleSetDAO dao = (BattleSetDAO) context.getBean("bSetDAO");

//		----------【teamId】依日期 及 【頁碼】 查詢----------------

//		List<BattleSetVO> list = dao.getSetsByIdAndPage(1, 1);
//		for (BattleSetVO vo : list)
//		{
//			System.out.println(vo.getBattleDateTime());
//		}
//		----------【測試】依日期 及 【頁碼】 查詢----------------
//		List<BattleSetVO> list = dao.getSetsByDateAndPage("2016-09-06", 1);
//		for (BattleSetVO vo : list)
//		{
//			System.out.println(vo.getHomeId() + "   " + vo.getAwayId());
//		}
//		----------【測試】依日期查詢----------------
//		BattleSetDAO dao = new BattleSetDAO();
//		List<BattleSetVO> mylist = dao.getSetsByDate("2016-09-06");
//		for (BattleSetVO vo : mylist)
//		{
//			System.out.println(vo.getBattleId() + "  " + vo.getHomeId() + " vs " + vo.getAwayId());
//		}

		//----------【測試】 依球隊ID (battleId) 查詢----------------
//		BattleSetDAO dao = new BattleSetDAO();
//		List<BattleSetVO> mylist = dao.getSetsById(7);
//		for (BattleSetVO vo : mylist)
//		{
//			System.out.println(vo.getBattleId() + "  " + vo.getHomeId() + " vs " + vo.getAwayId());
//		}
		//----------end依隊名查詢----------------

//		BattleSetDAO dao = new BattleSetDAO();
//		List<BattleSetVO> list = dao.getAll();
//		for (BattleSetVO vo : list)
//		{
//			System.out.println(vo.getBattleDateTime() + "    " + vo.getHomeScore() + " __  " + vo.getAwayScore());
//		}
		//-----------【測試】 依pk查詢 ---------------
//		BattleSetDAO dao = new BattleSetDAO();
//		System.out.println(dao.findByPrimaryKey(3).getBattleDateTime());

		//=====【測試】 begin 新增 資料 ======
//		BattleSetDAO dao = new BattleSetDAO();
//		BattleSetVO vo = new BattleSetVO();
//		vo.setBattleDateTime(java.sql.Timestamp.valueOf("2016-04-27 08:05:33"));
//		vo.setHomeId(5);
//		vo.setAwayId(7);
//		vo.setHomeScore(77);
//		vo.setAwayScore(80);
//		vo.setHomebet(9000.0);
//		vo.setAwaybet(9500.0);
//		dao.insert(vo);
		//===== end of 新增 資料 ======

//		BattleSetDAO dao = new BattleSetDAO();
//		dao.delete(316); //----------------------------------- 【測試】刪除資料
//		List<BattleSetVO> list = dao.getAll();
//		for (BattleSetVO vv : list)
//		{
//			System.out.println(vv.getBattleId() + "   " + vv.getBattleDateTime());
//		}

//		BattleSetDAO dao = new BattleSetDAO();

		//=====【測試】 update 資料 ======
//		BattleSetVO vo = new BattleSetVO();
//		vo.setBattleId(1);
//		vo.setBattleDateTime(java.sql.Timestamp.valueOf("2000-12-01 01:05:08"));
//		vo.setHomeId(19);
//		vo.setAwayId(1);
//		vo.setHomeScore(98);
//		vo.setAwayScore(60);
//		vo.setHomebet(19000.0);
//		vo.setAwaybet(93500.0);
//		dao.update(vo);
//
//		List<BattleSetVO> list = dao.getAll();
//		for (BattleSetVO vv : list)
//		{
//			System.out.println(vv.getBattleId() + "      " + vv.getBattleDateTime());
//		}

	}

}
