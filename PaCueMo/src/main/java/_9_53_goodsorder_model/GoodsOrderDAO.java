package _9_53_goodsorder_model;

import java.util.List;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

import _53_goodsorder_service.GoodsOrderBeans_Config;

public class GoodsOrderDAO implements GoodsOrderDAO_interface
{
//	String driver = GlobalService.DRIVER_NAME;
//	String url = GlobalService.DB_URL;
//	String userid = GlobalService.USERID;
//	String passwd = GlobalService.PASSWORD;
	//========================================
	private static final String INSERT_STMT = "INSERT INTO GoodsOrder ( memberId , cardNum , fullName , expire ,cvc , ntdQty , coinQty , orderDateTime , isPay)"
			+ "                                  VALUES   ( ? , ? , ? , ? , ? , ? , ? , ? , ?)";
	private static final String QUERY_ALL_STMT = "SELECT orderId , memberId , cardNum , fullName , expire ,cvc , ntdQty , coinQty , orderDateTime , isPay "
			+ "                                     FROM GoodsOrder";

	private static final String DELETE_STMT = "DELETE FROM dbo.GoodsOrder WHERE orderId = ?";
	private static final String GET_ONE_STMT = "SELECT orderId , memberId , cardNum , fullName , expire ,cvc , ntdQty , coinQty , orderDateTime , isPay "
			+ "                                   FROM GoodsOrder WHERE orderId = ?";
	//========================================
	private JdbcTemplate jdbcTemplate;

	public GoodsOrderDAO()
	{

	}

	public GoodsOrderDAO(JdbcTemplate jdbcTemplate)
	{
		this.jdbcTemplate = jdbcTemplate;
	}

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
		//============================================================
		//=======================【Spring】===========================
		//============================================================
		AbstractApplicationContext context = new AnnotationConfigApplicationContext(GoodsOrderBeans_Config.class);
		GoodsOrderDAO dao = (GoodsOrderDAO) context.getBean("goodsOrderDAO");
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
		//=========== 【測試】 查一筆 =============
//		System.out.println(dao.findByPrimaryKey(2).getCardNum());
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
	}

	@Override
	public int update(GoodsOrderVO vo)
	{
		return 0;
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
		return jdbcTemplate.queryForObject(GET_ONE_STMT, new GoodsOrderRowMapper(), orderId);
	}

	@Override
	public List<GoodsOrderVO> getAll()
	{
		return jdbcTemplate.query(QUERY_ALL_STMT, new GoodsOrderRowMapper());
	}

}
