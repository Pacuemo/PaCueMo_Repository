package _9_31_report_model;

import java.io.Serializable;

public class ReportVO implements Serializable{
	private Integer reportId;
	private Integer reportMemberId;
	private Integer reportType;
	private String reportContent;
	
	public Integer getReportId() {
		return reportId;
	}
	public void setReportId(Integer reportId) {
		this.reportId = reportId;
	}
	public Integer getReportMemberId() {
		return reportMemberId;
	}
	public void setReportMemberId(Integer reportMemberId) {
		this.reportMemberId = reportMemberId;
	}
	public Integer getReportType() {
		return reportType;
	}
	public void setReportType(Integer reportType) {
		this.reportType = reportType;
	}
	public String getReportContent() {
		return reportContent;
	}
	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}
	
}
