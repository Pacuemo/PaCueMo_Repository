package _53_goodsorder_controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import _53_goodsorder_service.GoodsOrderService;
import _9_53_goodsorder_model.GoodsOrderVO;

@Controller
@RequestMapping("/goodsOrder")
public class GoodsOrder_Spring_controller
{
	@Autowired
	private GoodsOrderService goodsService;

	@RequestMapping(value = "/allGoodsOrders", method = RequestMethod.GET)
	public String getAllgoodsOrder(HttpServletRequest request, HttpServletResponse response)
	{
		System.out.println(" ----- 呼叫 GoodsOrder_Spring_controller -- getAllgoodsOrder() ----- ");
		List<GoodsOrderVO> list = goodsService.getAllGoodsOrder();
//		for (GoodsOrderVO vo : list)
//		{
//			System.out.println(String.format("%5s %30s %30s %10s",
//					vo.getOrderId(),
//					vo.getMemberId(),
//					vo.getCardNum(),
//					vo.getFullName()));
//		}
		request.setAttribute("allGoodsOrder", list);
		return "bk_goodsorder/_goodsOrder_manager";
	}

	//======================【刪除訂單】=======================
	@ResponseBody
	@RequestMapping(value = "/deleteOrder", method = RequestMethod.POST, produces = "text/plain; charset=utf-8")
	public String deleteGoodsOrderById(@RequestParam("orderId") Integer orderId)
	{
		try
		{
			goodsService.delete(orderId);
			return "del_success";
		}
		catch (RuntimeException ex)
		{
			System.out.println("----------- 刪除goodsOrder發生例外 ----------");
			ex.printStackTrace();
			return "del_fail";
		}
	}

	//======================【修改訂單】=======================
	@ResponseBody
	@RequestMapping(value = "/updateOrder", method = RequestMethod.POST, produces = "text/plain; charset=utf-8")
	public String updateGoodsOrderById(@RequestBody GoodsOrderVO gdVO)
	{
		System.out.println(" =========== 呼叫 updateGoodsOrderById() ===========");
//		System.out.println(
//				String.format("%3s %15s %15s %3s %3s %3s %3s %3s %3s %3s %3s",
//						gdVO.getOrderId(), gdVO.getMemberId(), gdVO.getCardNum(), gdVO.getFullName(), gdVO.getExpireMM(),
//						gdVO.getExpireYY(), gdVO.getCvc(), gdVO.getCoinQty(), gdVO.getNtdQty(), gdVO.getOrderDateTime(), gdVO.getIsPay()));
		goodsService.update(gdVO);
		return "update_success";
	}

}
