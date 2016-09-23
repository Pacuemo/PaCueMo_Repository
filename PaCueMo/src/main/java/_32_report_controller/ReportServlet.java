package _32_report_controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import _32_report_service.ReportService;
import _9_32_report_model.ReportVO;

@WebServlet("/_3_view/ReportServlet.do")
public class ReportServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		System.out.println("post is called");
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");

		if ("insert".equals(action))
		{
			List<String> errorMsgs = new LinkedList<String>();
			String reportType = request.getParameter("reportType");
			String reportContent = request.getParameter("reportContent");
			try
			{
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				if (reportType == null && reportContent == null)
				{
					if (reportType == null)
					{
						errorMsgs.add("請選擇問題類型");
					}

					if (reportContent == null || reportContent.trim().length() == 0)
					{
						errorMsgs.add("請輸入內容");
					}

					ReportVO reportVO = new ReportVO();
					reportVO.setReportType(Integer.parseInt(reportType));
					reportVO.setReportContent(reportContent);

					if (!errorMsgs.isEmpty())
					{
						request.setAttribute("reportVo", reportVO);
						RequestDispatcher failureView = request.getRequestDispatcher("/_3_view/report.jsp");
						failureView.forward(request, response);
						return;
					}
				}
				else
				{
					String url = "/index.jsp";
					RequestDispatcher successView = request.getRequestDispatcher(url);
					successView.forward(request, response);
					return;
				}
			}
			/*************************** 其他可能的錯誤處理 **********************************/
			catch (Exception e)
			{
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = request.getRequestDispatcher("/_3_view/report.jsp");
				failureView.forward(request, response);
				return;
			}
		}

		if ("delete".equals(action)) //後台			
		{
			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);

			try
			{
				//接收請求
				Integer reportId = new Integer(request.getParameter(""));
				//刪除資料
				ReportService repSvc = new ReportService();
				repSvc.delete(reportId);
				//刪除完成,轉接畫面
				String url = "";
				RequestDispatcher successView = request.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(request, response);
			}
			catch (Exception e)
			{
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = request.getRequestDispatcher("");
				failureView.forward(request, response);
			}
		}

	}

}
