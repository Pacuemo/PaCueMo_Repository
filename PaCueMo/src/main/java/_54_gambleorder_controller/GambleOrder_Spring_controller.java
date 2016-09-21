package _54_gambleorder_controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import _54_gambleorder_service.GambleOrderService;
import _9_54_gambleorder_model.GambleOrderVO;

@Controller
@RequestMapping("/gambleOrder")
public class GambleOrder_Spring_controller
{
	@Autowired
	private GambleOrderService gambleOrderSVC;

	//================= 轉交至設定Timer頁面 =======================

	@RequestMapping(value = "timerSetter", method = RequestMethod.GET)
	public String toTimerSetter()
	{
		System.out.println(" ======== 導向頁面至 WEB-INF/_allocateTime_mamager.jsp ======== ");
		return "bk_gambleorder/_allocateTime_mamager";
	}

	//===================== 查全部 ============================
	@RequestMapping(value = "/getAllGambleOrder", method = RequestMethod.GET)
	public String getAllGambleOrder(HttpServletRequest request, HttpServletResponse response)
	{
		System.out.println(" ----- 呼叫 GoodsOrder_Spring_controller -- getAllgoodsOrder() ----- ");
		List<GambleOrderVO> list = gambleOrderSVC.getAll_EmbedMember();
//		for (GambleOrderVO gbVO : list)
//		{
//			String str = String.format("%3s %3s \t %10s %10s %10s",
//					gbVO.getMemberVO().getMemberLastName(),
//					gbVO.getMemberVO().getMemberFirstName(),
//					gbVO.getBetTime(),
//					gbVO.getBetHome(),
//					gbVO.getBetAway());
//			System.out.println(str);
//		}
		request.setAttribute("allGambleOrder", list);
		return "bk_gambleorder/_gambleOrder_manager";
	}

	//======================【刪除訂單】=======================
	@ResponseBody
	@RequestMapping(value = "/deleteOrder", method = RequestMethod.POST, produces = "text/plain; charset=utf-8")
	public String deleteGambleOrderById(@RequestParam("gambleId") Integer gambleId)
	{
		try
		{
			gambleOrderSVC.delete(gambleId);
			return "del_success";
		}
		catch (RuntimeException ex)
		{
			System.out.println("----------- 刪除GambleOrder發生例外 ----------");
			ex.printStackTrace();
			return "del_fail";
		}

	}

	//======================【修改訂單】=======================
	@ResponseBody
	@RequestMapping(value = "/updateOrder", method = RequestMethod.POST, produces = "text/plain; charset=utf-8")
	public String updateGambleOrderById(
			@RequestParam("gambleId") Integer gambleId,
			@RequestParam("battleId") Integer battleId,
			@RequestParam("modify_betHome") Double modify_betHome,
			@RequestParam("modify_betAway") Double modify_betAway,
			@RequestParam("betTime") java.sql.Timestamp betTime,
			@RequestParam("mbId") String mbId)
	{

		System.out.println(
				String.format("gambleId:%2s battleId:%2s homeBet:%6s awayBet:%6s ",
						gambleId, battleId, modify_betHome, modify_betAway));
		try
		{
			GambleOrderVO gbOrderVO = new GambleOrderVO();
			gbOrderVO.setGambleId(gambleId);
			gbOrderVO.setBattleId(battleId);
			gbOrderVO.setBetHome(modify_betHome);
			gbOrderVO.setBetAway(modify_betAway);
			gbOrderVO.setBetTime(betTime);
			gbOrderVO.setMemberId(mbId);
			gambleOrderSVC.update(gbOrderVO);
			return "update_success";
		}
		catch (RuntimeException ex)
		{
			System.out.println("----------- 更新 GambleOrder發生例外 ----------");
			ex.printStackTrace();
			return "update_fail";
		}

	}
}
