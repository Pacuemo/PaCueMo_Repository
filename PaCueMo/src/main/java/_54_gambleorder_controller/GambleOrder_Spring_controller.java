package _54_gambleorder_controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import _54_gambleorder_service.GambleOrderService;
import _9_54_gambleorder_model.GambleOrderVO;

@Controller
@RequestMapping("/gambleOrder")
public class GambleOrder_Spring_controller
{
	@Autowired
	private GambleOrderService gambleOrderSVC;

	@RequestMapping(value = "/getAllGambleOrder", method = RequestMethod.GET)
	public String getAllGambleOrder(HttpServletRequest request, HttpServletResponse response)
	{
		System.out.println(" ----- 呼叫 GoodsOrder_Spring_controller -- getAllgoodsOrder() ----- ");
		List<GambleOrderVO> list = gambleOrderSVC.getAll();
		for (GambleOrderVO vo : list)
		{
			System.out.println(String.format("%5s %30s %5s %10s %10s %10s",
					vo.getGambleId(),
					vo.getMemberId(),
					vo.getBattleId(),
					vo.getBetHome(),
					vo.getBetAway(),
					vo.getBetTime()));
		}

		request.setAttribute("allGambleOrder", list);
		return "bk_gambleorder/_gambleOrder_manager";
	}

}
