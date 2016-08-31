package _9_41_member_model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import _00_initial_Servise.GlobalService;

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

	private static final String INSERT_STMT = "INSERT dbo.Member( memberFirstName ,memberLastName ,memberPassword ,memberBirthday ,memberPhone ,memberMail,"
			+ "memberFileName ,memberPoint ,memberHaveCard ,memberFBId ,memberType ,memberRgDateTime, memberMailStatus, memberOutDate ,memberValidateCode ,"
			+ "memberSecretKey) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )";
	private static final String GET_ALL_STMT = "SELECT * FROM dbo.Member ORDER BY memberId";
	private static final String GET_ONE_STMT = "SELECT * FROM dbo.Member WHERE memberId = ?";
	private static final String GET_ONE_STMT_BY_MAIL = "SELECT * FROM dbo.Member WHERE memberMail = ?";
	private static final String GET_ONE_STMT_BY_FBID = "SELECT * FROM emp2 WHERE memberFBId = ?";
	private static final String UPDATE = "UPDATE dbo.Member SET memberFirstName = ?, memberLastName = ?, memberPassword = ?,"
			+ " memberBirthday = ?, memberPhone = ?, memberMail = ?, memberFileName = ? WHERE memberId = ?";

	@Override
	public void insert(MemberVO memberVO)
	{

	}

	@Override
	public void update(MemberVO memberVO)
	{
		// TODO Auto-generated method stub

	}

	@Override
	public MemberVO findByPrimaryKey(Integer memberId)
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

			pstmt.setInt(1, memberId);

			rs = pstmt.executeQuery();

			while (rs.next())
			{

				memberVO = new MemberVO();
				memberVO.setMemberId(rs.getInt("memberId"));
				memberVO.setMemberPassword(rs.getString("memberPassword"));
				memberVO.setMemberFirstName(rs.getString("memberFirstName"));
				memberVO.setMemberLastName(rs.getString("memberLastName"));
				memberVO.setMemberBirthday(rs.getDate("memberBirthday"));
				memberVO.setMemberPhone(rs.getString("memberPhone"));
				memberVO.setMemberMail(rs.getString("memberMail"));
				memberVO.setMemberFileName(rs.getString("memberImgUrl"));
				memberVO.setMemberPoint(rs.getDouble("memberPoint"));
				memberVO.setMemberFBId(rs.getString("memberFBId"));

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
				memberVO.setMemberId(rs.getInt("memberId"));
				memberVO.setMemberPassword(rs.getString("memberPassword"));
				memberVO.setMemberFirstName(rs.getString("memberFirstName"));
				memberVO.setMemberLastName(rs.getString("memberLastName"));
				memberVO.setMemberBirthday(rs.getDate("memberBirthday"));
				memberVO.setMemberPhone(rs.getString("memberPhone"));
				memberVO.setMemberMail(rs.getString("memberMail"));
				memberVO.setMemberFileName(rs.getString("memberImgUrl"));
				memberVO.setMemberPoint(rs.getDouble("memberPoint"));
				memberVO.setMemberFBId(rs.getString("memberFBId"));
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
	public MemberVO findByUserFBID(Integer memberFBId)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MemberVO> getAll()
	{
		// TODO Auto-generated method stub
		return null;
	}

	public static void main(String[] args)
	{
		MemberDAO memberDAO = new MemberDAO();

		MemberVO member = memberDAO.findByUserMail("yahkct263238@hotmail.com");
		System.out.println(member.getMemberMail());

	}

}
