package _53_goodsorder_service;

import java.util.List;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;

import _00_config.RootConfig;
import _9_53_goodsorder_model.GoodsOrderDAO;
import _9_53_goodsorder_model.GoodsOrderDAO_interface;
import _9_53_goodsorder_model.GoodsOrderVO;

public class GoodsOrderService
{

	private GoodsOrderDAO_interface goodsOrderDAO;/* GoodsOrderBeans_Config 注入 */

	public GoodsOrderService()
	{
		//goodsOrderDAO = new GoodsOrderDAO();
	}

	public GoodsOrderService(GoodsOrderDAO goodsOrderDAO)
	{
		this.goodsOrderDAO = goodsOrderDAO;
	}

	public void addGoodsOrder(GoodsOrderVO vo)
	{
		goodsOrderDAO.insert(vo);
	}

	public GoodsOrderVO getOneGoodsOrder(Integer orderId)
	{
		return goodsOrderDAO.findByPrimaryKey(orderId);
	}

	public List<GoodsOrderVO> getOrdersByMemberId(String membId)
	{
		return goodsOrderDAO.findByMemberId(membId);
	}

	public List<GoodsOrderVO> getAllGoodsOrder()
	{
		return goodsOrderDAO.getAll();
	}

	public int delete(Integer orderId)
	{
		return goodsOrderDAO.delete(orderId);
	}

	public int update(GoodsOrderVO vo)
	{
		return goodsOrderDAO.update(vo);
	}

	public static void main(String[] args)
	{
		///////////////////////////////////////
		/////////////【Spring】////////////////
		///////////////////////////////////////
		AbstractApplicationContext context = new AnnotationConfigApplicationContext(RootConfig.class);
		GoodsOrderService svc = (GoodsOrderService) context.getBean("goodsService");

		//===========【測試】insert test =============
//		GoodsOrderVO myvo = new GoodsOrderVO();
//		myvo.setMemberId("7DADF962-E537-4559-B2B7-0772EC1A8A4E");
//		myvo.setCardNum("6587 1111 8888 7777");
//		myvo.setFullName("哆啦A夢");
//		myvo.setExpireYY("2022");
//		myvo.setExpireMM("08");
//		myvo.setCvc("383");
//		myvo.setNtdQty(700);
//		myvo.setCoinQty(7000.0);
//		myvo.setOrderDateTime(java.sql.Timestamp.valueOf("2016-08-14 18:35:54"));
//		myvo.setIsPay(true);
//		svc.addGoodsOrder(myvo);
		//===========【測試】update test =============
//		GoodsOrderVO myvo = new GoodsOrderVO();
//		myvo.setOrderId(1);
//		myvo.setMemberId("19C013C9-ECB4-4D7A-B01E-36DA75FEC687");
//		myvo.setCardNum("4023 1154 3578 9424");
//		myvo.setFullName("火雲邪神");
//		myvo.setExpireYY("2017");
//		myvo.setExpireMM("08");
//		myvo.setCvc("338");
//		myvo.setNtdQty(50);
//		myvo.setCoinQty(500.0);
//		myvo.setOrderDateTime(java.sql.Timestamp.valueOf("2016-09-21 12:12:12"));
//		myvo.setIsPay(true);
//		svc.update(myvo);
		//===========【測試】delete test =============
//		svc.delete(2);
		//=========【測試】查一筆 getOneGoodsOrder ===================
//		GoodsOrderVO tmp = svc.getOneGoodsOrder(1);
//		System.out.println(tmp.getFullName() + "   " + tmp.getMemberId() + "   " + tmp.getCardNum());

		//=========== 【測試】 依會員id查詢 =============
//		List<GoodsOrderVO> list = svc.getOrdersByMemberId("7DADF962-E537-4559-B2B7-0772EC1A8A4E");
//		for (GoodsOrderVO vo : list)
//		{
//			System.out.println(vo.getFullName() + " 卡號解密: " + GlobalService.decryptString(GlobalService.KEY, vo.getCardNum()) + "   " +
//					vo.getExpireYY() + " 年 " + vo.getExpireMM() + "月   cvc " + vo.getCvc());
//		}

		//===========【測試】查多筆 getAllGoodsOrder test =============
//		List<GoodsOrderVO> list = svc.getAllGoodsOrder();
//		for (GoodsOrderVO vvo : list)
//		{
//			System.out.println(vvo.getFullName() + "   " + vvo.getCvc() + "   " + vvo.getMemberId() + "   "
//					+ vvo.getCardNum() + "   " + GlobalService.decryptString(GlobalService.KEY, vvo.getCardNum()));
//		}
	}

}
