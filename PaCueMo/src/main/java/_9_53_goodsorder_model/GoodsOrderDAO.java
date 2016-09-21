package _9_53_goodsorder_model;

import java.util.List;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

import _00_config.RootConfig;
import _00_initial_service.GlobalService;

public class GoodsOrderDAO implements GoodsOrderDAO_interface
{
//	String driver = GlobalService.DRIVER_NAME;
//	String url = GlobalService.DB_URL;
//	String userid = GlobalService.USERID;
//	String passwd = GlobalService.PASSWORD;
	//========================================
	private static final String INSERT_STMT = "INSERT INTO GoodsOrder ( memberId , cardNum , fullName , expireYY , expireMM ,cvc , ntdQty , coinQty , orderDateTime , isPay)"
			+ "                                  VALUES   ( ? , ? , ? , ? , ? , ? , ? , ? , ? , ?)";
	private static final String GET_ALL_STMT = "SELECT orderId , memberId , cardNum , fullName , expireYY , expireMM ,cvc , ntdQty , coinQty , orderDateTime , isPay "
			+ "                                     FROM GoodsOrder ORDER BY orderDateTime DESC";

	private static final String DELETE_STMT = "DELETE FROM GoodsOrder WHERE orderId = ?";
	private static final String GET_ONE_STMT = "SELECT orderId , memberId , cardNum , fullName , expireYY , expireMM ,cvc , ntdQty , coinQty , orderDateTime , isPay "
			+ "                                   FROM GoodsOrder WHERE orderId = ?";
	private static final String GET_ALL_BY_MEMBID = "SELECT orderId,memberId,cardNum,fullName,expireYY,expireMM,cvc,ntdQty,coinQty,orderDateTime,isPay "
			+ "                                        FROM dbo.GoodsOrder WHERE memberId = ?";

	private static final String UPDATE_STMT = "UPDATE GoodsOrder"
			+ "                                    SET memberId = ?, cardNum= ? ,fullName= ? ,expireYY= ? ,expireMM=? , cvc=?, "
			+ "                                    ntdQty= ? , coinQty= ?, orderDateTime= ?, isPay= ? "
			+ "                                    WHERE orderId = ? ";
	//========================================
	private JdbcTemplate jdbcTemplate;

	public GoodsOrderDAO()
	{

	}

	public GoodsOrderDAO(JdbcTemplate jdbcTemplate)
	{
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public int insert(GoodsOrderVO vo)
	{
		//"INSERT INTO GoodsOrder ( memberId , cardNum , fullName , expireYY , expireMM ,cvc , ntdQty , coinQty , orderDateTime , isPay)"
		int num = jdbcTemplate.update(INSERT_STMT,
				vo.getMemberId(),
				GlobalService.encryptString(vo.getCardNum()),
				vo.getFullName(),
				vo.getExpireYY(),
				vo.getExpireMM(),
				vo.getCvc(),
				vo.getNtdQty(),
				vo.getCoinQty(),
				vo.getOrderDateTime(),
				vo.getIsPay());
		System.out.println(" ============= 新增GoodsOrder " + num + " 一筆成功 ================");
		return num;
	}

	@Override
	public int update(GoodsOrderVO vo)
	{
		int num = jdbcTemplate.update(UPDATE_STMT,
				vo.getMemberId(),
				vo.getCardNum(),
				vo.getFullName(),
				vo.getExpireYY(),
				vo.getExpireMM(),
				vo.getCvc(),
				vo.getNtdQty(),
				vo.getCoinQty(),
				vo.getOrderDateTime(),
				vo.getIsPay(),
				vo.getOrderId());
		System.out.println(" ============= 更新GoodsOrder " + num + " 一筆成功 ================");
		return num;
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
	public List<GoodsOrderVO> findByMemberId(String membId)
	{
		return jdbcTemplate.query(GET_ALL_BY_MEMBID, new GoodsOrderRowMapper(), membId);
	}

	@Override
	public List<GoodsOrderVO> getAll()
	{
		return jdbcTemplate.query(GET_ALL_STMT, new GoodsOrderRowMapper());
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
		AbstractApplicationContext context = new AnnotationConfigApplicationContext(RootConfig.class);
		GoodsOrderDAO dao = (GoodsOrderDAO) context.getBean("goodsOrderDAO");
		//=========== 【測試】 insert test =============
//		GoodsOrderVO myvo = new GoodsOrderVO();
//		myvo.setMemberId("7DADF962-E537-4559-B2B7-0772EC1A8A4E");
//		myvo.setCardNum("4023 1154 3578 9424");
//		myvo.setFullName("火雲邪神");
//		myvo.setExpireMM("08");
//		myvo.setExpireYY("2017");
//		myvo.setCvc("338");
//		myvo.setNtdQty(50);
//		myvo.setCoinQty(500.0);
//		myvo.setOrderDateTime(java.sql.Timestamp.valueOf("2016-08-14 17:18:04"));
//		myvo.setIsPay(true);
//		dao.insert(myvo);
		//============ end of insert test ========		
		//=========== 【測試】 更新 =============
//		GoodsOrderVO myvo = new GoodsOrderVO();
//		myvo.setOrderId(1);
//		myvo.setMemberId("782150D8-9957-4114-AD5F-52CE12A9995C");
//		myvo.setCardNum("4023 1154 3578 9424");
//		myvo.setFullName("火雲邪神");
//		myvo.setExpireYY("2017");
//		myvo.setExpireMM("08");
//		myvo.setCvc("338");
//		myvo.setNtdQty(50);
//		myvo.setCoinQty(500.0);
//		myvo.setOrderDateTime(java.sql.Timestamp.valueOf("2016-09-21 12:12:12"));
//		myvo.setIsPay(true);
//		dao.update(myvo);
		//=========== 【測試】 依會員id查詢 =============
//		List<GoodsOrderVO> list = dao.findByMemberId("7DADF962-E537-4559-B2B7-0772EC1A8A4E");
//		for (GoodsOrderVO vo : list)
//		{
//			System.out.println(vo.getFullName() + " 卡號解密: " + GlobalService.decryptString(GlobalService.KEY, vo.getCardNum()) + "   " +
//					vo.getExpireYY() + " 年 " + vo.getExpireMM() + "月   cvc " + vo.getCvc());
//		}
		//=========== 【測試】 查一筆 =============
//		GoodsOrderVO orderVO = dao.findByPrimaryKey(2);
//		System.out.println("卡號 : " + orderVO.getCardNum());
//		System.out.println("解密卡號 : " + GlobalService.decryptString(GlobalService.KEY, orderVO.getCardNum()));
		//===========【測試】 getAll test =============
//		GoodsOrderDAO dao = new GoodsOrderDAO();
//		List<GoodsOrderVO> list = dao.getAll();
//		for (GoodsOrderVO vvo : list)
//		{
//			System.out.println(vvo.getFullName() + "    " + " 下訂時間 : " + vvo.getOrderDateTime() + " ___ " + vvo.getCardNum() + " 卡號解密: " + GlobalService.decryptString(GlobalService.KEY, vvo.getCardNum()) + "   " +
//					vvo.getExpireYY() + " 年 " + vvo.getExpireMM() + "月   cvc " + vvo.getCvc() + "   " + vvo.getCoinQty());
//		}
		//=========== end of getAll test =============
	}
}
