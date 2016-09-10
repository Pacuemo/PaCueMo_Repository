package _50_goodsorder_facade;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import _53_goodsorder_service.GoodsOrderService;
import _9_41_member_model.MemberDAO_interface_Spring;
import _9_41_member_model.MemberVO;
import _9_53_goodsorder_model.GoodsOrderVO;

public class GoodsOrderFacade
{
	private MemberDAO_interface_Spring memberDAO;
	private GoodsOrderService goodsSvc;

	public GoodsOrderFacade()
	{
	}

	public GoodsOrderFacade(MemberDAO_interface_Spring memberDAO, GoodsOrderService goodsSvc)
	{
		this.memberDAO = memberDAO;
		this.goodsSvc = goodsSvc;
	}

	// readOnly=true : 唯讀,不能更新,刪除
	// PROPAGATION_REQUIRED	 : 支援現在的交易，如果沒有的話就建立一個新的交易
	// PROPAGATION_MANDATORY : 方法必須在一個現存的交易中進行，否則丟出例外
	// @Transactional(rollbackFor=Exception.class) //指定回滾,需要捕獲的例外(throw new Exception(“");)不會回滾
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public String buyPoints(GoodsOrderVO gdVO, MemberVO mbVO, Double buyPoints)
	{
		goodsSvc.addGoodsOrder(gdVO); // 新增訂單紀錄
		Double points_origin = mbVO.getMemberPoint();
//		System.out.println("points_origin  :" + points_origin);
//		System.out.println("buyPoints   :" + buyPoints);
		mbVO.setMemberPoint(points_origin + buyPoints);
		memberDAO.updatePointByPrimaryKey(mbVO);
		return "success";
	}

	public static void main(String[] args)
	{
//		ApplicationContext context = new AnnotationConfigApplicationContext("_50_goodsorder_facade");
//		GoodsOrderFacade facadeService = (GoodsOrderFacade) context.getBean("goodsOrderFacade2");

//		GoodsOrderVO gdVO = new GoodsOrderVO();
//		gdVO.setOrderId(1);
//		gdVO.setCardNum("2054 8797 3567 1104");

//		tmp=facadeService.buyPoints(gdVO, mbVO, buyPoints);
	}
}
