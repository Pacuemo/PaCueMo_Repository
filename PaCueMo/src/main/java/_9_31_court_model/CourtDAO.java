package _9_31_court_model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import _00_initial_service.GlobalService;

public class CourtDAO implements CourtDAO_interface
{

	String driver = GlobalService.DRIVER_NAME;
	String url = GlobalService.DB_URL;
	String userid = GlobalService.USERID;
	String passwd = GlobalService.PASSWORD;

	private static final String INSERT_STMT = "INSERT INTO Court (name, courtaddress, imgUrl, latitude, longitude, webUrl, phone) VALUES (?, ?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT courtId, name, courtaddress, imgUrl, latitude, longitude, webUrl, phone FROM Court order by courtId";
	private static final String GET_ONE_STMT = "SELECT courtId, name, courtaddress, imgUrl, latitude, longitude, webUrl, phone FROM Court where courtId=?";
	private static final String DELETE = "DELETE FROM Court where courtId =?";
	private static final String UPDATE = "UPDATE Court set name=?, courtaddress=?, imgUrl=?, latitude=?, longitude=?, webUrl=?, phone=? where courtId=?";

	@Override
	public void insert(CourtVO courtVO)
	{
		Connection con = null;
		PreparedStatement pstmt = null;

		try
		{
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, courtVO.getName());
			pstmt.setString(2, courtVO.getCourtaddress());
			pstmt.setString(3, courtVO.getImgUrl());
			pstmt.setDouble(4, courtVO.getLatitue());
			pstmt.setDouble(5, courtVO.getLongitue());
			pstmt.setString(6, courtVO.getWebUrl());
			pstmt.setString(7, courtVO.getPhone());

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
	public void update(CourtVO courtVO)
	{
		Connection con = null;
		PreparedStatement pstmt = null;

		try
		{
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, courtVO.getName());
			pstmt.setString(2, courtVO.getCourtaddress());
			pstmt.setString(3, courtVO.getImgUrl());
			pstmt.setDouble(4, courtVO.getLatitue());
			pstmt.setDouble(5, courtVO.getLongitue());
			pstmt.setString(6, courtVO.getWebUrl());
			pstmt.setString(7, courtVO.getPhone());
			pstmt.setInt(8, courtVO.getCourtId());

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
	public void delete(Integer courtId)
	{
		Connection con = null;
		PreparedStatement pstmt = null;

		try
		{
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, courtId);

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

	//查詢單一場地
	@Override
	public CourtVO findByPrimaryKey(Integer courtId)
	{
		CourtVO courtVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try
		{
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, courtId);

			rs = pstmt.executeQuery();

			while (rs.next())
			{
				courtVO = new CourtVO();
				courtVO.setCourtId(rs.getInt("courtId"));
				courtVO.setName(rs.getString("name"));
				courtVO.setCourtaddress(rs.getString("courtaddress"));
				courtVO.setImgUrl(rs.getString("imgUrl"));
				courtVO.setLatitue(rs.getDouble("latitude"));
				courtVO.setLongitue(rs.getDouble("longitude"));
				courtVO.setWebUrl(rs.getString("webUrl"));
				courtVO.setPhone(rs.getString("phone"));
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
		return courtVO;
	}

	//查詢縣市場地(building...)
	@Override
	public List<CourtVO> getAll()
	{
		List<CourtVO> list = new ArrayList<CourtVO>();
		CourtVO courtVO = null;
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
				courtVO = new CourtVO();
				courtVO.setCourtId(rs.getInt("courtId"));
				courtVO.setName(rs.getString("name"));
				courtVO.setCourtaddress(rs.getString("courtaddress"));
				courtVO.setImgUrl(rs.getString("imgUrl"));
				courtVO.setLatitue(rs.getDouble("latitude"));
				courtVO.setLongitue(rs.getDouble("longitude"));
				courtVO.setWebUrl(rs.getString("webUrl"));
				courtVO.setPhone(rs.getString("phone"));
				list.add(courtVO);
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
					se.printStackTrace();
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
					se.printStackTrace();
				}
			}
			if (con != null)
			{
				try
				{
					con.close();
				}
				catch (SQLException se)
				{
					se.printStackTrace();
				}
			}
		}
		return list;
	}

	//查詢行政區場地(building...)
//	@Override
//	public List<CourtVO> getAll(){}
}
