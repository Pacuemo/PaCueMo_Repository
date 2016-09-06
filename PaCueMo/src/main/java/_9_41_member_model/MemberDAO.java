package _9_41_member_model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import org.springframework.stereotype.Component;

import _00_initial_service.GlobalService;

@Component
public class MemberDAO implements MemberDAO_interface
{

//	private static DataSource ds = null;
//	static {
//		try {
//			Context ctx = new InitialContext();
//			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
//		} catch (NamingException e) {
//			e.printStackTrace();
//		}
//	}

	String driver = GlobalService.DRIVER_NAME;
	String url = GlobalService.DB_URL;
	String userid = GlobalService.USERID;
	String passwd = GlobalService.PASSWORD;

	private static final String INSERT_STMT = "INSERT dbo.Member( memberId, memberFirstName ,memberLastName ,memberPassword ,memberBirthday ,memberPhone ,memberMail,"
			+ " memberPoint ,memberHaveCard ,memberType ,memberRgDateTime, memberMailStatus, member2StepVerify"
			+ ") VALUES ( NEWID(),?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )";

	private static final String INSERT_STMT_fb = "INSERT dbo.Member( memberId, memberFirstName ,memberLastName ,memberBirthday ,memberPhone ,memberMail,"
			+ " memberPoint ,memberHaveCard ,memberFBId ,memberType ,memberRgDateTime, memberMailStatus, member2StepVerify"
			+ ") VALUES ( NEWID(),?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )";

	private static final String GET_ALL_STMT = "SELECT memberId, memberPassword, memberFirstName ,memberLastName ,memberBirthday ,memberPhone , memberMail, "
			+ "memberPoint ,memberHaveCard ,memberFBId ,memberType ,memberRgDateTime, memberMailStatus, member2StepVerify FROM dbo.Member ORDER BY memberId";

	private static final String GET_ONE_STMT = "SELECT memberId, memberFirstName ,memberLastName ,memberBirthday ,memberPhone , memberMail, memberImgUrl, "
			+ "memberPoint ,memberHaveCard ,memberFBId ,memberType ,memberRgDateTime, memberMailStatus, member2StepVerify, memberSecretKey FROM dbo.Member WHERE memberId = ?";

	private static final String GET_ONE_STMT_BY_MAIL = "SELECT memberId, memberPassword, memberFirstName ,memberLastName ,memberBirthday ,memberPhone , memberMail, memberImgUrl, "
			+ "memberPoint ,memberHaveCard ,memberFBId ,memberType ,memberRgDateTime, memberMailStatus, member2StepVerify, memberSecretKey FROM dbo.Member WHERE memberMail = ?";

	private static final String GET_ONE_STMT_BY_FBID = "SELECT memberId, memberFirstName ,memberLastName ,memberBirthday ,memberPhone , memberMail,memberImgUrl , "
			+ "memberPoint ,memberHaveCard ,memberFBId ,memberType ,memberRgDateTime, memberMailStatus, member2StepVerify, memberSecretKey FROM dbo.Member WHERE memberFBId = ?";

	private static final String UPDATE = "UPDATE dbo.Member SET memberPhone = ?, memberMail = ? WHERE memberId = ?";

	private static final String UPDATE_FBID = "UPDATE dbo.Member SET memberFBId = ?, memberImgUrl = ? WHERE memberId = ?";

	private static final String UPDATE_SKEY = "UPDATE dbo.Member SET memberSecretKey = ?, member2StepVerify = ? WHERE memberId = ?";

	private static final String UPDATE_PASSWORD = "UPDATE dbo.Member SET memberPassword = ? WHERE memberId = ?";

	private static final String UPDATE_IMG = "UPDATE dbo.Member SET memberImgUrl = ? WHERE memberId = ?";

	private static final String UPDATE_POINT = "UPDATE dbo.Member SET memberPoint = ? WHERE memberId = ?";

	@Override
	public MemberVO insert(String memberFirstName, String memberLastName, String memberPassword, Date memberBirthday, String memberPhone, String memberMail)
	{
		MemberVO memberVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try
		{
			Class.forName(driver);

			con = DriverManager.getConnection(url, userid, passwd);

			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, memberFirstName);
			pstmt.setString(2, memberLastName);
			pstmt.setString(3, GlobalService.getMD5Endocing(memberPassword));
			pstmt.setDate(4, memberBirthday);
			pstmt.setString(5, memberPhone);
			pstmt.setString(6, memberMail);
			pstmt.setDouble(7, 1000.0);
			pstmt.setBoolean(8, false);
			pstmt.setInt(9, 1);
			pstmt.setTimestamp(10, new Timestamp(System.currentTimeMillis()));
			pstmt.setBoolean(11, false);
			pstmt.setBoolean(12, false);

			if (pstmt.executeUpdate() == 1)
			{
				pstmt.close();
				pstmt = con.prepareStatement(GET_ONE_STMT_BY_MAIL);
				pstmt.setString(1, memberMail);

				rs = pstmt.executeQuery();

				while (rs.next())
				{
					if (rs.getString("memberPassword").equals(GlobalService.getMD5Endocing(memberPassword)))
					{
						memberVO = new MemberVO();
						memberVO.setMemberId(rs.getString("memberId"));
						memberVO.setMemberFirstName(rs.getString("memberFirstName"));
						memberVO.setMemberLastName(rs.getString("memberLastName"));
						memberVO.setMemberBirthday(rs.getDate("memberBirthday"));
						memberVO.setMemberPhone(rs.getString("memberPhone"));
						memberVO.setMemberMail(rs.getString("memberMail"));
						memberVO.setMemberImgUrl(rs.getString("memberImgUrl"));
						memberVO.setMemberPoint(rs.getDouble("memberPoint"));
						memberVO.setMemberFBId(rs.getString("memberFBId"));
					}
					else
					{
						return null;
					}
				}
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
		return memberVO;
	}

	@Override
	public MemberVO insert_fb(String memberFirstName, String memberLastName, Date memberBirthday, String memberPhone, String memberMail, String memberFBId)
	{
		MemberVO memberVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try
		{
			Class.forName(driver);

			con = DriverManager.getConnection(url, userid, passwd);

			pstmt = con.prepareStatement(INSERT_STMT_fb);

			pstmt.setString(1, memberFirstName);
			pstmt.setString(2, memberLastName);
			pstmt.setDate(3, memberBirthday);
			pstmt.setString(4, memberPhone);
			pstmt.setString(5, memberMail);
			pstmt.setDouble(6, 1000.0);
			pstmt.setBoolean(7, false);
			pstmt.setString(8, memberFBId);
			pstmt.setInt(9, 1);
			pstmt.setTimestamp(10, new Timestamp(System.currentTimeMillis()));
			pstmt.setBoolean(11, false);
			pstmt.setBoolean(12, false);

			if (pstmt.executeUpdate() == 1)
			{
				pstmt.close();
				pstmt = con.prepareStatement(GET_ONE_STMT_BY_MAIL);
				pstmt.setString(1, memberMail);

				rs = pstmt.executeQuery();

				while (rs.next())
				{

					memberVO = new MemberVO();
					memberVO.setMemberId(rs.getString("memberId"));
					memberVO.setMemberFirstName(rs.getString("memberFirstName"));
					memberVO.setMemberLastName(rs.getString("memberLastName"));
					memberVO.setMemberBirthday(rs.getDate("memberBirthday"));
					memberVO.setMemberPhone(rs.getString("memberPhone"));
					memberVO.setMemberMail(rs.getString("memberMail"));
					memberVO.setMemberImgUrl(rs.getString("memberImgUrl"));
					memberVO.setMemberPoint(rs.getDouble("memberPoint"));
					memberVO.setMemberFBId(rs.getString("memberFBId"));

				}
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
		return memberVO;
	}

	@Override
	public MemberVO findByPrimaryKey(String memberId)
	{

		MemberVO memberVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try
		{

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, memberId);

			rs = pstmt.executeQuery();

			while (rs.next())
			{

				memberVO = new MemberVO();
				memberVO.setMemberId(rs.getString("memberId"));
				memberVO.setMemberFirstName(rs.getString("memberFirstName"));
				memberVO.setMemberLastName(rs.getString("memberLastName"));
				memberVO.setMemberBirthday(rs.getDate("memberBirthday"));
				memberVO.setMemberPhone(rs.getString("memberPhone"));
				memberVO.setMemberMail(rs.getString("memberMail"));
				memberVO.setMemberImgUrl(rs.getString("memberImgUrl"));
				memberVO.setMemberPoint(rs.getDouble("memberPoint"));
				memberVO.setMemberFBId(rs.getString("memberFBId"));
				memberVO.setMember2StepVerify(rs.getBoolean("member2StepVerify"));
				memberVO.setMemberSecretKey(rs.getString("memberSecretKey"));

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
		return memberVO;
	}

	@Override
	public MemberVO findByUserMail(String memberMail)
	{
		MemberVO memberVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try
		{

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT_BY_MAIL);

			pstmt.setString(1, memberMail);

			rs = pstmt.executeQuery();

			while (rs.next())
			{
				memberVO = new MemberVO();
				memberVO.setMemberId(rs.getString("memberId"));
				memberVO.setMemberPassword(rs.getString("memberPassword"));
				memberVO.setMemberFirstName(rs.getString("memberFirstName"));
				memberVO.setMemberLastName(rs.getString("memberLastName"));
				memberVO.setMemberBirthday(rs.getDate("memberBirthday"));
				memberVO.setMemberPhone(rs.getString("memberPhone"));
				memberVO.setMemberMail(rs.getString("memberMail"));
				memberVO.setMemberImgUrl(rs.getString("memberImgUrl"));
				memberVO.setMemberPoint(rs.getDouble("memberPoint"));
				memberVO.setMemberFBId(rs.getString("memberFBId"));
				memberVO.setMember2StepVerify(rs.getBoolean("member2StepVerify"));
				memberVO.setMemberSecretKey(rs.getString("memberSecretKey"));
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

		if (memberVO == null)
		{
			return null;
		}

		return memberVO;

	}

	@Override
	public MemberVO findByUserFBID(String memberFBId)
	{

		MemberVO memberVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try
		{

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT_BY_FBID);

			pstmt.setString(1, memberFBId);

			rs = pstmt.executeQuery();

			while (rs.next())
			{
				memberVO = new MemberVO();
				memberVO.setMemberId(rs.getString("memberId"));
				memberVO.setMemberFirstName(rs.getString("memberFirstName"));
				memberVO.setMemberLastName(rs.getString("memberLastName"));
				memberVO.setMemberBirthday(rs.getDate("memberBirthday"));
				memberVO.setMemberPhone(rs.getString("memberPhone"));
				memberVO.setMemberMail(rs.getString("memberMail"));
				memberVO.setMemberImgUrl(rs.getString("memberImgUrl"));
				memberVO.setMemberPoint(rs.getDouble("memberPoint"));
				memberVO.setMemberFBId(rs.getString("memberFBId"));
				memberVO.setMember2StepVerify(rs.getBoolean("member2StepVerify"));
				memberVO.setMemberSecretKey(rs.getString("memberSecretKey"));
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

		if (memberVO != null)
		{
			return memberVO;
		}

		return null;

	}

	@Override
	public List<MemberVO> getAll()
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVO findSKeyByUserMail(String memberMail)
	{
		MemberVO memberVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try
		{

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT_BY_MAIL);

			pstmt.setString(1, memberMail);

			rs = pstmt.executeQuery();

			while (rs.next())
			{
				memberVO = new MemberVO();
				memberVO.setMemberId(rs.getString("memberId"));
				memberVO.setMemberPassword(rs.getString("memberPassword"));
				memberVO.setMemberFirstName(rs.getString("memberFirstName"));
				memberVO.setMemberLastName(rs.getString("memberLastName"));
				memberVO.setMemberBirthday(rs.getDate("memberBirthday"));
				memberVO.setMemberPhone(rs.getString("memberPhone"));
				memberVO.setMemberMail(rs.getString("memberMail"));
				memberVO.setMemberImgUrl(rs.getString("memberImgUrl"));
				memberVO.setMemberPoint(rs.getDouble("memberPoint"));
				memberVO.setMemberFBId(rs.getString("memberFBId"));
				memberVO.setMember2StepVerify(rs.getBoolean("member2StepVerify"));
				memberVO.setMemberSecretKey(rs.getString("memberSecretKey"));
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

		if (memberVO == null)
		{
			return null;
		}

		return memberVO;
	}

	@Override
	public MemberVO findSKeyByUserFBID(String memberFBId)
	{
		MemberVO memberVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try
		{

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT_BY_FBID);

			pstmt.setString(1, memberFBId);

			rs = pstmt.executeQuery();

			while (rs.next())
			{
				memberVO = new MemberVO();
				memberVO.setMemberId(rs.getString("memberId"));
				memberVO.setMemberFirstName(rs.getString("memberFirstName"));
				memberVO.setMemberLastName(rs.getString("memberLastName"));
				memberVO.setMemberBirthday(rs.getDate("memberBirthday"));
				memberVO.setMemberPhone(rs.getString("memberPhone"));
				memberVO.setMemberMail(rs.getString("memberMail"));
				memberVO.setMemberImgUrl(rs.getString("memberImgUrl"));
				memberVO.setMemberPoint(rs.getDouble("memberPoint"));
				memberVO.setMemberFBId(rs.getString("memberFBId"));
				memberVO.setMember2StepVerify(rs.getBoolean("member2StepVerify"));
				memberVO.setMemberSecretKey(rs.getString("memberSecretKey"));
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

		if (memberVO != null)
		{
			return memberVO;
		}

		return null;

	}

	@Override
	public MemberVO updatePointByPrimaryKey(String memberId, Double point)
	{
		MemberVO memberVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try
		{
			Class.forName(driver);

			con = DriverManager.getConnection(url, userid, passwd);

			pstmt = con.prepareStatement(UPDATE_POINT);

			pstmt.setDouble(1, point);
			pstmt.setString(2, memberId);

			if (pstmt.executeUpdate() == 1)
			{
				pstmt.close();
				pstmt = con.prepareStatement(GET_ONE_STMT);
				pstmt.setString(1, memberId);

				rs = pstmt.executeQuery();

				while (rs.next())
				{

					memberVO = new MemberVO();
					memberVO.setMemberId(rs.getString("memberId"));
					memberVO.setMemberFirstName(rs.getString("memberFirstName"));
					memberVO.setMemberLastName(rs.getString("memberLastName"));
					memberVO.setMemberBirthday(rs.getDate("memberBirthday"));
					memberVO.setMemberPhone(rs.getString("memberPhone"));
					memberVO.setMemberMail(rs.getString("memberMail"));
					memberVO.setMemberImgUrl(rs.getString("memberImgUrl"));
					memberVO.setMemberPoint(rs.getDouble("memberPoint"));
					memberVO.setMemberFBId(rs.getString("memberFBId"));
					memberVO.setMember2StepVerify(rs.getBoolean("member2StepVerify"));
					memberVO.setMemberSecretKey(rs.getString("memberSecretKey"));

				}
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
		return memberVO;
	}

	@Override
	public MemberVO updateSKeyByPrimaryKey(String memberId, String memberSecretKey, boolean status)
	{
		MemberVO memberVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try
		{
			Class.forName(driver);

			con = DriverManager.getConnection(url, userid, passwd);

			pstmt = con.prepareStatement(UPDATE_SKEY);

			pstmt.setString(1, memberSecretKey);
			pstmt.setBoolean(2, status);
			pstmt.setString(3, memberId);

			if (pstmt.executeUpdate() == 1)
			{
				pstmt.close();
				pstmt = con.prepareStatement(GET_ONE_STMT);
				pstmt.setString(1, memberId);

				rs = pstmt.executeQuery();

				while (rs.next())
				{

					memberVO = new MemberVO();
					memberVO.setMemberId(rs.getString("memberId"));
					memberVO.setMemberFirstName(rs.getString("memberFirstName"));
					memberVO.setMemberLastName(rs.getString("memberLastName"));
					memberVO.setMemberBirthday(rs.getDate("memberBirthday"));
					memberVO.setMemberPhone(rs.getString("memberPhone"));
					memberVO.setMemberMail(rs.getString("memberMail"));
					memberVO.setMemberImgUrl(rs.getString("memberImgUrl"));
					memberVO.setMemberPoint(rs.getDouble("memberPoint"));
					memberVO.setMemberFBId(rs.getString("memberFBId"));
					memberVO.setMember2StepVerify(rs.getBoolean("member2StepVerify"));
					memberVO.setMemberSecretKey(rs.getString("memberSecretKey"));

				}
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
		return memberVO;
	}

	@Override
	public MemberVO updateFbIdByPrimaryKey(String memberId, String fbId, String memberImgUrl)
	{
		MemberVO memberVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try
		{
			Class.forName(driver);

			con = DriverManager.getConnection(url, userid, passwd);

			pstmt = con.prepareStatement(UPDATE_FBID);

			pstmt.setString(1, fbId);
			pstmt.setString(2, memberImgUrl);
			pstmt.setString(3, memberId);

			if (pstmt.executeUpdate() == 1)
			{
				pstmt.close();
				pstmt = con.prepareStatement(GET_ONE_STMT);
				pstmt.setString(1, memberId);

				rs = pstmt.executeQuery();

				while (rs.next())
				{

					memberVO = new MemberVO();
					memberVO.setMemberId(rs.getString("memberId"));
					memberVO.setMemberFirstName(rs.getString("memberFirstName"));
					memberVO.setMemberLastName(rs.getString("memberLastName"));
					memberVO.setMemberBirthday(rs.getDate("memberBirthday"));
					memberVO.setMemberPhone(rs.getString("memberPhone"));
					memberVO.setMemberMail(rs.getString("memberMail"));
					memberVO.setMemberImgUrl(rs.getString("memberImgUrl"));
					memberVO.setMemberPoint(rs.getDouble("memberPoint"));
					memberVO.setMemberFBId(rs.getString("memberFBId"));
					memberVO.setMember2StepVerify(rs.getBoolean("member2StepVerify"));
					memberVO.setMemberSecretKey(rs.getString("memberSecretKey"));

				}
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
		return memberVO;
	}

	@Override
	public int updatePasswordByMail(String memberMail)
	{
		// TODO Auto-generated method stub
		return 0;
	}

	public int updatePasswordByPrimaryKey(String memberId)
	{
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MemberVO updateMemberInfo(String memberId, String memberMail, String memberPhone)
	{
		MemberVO memberVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try
		{
			Class.forName(driver);

			con = DriverManager.getConnection(url, userid, passwd);

			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, memberPhone);
			pstmt.setString(1, memberMail);
			pstmt.setString(3, memberId);

			if (pstmt.executeUpdate() == 1)
			{
				pstmt.close();
				pstmt = con.prepareStatement(GET_ONE_STMT);
				pstmt.setString(1, memberId);

				rs = pstmt.executeQuery();

				while (rs.next())
				{

					memberVO = new MemberVO();
					memberVO.setMemberId(rs.getString("memberId"));
					memberVO.setMemberFirstName(rs.getString("memberFirstName"));
					memberVO.setMemberLastName(rs.getString("memberLastName"));
					memberVO.setMemberBirthday(rs.getDate("memberBirthday"));
					memberVO.setMemberPhone(rs.getString("memberPhone"));
					memberVO.setMemberMail(rs.getString("memberMail"));
					memberVO.setMemberImgUrl(rs.getString("memberImgUrl"));
					memberVO.setMemberPoint(rs.getDouble("memberPoint"));
					memberVO.setMemberFBId(rs.getString("memberFBId"));
					memberVO.setMember2StepVerify(rs.getBoolean("member2StepVerify"));
					memberVO.setMemberSecretKey(rs.getString("memberSecretKey"));

				}
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
		return memberVO;
	}

	@Override
	public MemberVO updateMemberImg(String memberId, String memberImgUrl)
	{
		MemberVO memberVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try
		{
			Class.forName(driver);

			con = DriverManager.getConnection(url, userid, passwd);

			pstmt = con.prepareStatement(UPDATE_POINT);

			pstmt.setString(1, memberImgUrl);
			pstmt.setString(2, memberId);

			if (pstmt.executeUpdate() == 1)
			{
				pstmt.close();
				pstmt = con.prepareStatement(GET_ONE_STMT);
				pstmt.setString(1, memberId);

				rs = pstmt.executeQuery();

				while (rs.next())
				{

					memberVO = new MemberVO();
					memberVO.setMemberId(rs.getString("memberId"));
					memberVO.setMemberFirstName(rs.getString("memberFirstName"));
					memberVO.setMemberLastName(rs.getString("memberLastName"));
					memberVO.setMemberBirthday(rs.getDate("memberBirthday"));
					memberVO.setMemberPhone(rs.getString("memberPhone"));
					memberVO.setMemberMail(rs.getString("memberMail"));
					memberVO.setMemberImgUrl(rs.getString("memberImgUrl"));
					memberVO.setMemberPoint(rs.getDouble("memberPoint"));
					memberVO.setMemberFBId(rs.getString("memberFBId"));
					memberVO.setMember2StepVerify(rs.getBoolean("member2StepVerify"));
					memberVO.setMemberSecretKey(rs.getString("memberSecretKey"));

				}
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
		return memberVO;
	}

	public static void main(String[] args)
	{

		MemberDAO memberDAO = new MemberDAO();

		MemberVO member = memberDAO.updatePointByPrimaryKey("AA7FCD89-AD6B-40DC-89D1-AA9AAC345210", 5000.0);
		System.out.println(member.getMemberPoint());
	}

}
