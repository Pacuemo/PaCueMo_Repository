package _9_32_report_model;

import java.util.List;

public interface ReportDAO_interface
{
	public void insert(ReportVO reportVO);

	public void update(ReportVO reportVO);

	public void delete(Integer reportId);

	public ReportVO findByPrimaryKey(Integer reportId);

	public List<ReportVO> getAll();
}
