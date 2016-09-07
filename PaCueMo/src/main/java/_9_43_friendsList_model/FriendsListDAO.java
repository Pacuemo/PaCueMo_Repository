package _9_43_friendsList_model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import _00_initial_service.GlobalService;

public class FriendsListDAO implements FriendsListDAO_interface
{

	String driver = GlobalService.DRIVER_NAME;
	String url = GlobalService.DB_URL;
	String userid = GlobalService.USERID;
	String passwd = GlobalService.PASSWORD;

	private final String GET_ALL = "SELECT * FROM friendsList WHERE memberId = ?";

	@Override
	public List<FriendsListVO> getAllFriends(String memberId)
	{

		FriendsListVO friendsListVO = null;
		List<FriendsListVO> list;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try
		{
			Class.forName(driver);

			con = DriverManager.getConnection(url, userid, passwd);

			pstmt = con.prepareStatement(GET_ALL);

			pstmt.setString(1, memberId);

			rs = pstmt.executeQuery();

			list = new ArrayList<>();

			while (rs.next())
			{
				friendsListVO = new FriendsListVO();
				friendsListVO.setMemberId(rs.getString(1));
				friendsListVO.setMemberFriendId(rs.getString(2));
				friendsListVO.setFriendStatus(rs.getInt(3));
				list.add(friendsListVO);

			}

			// Handle any driver errors
		}
		catch (ClassNotFoundException e)
		{
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		}
		catch (SQLException se)
		{
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
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

	public static void main(String[] args)
	{
		FriendsListDAO friendsListDAO = new FriendsListDAO();
		friendsListDAO.getAllFriends("B411208D-B026-4973-845E-F4C6DFCDF263");
	}

}
