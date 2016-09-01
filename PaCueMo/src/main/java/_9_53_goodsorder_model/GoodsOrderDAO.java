package _9_53_goodsorder_model;

import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;

public class GoodsOrderDAO implements GoodsOrderDAO_interface
{
//	String driver = GlobalService.DRIVER_NAME;
//	String url = GlobalService.DB_URL;
//	String userid = GlobalService.USERID;
//	String passwd = GlobalService.PASSWORD;

	private JdbcTemplate jdbcTemplate;

	public GoodsOrderDAO()
	{

	}

	public GoodsOrderDAO(JdbcTemplate jdbcTemplate)
	{
		this.jdbcTemplate = jdbcTemplate;
	}

	//========================================
	private static final String INSERT_STMT = "INSERT INTO GoodsOrder ( memberId , cardNum , fullName , expire ,cvc , ntdQty , coinQty , orderDateTime , isPay)"
			+ "                                  VALUES   ( ? , ? , ? , ? , ? , ? , ? , ? , ?)";
	private static final String QUERY_ALL_STMT = "SELECT orderId , memberId , cardNum , fullName , expire ,cvc , ntdQty , coinQty , orderDateTime , isPay FROM GoodsOrder";

	private static final String DELETE_STMT = "DELETE FROM dbo.GoodsOrder WHERE orderId = ?";

	//========================================
	public static void main(String[] args)
	{
		//============= 【測試】【信用卡號加密測試】 ===================
//		String card = "4023 1154 3578 9424";
//		String str0 = GlobalService.getMD5Endocing(card);
//		System.out.println("MD5  " + str0 + "   " + str0.length());
//		String str1 = GlobalService.encryptString(card);
//		System.out.println(str1 + "   " + str1.length());
//		String str2 = GlobalService.decryptString(GlobalService.KEY, str1);
//		System.out.println(str2);
		//=============【Spring】===========================
//		AbstractApplicationContext context = new AnnotationConfigApplicationContext(GoodsOrderBeans_Config.class);
//		GoodsOrderDAO dao = (GoodsOrderDAO) context.getBean("goodsOrderDAO");
		//=========== 【測試】 insert test =============
//		GoodsOrderVO myvo = new GoodsOrderVO();
//		myvo.setMemberId(120);
//		myvo.setCardNum(GlobalService.encryptString("4023 0555 7897 3546"));
//		myvo.setFullName("火雲邪神");
//		myvo.setExpire("07/2018");
//		myvo.setCvc(353);
//		myvo.setNtdQty(500);
//		myvo.setCoinQty(5000);
//		myvo.setOrderDateTime(java.sql.Timestamp.valueOf("2016-08-14 17:18:04"));
//		myvo.setIsPay(true);
//
//		GoodsOrderDAO dao = new GoodsOrderDAO();
//		dao.insert(myvo);
		//============ end of insert test ========
		//===========【測試】 getAll test =============
//		GoodsOrderDAO dao = new GoodsOrderDAO();
//		List<GoodsOrderVO> list = dao.getAll();
//		for (GoodsOrderVO vvo : list)
//		{
//			System.out.println(vvo.getFullName() + "   " + vvo.getCardNum());
//		}
		//=========== end of getAll test =============
	}

	@Override
	public int insert(GoodsOrderVO vo)
	{
		//INSERT INTO GoodsOrder ( memberId , cardNum , fullName , expire ,cvc , ntdQty , coinQty , orderDateTime , isPay)"
		return jdbcTemplate.update(INSERT_STMT,
				vo.getMemberId(), vo.getCardNum(), vo.getFullName(), vo.getExpire(), vo.getCvc(),
				vo.getNtdQty(), vo.getCoinQty(), vo.getOrderDateTime(), vo.getIsPay());
//		try
//		{
//			Class.forName(driver);
//		}
//		catch (ClassNotFoundException ex)
//		{
//			throw new RuntimeException("Couldn't load database driver. " + ex.getMessage());
//		}
//
//		try (Connection conn = DriverManager.getConnection(url, userid, passwd);
//				PreparedStatement pStmt = conn.prepareStatement(INSERT_STMT);)
//		{
//			pStmt.setInt(1, vo.getMemberId());
//			pStmt.setString(2, vo.getCardNum());
//			pStmt.setString(3, vo.getFullName());
//			pStmt.setString(4, vo.getExpire());
//			pStmt.setInt(5, vo.getCvc());
//			pStmt.setInt(6, vo.getNtdQty());
//			pStmt.setInt(7, vo.getCoinQty());
//			pStmt.setTimestamp(8, vo.getOrderDateTime());
//			pStmt.setBoolean(9, vo.getIsPay());
//
//			int num = pStmt.executeUpdate();
//			System.out.println("=== 新增 GoodOrder " + num + " 筆 ===");
//		}
//		catch (SQLException se)
//		{
//			//se.printStackTrace();
//			throw new RuntimeException("A database error occured. " + se.getMessage());
//		}

	}

	@Override
	public int update(GoodsOrderVO vo)
	{
		return 0;
		// TODO Auto-generated method stub

	}

	@Override
	public int delete(Integer orderId)
	{
		int num = jdbcTemplate.update(DELETE_STMT, orderId);
		System.out.println(" ============ 刪除 GoodsOrderVO " + num + " 筆資料 ============ ");
		return num;
	}

	@Override
	public GoodsOrderVO findByPrimaryKey(Integer orderId)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<GoodsOrderVO> getAll()
	{
		return jdbcTemplate.query(QUERY_ALL_STMT, new GoodsOrderRowMapper());
//		List<GoodsOrderVO> list = new ArrayList<>();
//		ResultSet rs = null;
//		try
//		{
//			Class.forName(driver);
//		}
//		catch (ClassNotFoundException ex)
//		{
//			throw new RuntimeException("Couldn't load database driver. " + ex.getMessage());
//		}
//
//		try (Connection conn = DriverManager.getConnection(url, userid, passwd);
//				PreparedStatement pStmt = conn.prepareStatement(QUERY_ALL_STMT);)
//		{
//			rs = pStmt.executeQuery();
//
//			while (rs.next())
//			{
//				GoodsOrderVO vo = new GoodsOrderVO();
//				vo.setOrderId(rs.getInt("orderId"));
//				vo.setMemberId(rs.getInt("memberId"));
//				vo.setCardNum(rs.getString("cardNum"));
//				vo.setFullName(rs.getString("fullName"));
//				vo.setExpire(rs.getString("expire"));
//				vo.setCvc(rs.getInt("cvc"));
//				vo.setNtdQty(rs.getInt("ntdQty"));
//				vo.setCoinQty(rs.getInt("coinQty"));
//				vo.setOrderDateTime(rs.getTimestamp("orderDateTime"));
//				vo.setIsPay(rs.getBoolean("isPay"));
//				list.add(vo);
//			}
//
//			System.out.println("=== 查詢 GoodOrder : getAll() 成功 ===");
//		}
//		catch (SQLException se)
//		{
//			throw new RuntimeException("A database error occured. " + se.getMessage());
//		}
//		return list;
	}

}
