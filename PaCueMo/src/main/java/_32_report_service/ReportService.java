package _32_report_service;

import java.util.List;

import _9_32_report_model.ReportDAO;
import _9_32_report_model.ReportDAO_interface;
import _9_32_report_model.ReportVO;

public class ReportService
{
	private ReportDAO_interface dao;

	public ReportService()
	{
		dao = new ReportDAO();
	}

	public void insert(Integer reportId, Integer reportMemberId, Integer reportType, String reportContent)
	{
		ReportVO reportVO = new ReportVO();
		reportVO.setReportId(reportId);
		reportVO.setReportMemberId(reportMemberId);
		reportVO.setReportType(reportType);
		reportVO.setReportContent(reportContent);

		dao.insert(reportVO);
	}

	public void insert(ReportVO reportVO)
	{
		dao.insert(reportVO);
	}

	public void update(Integer reportId, Integer reportMemberId, Integer reportType, String reportContent)
	{
		ReportVO reportVO = new ReportVO();
		reportVO.setReportId(reportId);
		reportVO.setReportMemberId(reportMemberId);
		reportVO.setReportType(reportType);
		reportVO.setReportContent(reportContent);

		dao.update(reportVO);
	}

	public void update(ReportVO reportVO)
	{
		dao.update(reportVO);
	}

	public void delete(Integer reportId)
	{
		dao.delete(reportId);
	}

	public ReportVO findOne(Integer reportId)
	{
		return dao.findByPrimaryKey(reportId);
	}

	public List<ReportVO> findAll()
	{
		return dao.getAll();
	}
}
