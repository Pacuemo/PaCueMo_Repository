package _53_goodsorder_controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import _9_41_member_model.MemberVO;

@WebServlet("/_5_gambling/GoodsOrder_Servlet.do")
public class GoodsOrder_Servlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = null; // for ajax
		String action = request.getParameter("action");
		//---------------------------------------------------------------------------
		if ("buyCoins".equals(action))
		{
			try
			{
				//=============== 【session 中get 會員id】 ====================
				HttpSession session = request.getSession();
				MemberVO memberVO = (MemberVO) session.getAttribute("LoginOK");

				//==== 付款狀態 ===
				Boolean ispay = true;
//				//=============================================
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

				Integer cvc = null;
				try
				{
					cvc = Integer.valueOf(str_cvc);
				}
				catch (NumberFormatException e)
				{
					System.out.println(" === GoodsOrder_Servlet.java ==== cvc 轉換數字失敗");
				}
				Integer ntd = null;
				try
				{
					ntd = new Integer(str_ntd);
				}
				catch (NumberFormatException e)
				{
					System.out.println(" === GoodsOrder_Servlet.java ====  NTD 轉換數字失敗");
				}

				Integer coin = null;
				try
				{
					coin = new Integer(str_coin);
				}
				catch (NumberFormatException e)
				{
					System.out.println(" === GoodsOrder_Servlet.java ====  coin 轉換數字失敗");
				}

				java.sql.Timestamp bookingTime = null;
				try
				{
					bookingTime = java.sql.Timestamp.valueOf(str_bookingTime);
				}
				catch (IllegalArgumentException e)
				{
					System.out.println(" === GoodsOrder_Servlet.java ====  bookingTime 轉換 sql.Timestamp 失敗");
				}

				System.out.println("============== 型態轉換後訂單資料： =============");
				System.out.println(String.format("%10s %10s %10s %10s %10s %10s %10s %10s",
						str_cardNum, str_fullName, str_expireMM, str_expireYY, cvc, ntd, coin, bookingTime));
//				// =================== 格式錯誤驗證交給javascript dialogy做 ===========================
//				GoodsOrderService svc = new GoodsOrderService();
//				GoodsOrderVO vo = new GoodsOrderVO();
//
//				vo.setMemberId(memberId);
//				vo.setCardNum(cardNum);
//				vo.setFullName(fullName);
//				vo.setExpire(expire);
//				vo.setCvc(int_cvc);
//				vo.setNtdQty(int_NTD);
//				vo.setCoinQty(int_coin);
//				vo.setOrderDateTime(bookingSQLTime);
//				vo.setIsPay(ispay);
//				svc.addGoodsOrder(vo);
//
//				out = response.getWriter();
//				out.print("GGG");
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
