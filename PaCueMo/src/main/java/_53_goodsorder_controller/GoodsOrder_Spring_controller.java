package _53_goodsorder_controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/goodsOrder")
public class GoodsOrder_Spring_controller
{
//	@Autowired
//	private GoodsOrderService goodsService;

	@RequestMapping(value = "/allGoodsOrders", method = RequestMethod.GET)
	public String getAllgoodsOrder(HttpServletRequest request, HttpServletResponse response)
	{
//		List<GoodsOrderVO> list = goodsSVC.getAllGoodsOrder();
//		for (GoodsOrderVO vo : list)
//		{
//			System.out.println(String.format("%10s %20s %20s %10s",
//					vo.getOrderId(), vo.getMemberId(), vo.getCardNum(), vo.getFullName()));
//		}

		System.out.println(" ||||||||||||||||||| call getAllgoodsOrder() ||||||||||||||||||| ");
//		request.setAttribute("allGoodsOrder", list);

		return "bk_goodsorder/_goodsOrder_manager";
	}
}
