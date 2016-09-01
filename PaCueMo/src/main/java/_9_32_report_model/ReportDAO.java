package _9_32_report_model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import _00_initial_service.GlobalService;

public class ReportDAO implements ReportDAO_interface
{
	String driver = GlobalService.DRIVER_NAME;
	String url = GlobalService.DB_URL;
	String userid = GlobalService.USERID;
	String passwd = GlobalService.PASSWORD;

	private static final String INSERT_STMT = "INSERT INTO Report (reportMemberId, reportType, reportContent) VALUES (?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT reportId, reportMemberId, reportType,reportContent FROM Report order by reportId";
	private static final String GET_ONE_STMT = "SELECT reportId, reportMemberId, reportType,reportContent FROM Report where reportId = ?";
	private static final String DELETE = "DELETE FROM Report where reportId = ?";
	private static final String UPDATE = "UPDATE Report set reportMemberId=?, reportType=?, reportContent=? where reportId = ?";

	@Override
	public void insert(ReportVO reportVO)
	{

		Connection con = null;
		PreparedStatement pstmt = null;

		try
		{
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, reportVO.getReportMemberId());
			pstmt.setInt(2, reportVO.getReportType());
			pstmt.setString(3, reportVO.getReportContent());

			pstmt.executeUpdate();
		}
		catch (ClassNotFoundException e)
		{
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
		}
		catch (SQLException se)
		{
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		}
		finally
		{
			if (pstmt != null)
			{
				try
				{
					pstmt.close();
				}
				catch (SQLException se)
				{
					se.printStackTrace(System.err);
				}
			}
			if (con != null)
			{
				try
				{
					con.close();
				}
				catch (Exception e)
				{
					e.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public void update(ReportVO reportVO)
	{

		Connection con = null;
		PreparedStatement pstmt = null;

		try
		{
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, reportVO.getReportMemberId());
			pstmt.setInt(2, reportVO.getReportType());
			pstmt.setString(3, reportVO.getReportContent());

			pstmt.executeUpdate();
		}
		catch (ClassNotFoundException e)
		{
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
		}
		catch (SQLException se)
		{
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		}
		finally
		{
			if (pstmt != null)
			{
				try
				{
					pstmt.close();
				}
				catch (SQLException se)
				{
					se.printStackTrace(System.err);
				}
			}
			if (con != null)
			{
				try
				{
					con.close();
				}
				catch (Exception e)
				{
					e.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public void delete(Integer reportId)
	{

		Connection con = null;
		PreparedStatement pstmt = null;

		try
		{
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, reportId);

			pstmt.executeUpdate();
		}
		catch (ClassNotFoundException e)
		{
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
		}
		catch (SQLException se)
		{
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		}
		finally
		{
			if (pstmt != null)
			{
				try
				{
					pstmt.close();
				}
				catch (SQLException se)
				{
					se.printStackTrace(System.err);
				}
			}
			if (con != null)
			{
				try
				{
					con.close();
				}
				catch (Exception e)
				{
					e.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public ReportVO findByPrimaryKey(Integer reportId)
	{

		ReportVO reportVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try
		{
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, reportId);

			rs = pstmt.executeQuery();
			while (rs.next())
			{
				reportVO = new ReportVO();
				reportVO.setReportId(rs.getInt("reportId"));
				reportVO.setReportMemberId(rs.getInt("reportMemberId"));
				reportVO.setReportType(rs.getInt("reportType"));
				reportVO.setReportContent(rs.getString("reportContent"));
			}
		}
		catch (ClassNotFoundException e)
		{
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
		}
		catch (SQLException se)
		{
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		}
		finally
		{
			if (rs != null)
			{
				try
				{
					rs.close();
				}
				catch (SQLException se)
				{
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null)
			{
				try
				{
					pstmt.close();
				}
				catch (SQLException se)
				{
					se.printStackTrace(System.err);
				}
			}
			if (con != null)
			{
				try
				{
					con.close();
				}
				catch (Exception e)
				{
					e.printStackTrace(System.err);
				}
			}
		}
		return reportVO;
	}

	@Override
	public List<ReportVO> getAll()
	{

		List<ReportVO> list = new ArrayList<ReportVO>();
		ReportVO reportVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try
		{
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);

			rs = pstmt.executeQuery();
			while (rs.next())
			{
				reportVO = new ReportVO();
				reportVO.setReportId(rs.getInt("reportId"));
				reportVO.setReportMemberId(rs.getInt("reportMemberId"));
				reportVO.setReportType(rs.getInt("reportType"));
				reportVO.setReportContent(rs.getString("reportContent"));
				list.add(reportVO);
			}
		}
		catch (ClassNotFoundException e)
		{
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
		}
		catch (SQLException se)
		{
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		}
		finally
		{
			if (rs != null)
			{
				try
				{
					rs.close();
				}
				catch (SQLException se)
				{
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null)
			{
				try
				{
					pstmt.close();
				}
				catch (SQLException se)
				{
					se.printStackTrace(System.err);
				}
			}
			if (con != null)
			{
				try
				{
					con.close();
				}
				catch (Exception e)
				{
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}
}
