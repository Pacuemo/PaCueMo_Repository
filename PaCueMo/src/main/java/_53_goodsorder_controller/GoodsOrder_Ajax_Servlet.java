package _53_goodsorder_controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;

import _50_goodsorder_facade.GoodsOrderFacade;
import _50_goodsorder_facade.GoodsOrderFacade_Config;
import _9_41_member_model.MemberVO;
import _9_53_goodsorder_model.GoodsOrderVO;

@WebServlet("/_5_gambling/GoodsOrder_Ajax_Servlet.do")
public class GoodsOrder_Ajax_Servlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	private AnnotationConfigWebApplicationContext context;
	//private GoodsOrderService goodsSvc;
	private GoodsOrderFacade buyPointsSvc;

	@Override
	public void init() throws ServletException
	{
		context = new AnnotationConfigWebApplicationContext();
		context.scan("_50_goodsorder_facade");
		context.register(GoodsOrderFacade_Config.class);
		context.refresh();
		buyPointsSvc = (GoodsOrderFacade) context.getBean("goodsOrderFacade2");

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();// for ajax
		String action = request.getParameter("action");
		//---------------------------------------------------------------------------
		if ("buyCoins".equals(action))
		{
			System.out.println(" ========== 呼叫 GoodsOrder_Ajax_Servlet → buyCoins ========= ");
			try
			{
				//=============== 【session 中get 會員id】 ====================
				HttpSession session = request.getSession();
				MemberVO memberVO = (MemberVO) session.getAttribute("LoginOK");

				//==== 付款狀態 ===
				Boolean ispay = true;
//				//=============================================
				String memberId = memberVO.getMemberId();
				String str_cardNum = request.getParameter("cardNum").trim();
				String str_fullName = request.getParameter("fullName").trim();
				String str_expireMM = request.getParameter("expireMM").trim();
				String str_expireYY = request.getParameter("expireYY").trim();
				String str_cvc = request.getParameter("cvc").trim();
				String str_ntd = request.getParameter("ntd").trim();
				String str_coin = request.getParameter("coin").trim();
				String str_bookingTime = request.getParameter("bookingTime");
//				System.out.println(String.format("%10s %10s %10s %10s %10s %10s %10s %10s",
//						str_cardNum, str_fullName, str_expireMM, str_expireYY, str_cvc, str_ntd, str_coin, str_bookingTime));
				//=============== 【型態轉換】 ====================
				Integer ntd = null;
				try
				{
					ntd = new Integer(str_ntd);
				}
				catch (NumberFormatException e)
				{
					System.out.println(" === GoodsOrder_Servlet.java ====  NTD 轉換數字失敗");
					out.print("exception");
					return;
				}

				Double coin = null;
				try
				{
					coin = new Double(str_coin);
				}
				catch (NumberFormatException e)
				{
					System.out.println(" === GoodsOrder_Servlet.java ====  coin 轉換數字失敗");
					out.print("exception");
					return;
				}

				java.sql.Timestamp bookingTime = null;
				try
				{
					bookingTime = java.sql.Timestamp.valueOf(str_bookingTime);
				}
				catch (IllegalArgumentException e)
				{
					System.out.println(" === GoodsOrder_Servlet.java ====  bookingTime 轉換 sql.Timestamp 失敗");
					out.print("exception");
					return;
				}

				System.out.println("============== 型態轉換後訂單資料： =============");
				System.out.println(String.format("%10s %10s %5s %5s %8s %8s %10s %30s",
						str_cardNum, str_fullName, str_expireMM, str_expireYY, str_cvc, ntd, coin, bookingTime));
//				// =================== 格式錯誤驗證交給javascript dialogy做 ===========================
//				GoodsOrderService svc = new GoodsOrderService();
				GoodsOrderVO gdVO = new GoodsOrderVO();
				gdVO.setMemberId(memberId);
				gdVO.setCardNum(str_cardNum);
				gdVO.setFullName(str_fullName);
				gdVO.setExpireYY(str_expireYY);
				gdVO.setExpireMM(str_expireMM);
				gdVO.setCvc(str_cvc);
				gdVO.setNtdQty(ntd);
				gdVO.setCoinQty(coin);
				gdVO.setOrderDateTime(bookingTime);
				gdVO.setIsPay(ispay);
				//goodsSvc.addGoodsOrder(vo);
				buyPointsSvc.buyPoints(gdVO, memberVO, coin);
//				out.print("success");
				out.print(memberVO.getMemberPoint());
			}
			catch (Exception e)// 其他可能錯誤處理
			{
				/*
				 * //【導向錯誤頁面】
				 * RequestDispatcher failureView = req.getRequestDispatcher("/emp/addEmp.jsp");
				 * failureView.forward(req, res);
				 * return;
				 */
				System.out.println("=== GoodsOrder_Servlet.java 發生異常錯誤 L109===");
			}

		}
	}

}
