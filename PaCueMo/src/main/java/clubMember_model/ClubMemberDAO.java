package clubMember_model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import _00_initial_service.GlobalService;

public class ClubMemberDAO implements ClubMemberDAO_I
{

	private static final String insert_state = "insert into clubMemberTable values (?,?,?)";
	private static final String delete_state = "delete from clubMemberTable where clubMemberId=?";
	private static final String get_one_state = "select clubId,clubMemberId,joinDate from clubMemberTable where clubMemberId=? ";
	private static final String get_all = "select clubId,clubMemberId,joinDate from clubMemberTable ";
	private static final String get_club_all = "select clubId,clubMemberId,joinDate from clubMemberTable where clubId=? ";

	/*
	 * (non-Javadoc)
	 * @see clubMember.model.ClubMemberDAO_I#insert(clubMember.model.ClubMemberVO)
	 */
	@Override
	public void insert(ClubMemberVO clubMemberVO)
	{
		Connection con = null;
		PreparedStatement ptsmt = null;

		try
		{
			Class.forName(GlobalService.DRIVER_NAME);
		}
		catch (ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		try
		{

			con = DriverManager.getConnection(GlobalService.DB_URL, GlobalService.USERID, GlobalService.PASSWORD);
			con.setAutoCommit(false);
			ptsmt = con.prepareStatement(insert_state);

			ptsmt.setInt(1, clubMemberVO.getClubId());
			ptsmt.setInt(2, clubMemberVO.getClubMemberId());
			ptsmt.setDate(3, clubMemberVO.getJoinDate());
			ptsmt.executeUpdate();
			con.commit();
			System.out.println("新增一筆資料");
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
			e.printStackTrace();
		}
		finally
		{
			if (ptsmt != null)
			{
				try
				{
					ptsmt.close();
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
	 * @see clubMember.model.ClubMemberDAO_I#delete(int)
	 */
	@Override
	public void delete(int clubMemberID)
	{
		Connection con = null;
		PreparedStatement ptsmt = null;

		try
		{
			Class.forName(GlobalService.DRIVER_NAME);
		}
		catch (ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		try
		{

			con = DriverManager.getConnection(GlobalService.DB_URL, GlobalService.USERID, GlobalService.PASSWORD);
			con.setAutoCommit(false);
			ptsmt = con.prepareStatement(delete_state);
			ptsmt.setInt(1, clubMemberID);
			ptsmt.executeUpdate();
			con.commit();
			System.out.println("刪除一筆資料");
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
			e.printStackTrace();
		}
		finally
		{
			if (ptsmt != null)
			{
				try
				{
					ptsmt.close();
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
	 * @see clubMember.model.ClubMemberDAO_I#findByPK(int)
	 */
	@Override
	public ClubMemberVO findByPK(int clubMemberID)
	{
		Connection con = null;
		PreparedStatement ptsmt = null;
		ResultSet rs = null;
		ClubMemberVO memberVO = new ClubMemberVO();

		try
		{
			Class.forName(GlobalService.DRIVER_NAME);
		}
		catch (ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		try
		{

			con = DriverManager.getConnection(GlobalService.DB_URL, GlobalService.USERID, GlobalService.PASSWORD);
			con.setAutoCommit(false);
			ptsmt = con.prepareStatement(get_one_state);
			ptsmt.setInt(1, clubMemberID);
			rs = ptsmt.executeQuery();
			con.commit();
			System.out.println("查詢一筆資料");
			while (rs.next())
			{
				memberVO.setClubId(rs.getInt(1));
				memberVO.setClubMemberId(rs.getInt(2));
				memberVO.setJoinDate(rs.getDate(3));
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
			e.printStackTrace();
		}
		finally
		{
			if (ptsmt != null)
			{
				try
				{
					ptsmt.close();
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
		return memberVO;
	}

	/*
	 * (non-Javadoc)
	 * @see clubMember.model.ClubMemberDAO_I#getAll()
	 */
	@Override
	public List<ClubMemberVO> getAll()
	{
		Connection con = null;
		PreparedStatement ptsmt = null;
		ResultSet rs = null;
		List<ClubMemberVO> members = null;

		try
		{
			Class.forName(GlobalService.DRIVER_NAME);
		}
		catch (ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		try
		{
			members = new LinkedList<ClubMemberVO>();
			con = DriverManager.getConnection(GlobalService.DB_URL, GlobalService.USERID, GlobalService.PASSWORD);
			con.setAutoCommit(false);
			ptsmt = con.prepareStatement(get_all);
			rs = ptsmt.executeQuery();
			con.commit();
			System.out.println("查詢全部資料");
			while (rs.next())
			{
				ClubMemberVO memberVO = new ClubMemberVO();
				memberVO.setClubId(rs.getInt(1));
				memberVO.setClubMemberId(rs.getInt(2));
				memberVO.setJoinDate(rs.getDate(3));
				members.add(memberVO);
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
			e.printStackTrace();
		}
		finally
		{
			if (ptsmt != null)
			{
				try
				{
					ptsmt.close();
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
		return members;
	}

	/*
	 * (non-Javadoc)
	 * @see clubMember.model.ClubMemberDAO_I#getClubAll(int)
	 */
	@Override
	public List<ClubMemberVO> getClubAll(int clubId)
	{
		Connection con = null;
		PreparedStatement ptsmt = null;
		ResultSet rs = null;
		List<ClubMemberVO> members = null;

		try
		{
			Class.forName(GlobalService.DRIVER_NAME);
		}
		catch (ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		try
		{
			members = new LinkedList<ClubMemberVO>();
			con = DriverManager.getConnection(GlobalService.DB_URL, GlobalService.USERID, GlobalService.PASSWORD);
			con.setAutoCommit(false);
			ptsmt = con.prepareStatement(get_club_all);
			//��J�e�x��J���
			ptsmt.setInt(1, clubId);
			rs = ptsmt.executeQuery();
			con.commit();
			System.out.println("查詢單一社團會員資料");
			while (rs.next())
			{
				ClubMemberVO memberVO = new ClubMemberVO();
				memberVO.setClubId(rs.getInt(1));
				memberVO.setClubMemberId(rs.getInt(2));
				memberVO.setJoinDate(rs.getDate(3));
				members.add(memberVO);
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
			e.printStackTrace();
		}
		finally
		{
			if (ptsmt != null)
			{
				try
				{
					ptsmt.close();
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
		return members;
	}

	public static void main(String[] args)
	{
		ClubMemberDAO_I dao = new ClubMemberDAO();
		ClubMemberVO vo = new ClubMemberVO();
//        
//        vo.setClubId(13);
//        vo.setClubMemberId(165);
//        vo.setJoinDate(new Date(System.currentTimeMillis()));
//        
//        dao.insert(vo);
//		dao.delete(165);
//		vo=dao.findByPK(145);
//		System.out.println(vo.getClubId());
//		System.out.println(vo.getJoinDate());
//		
		List<ClubMemberVO> members = dao.getAll();
		for (ClubMemberVO member : members)
		{
			System.out.print(member.getClubId() + "   ");
			System.out.print(member.getClubMemberId() + "   ");
			System.out.print(member.getJoinDate() + "   ");
			System.out.println();
		}

	}

}
