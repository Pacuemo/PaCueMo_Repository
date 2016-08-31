package _9_21_club_model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import _00_initial_servise.GlobalService;

public class ClubDAO implements ClubDAO_I
{

	private static final String insert_state = "insert into club(clubName,clubImgURL,clubDate,clubHead,clubProp) values (?,?,?,?,?)";
	private static final String delete_state = "delete from club where clubID=?";
	private static final String get_one_state = "select clubID,clubName,clubImgURL,clubDate,clubHead,clubProp from club where clubID=? ";
	private static final String get_all = "select clubID,clubName,clubImgURL,clubDate,clubHead,clubProp from club order by clubID ";
	private static final String update_one = "update club set clubImgURL=?,clubHead=?,clubProp=? where clubId = ?";

	/*
	 * (non-Javadoc)
	 * @see club.model.ClubDAO_I#insert(club.model.ClubVO)
	 */
	@Override
	public void insert(ClubVO clubVO)
	{
		PreparedStatement pstmt = null;
		Connection con = null;
		try
		{
			Class.forName(GlobalService.DRIVER_NAME);
		}
		catch (ClassNotFoundException e)
		{
			throw new RuntimeException("Can't find the SQL Driver." + e.getMessage());
		}
		try
		{
			con = DriverManager.getConnection(GlobalService.DB_URL, GlobalService.USERID, GlobalService.PASSWORD);
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(insert_state);
			pstmt.setString(1, clubVO.getClubName());
			pstmt.setString(2, clubVO.getClubImageName());
			pstmt.setDate(3, clubVO.getClubDate());
			pstmt.setInt(4, clubVO.getClubHead());
			pstmt.setInt(5, clubVO.getClubProp());
			pstmt.executeUpdate();
			con.commit();
			System.out.println("新增一筆資料");
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			if (pstmt != null)
			{
				try
				{
					pstmt.close();
				}
				catch (SQLException e)
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (con != null)
			{
				try
				{
					con.close();
				}
				catch (SQLException e)
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}
		}

	}

	/*
	 * (non-Javadoc)
	 * @see club.model.ClubDAO_I#delete(int)
	 */
	@Override
	public void delete(int clubId)
	{
		PreparedStatement pstmt = null;
		Connection con = null;
		try
		{
			Class.forName(GlobalService.DRIVER_NAME);
		}
		catch (ClassNotFoundException e1)
		{
			e1.printStackTrace();
		}
		try
		{
			con = DriverManager.getConnection(GlobalService.DB_URL, GlobalService.USERID, GlobalService.PASSWORD);
			pstmt = con.prepareStatement(delete_state);
			pstmt.setInt(1, clubId);
			pstmt.execute();
			System.out.println("刪除一筆資料");
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			if (pstmt != null)
			{
				try
				{
					pstmt.close();
				}
				catch (SQLException e)
				{
					e.printStackTrace();
				}
			}
			if (con != null)
			{
				try
				{
					con.close();
				}
				catch (SQLException e)
				{
					e.printStackTrace();
				}

			}
		}

	}

	/*
	 * (non-Javadoc)
	 * @see club.model.ClubDAO_I#update(club.model.ClubVO)
	 */
	@Override
	public void update(ClubVO clubVO)
	{
		PreparedStatement pstmt = null;
		Connection con = null;

		try
		{
			Class.forName(GlobalService.DRIVER_NAME);
		}
		catch (ClassNotFoundException e)
		{
			throw new RuntimeException("Can't find the SQL Driver." + e.getMessage());
		}
		try
		{

			con = DriverManager.getConnection(GlobalService.DB_URL, GlobalService.USERID, GlobalService.PASSWORD);
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(update_one);
			pstmt.setInt(5, clubVO.getClubID());
			pstmt.setString(2, clubVO.getClubImageName());
			pstmt.setInt(3, clubVO.getClubHead());
			pstmt.setInt(4, clubVO.getClubProp());
			pstmt.executeUpdate();
			con.commit();
			System.out.println("更新一筆資料");
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			if (pstmt != null)
			{
				try
				{
					pstmt.close();
				}
				catch (SQLException e)
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (con != null)
			{
				try
				{
					con.close();
				}
				catch (SQLException e)
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}
		}

	}

	/*
	 * (non-Javadoc)
	 * @see club.model.ClubDAO_I#findByPK(int)
	 */
	@Override
	public ClubVO findByPK(int clubId) throws RuntimeException
	{
		PreparedStatement pstmt = null;
		Connection con = null;
		ResultSet rs = null;
		ClubVO clubVO = null;
		try
		{
			Class.forName(GlobalService.DRIVER_NAME);
		}
		catch (ClassNotFoundException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try
		{
			con = DriverManager.getConnection(GlobalService.DB_URL, GlobalService.USERID, GlobalService.PASSWORD);
			pstmt = con.prepareStatement(get_one_state);
			pstmt.setInt(1, clubId);
			rs = pstmt.executeQuery();
			while (rs.next())
			{
				clubVO = new ClubVO();
				clubVO.setClubID(rs.getInt("clubID"));
				clubVO.setClubName(rs.getString("clubName"));
				clubVO.setClubImageName(rs.getString("clubImgUrl"));
				clubVO.setClubDate(rs.getDate("clubDate"));
				clubVO.setClubHead(rs.getInt("clubHead"));
				clubVO.setClubProp(rs.getInt("clubProp"));
				System.out.println("查詢一筆資料");
			}
			if (clubVO == null)
			{
				throw new RuntimeException("Can not find anything.");
			}
		}
		catch (SQLException e)
		{
			throw new RuntimeException("A database error occured. " + e.getMessage());
		}
		finally
		{
			try
			{
				if (rs != null)
				{
					rs.close();
				}
				if (pstmt != null)
				{
					pstmt.close();
				}
				if (con != null)
				{
					con.close();
				}
			}
			catch (SQLException e)
			{
				throw new RuntimeException("A database error occured. " + e.getMessage());
			}
		}
		return clubVO;

	}

	/*
	 * (non-Javadoc)
	 * @see club.model.ClubDAO_I#getAll()
	 */
	@Override
	public List<ClubVO> getAll()
	{
		PreparedStatement pstmt = null;
		Connection con = null;
		ResultSet rs = null;
		List<ClubVO> clubVOs = new LinkedList<ClubVO>();
		try
		{
			Class.forName(GlobalService.DRIVER_NAME);
		}
		catch (ClassNotFoundException e)
		{
			throw new RuntimeException("Can't find the SQL Driver." + e.getMessage());
		}

		try
		{
			con = DriverManager.getConnection(GlobalService.DB_URL, GlobalService.USERID, GlobalService.PASSWORD);
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try
		{
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(get_all);
			rs = pstmt.executeQuery();
			con.setAutoCommit(true);
			while (rs.next())
			{
				ClubVO clubVO = new ClubVO();
				clubVO.setClubID(rs.getInt("clubID"));
				clubVO.setClubName(rs.getString("clubName"));
				clubVO.setClubImageName(rs.getString("clubImgURL"));
				clubVO.setClubDate(rs.getDate("clubDate"));
				clubVO.setClubHead(rs.getInt("clubHead"));
				clubVO.setClubProp(rs.getInt("clubProp"));
				clubVOs.add(clubVO);
				System.out.println("查詢全部資料");
			}

		}
		catch (SQLException e)
		{
			try
			{
				con.rollback();
			}
			catch (SQLException e1)
			{
				e1.printStackTrace();
			}
			throw new RuntimeException("A database error occured. " + e.getMessage());
		}
		finally
		{
			try
			{
				if (rs != null)
				{
					rs.close();
				}
				if (pstmt != null)
				{
					pstmt.close();
				}
				if (con != null)
				{
					con.close();
				}
			}
			catch (SQLException e)
			{
				throw new RuntimeException("A database error occured. " + e.getMessage());
			}
		}
		return clubVOs;

	}

	public static void main(String[] args)
	{
		ClubDAO_I dao = new ClubDAO();
		List<ClubVO> clubVOs = dao.getAll();
		for (ClubVO clubVO : clubVOs)
		{
			System.out.println("ClubID:" + clubVO.getClubID());
			System.out.println("imgNAme:" + clubVO.getClubImageName());
			System.out.println("ClubName:" + clubVO.getClubName());
		}

	}

}
