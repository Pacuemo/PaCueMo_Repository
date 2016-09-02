package _53_goodsorder_service;

import java.util.List;

import _9_53_goodsorder_model.GoodsOrderDAO;
import _9_53_goodsorder_model.GoodsOrderVO;

public class GoodsOrderService
{

	private GoodsOrderDAO goodsOrderDAO;/* GoodsOrderBeans_Config 注入 */

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

	public List<GoodsOrderVO> getAllGoodsOrder()
	{
		return goodsOrderDAO.getAll();
	}

	public int delete(Integer orderId)
	{
		return goodsOrderDAO.delete(orderId);
	}

	public static void main(String[] args)
	{
		///////////////////////////////////////
		/////////////【Spring】////////////////
		///////////////////////////////////////
//		AbstractApplicationContext context = new AnnotationConfigApplicationContext("_53_goodsorder_service");
//		GoodsOrderService svc = (GoodsOrderService) context.getBean("goodsService");

		//===========【測試】insert test =============
//		GoodsOrderVO myvo = new GoodsOrderVO();
//		myvo.setMemberId("6C50FF91-ACA3-4795-90E3-1BAB32B756A1");
//		myvo.setCardNum("6587 1111 8888 7777");
//		myvo.setFullName("哆啦A夢");
//		myvo.setExpire("01/2019");
//		myvo.setCvc(478);
//		myvo.setNtdQty(700);
//		myvo.setCoinQty(7000);
//		myvo.setOrderDateTime(java.sql.Timestamp.valueOf("2016-08-14 18:35:54"));
//		myvo.setIsPay(true);

//		GoodsOrderService svc = new GoodsOrderService();
//		svc.addGoodsOrder(myvo);
		//===========【測試】delete test =============
//		svc.delete(2);
		//=========【測試】查一筆 getOneGoodsOrder ===================
//		GoodsOrderVO tmp = svc.getOneGoodsOrder(1);
//		System.out.println(tmp.getFullName() + "   " + tmp.getMemberId() + "   " + tmp.getCardNum());

		//===========【測試】查多筆 getAllGoodsOrder test =============
//		GoodsOrderService svc = new GoodsOrderService();
////
//		List<GoodsOrderVO> list = svc.getAllGoodsOrder();
//		for (GoodsOrderVO vvo : list)
//		{
//			System.out.println(vvo.getFullName() + "   " + vvo.getMemberId() + "   " + vvo.getCardNum());
//		}
	}

}
