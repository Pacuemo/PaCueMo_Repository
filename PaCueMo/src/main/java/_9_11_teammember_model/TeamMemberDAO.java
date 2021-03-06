package _9_11_teammember_model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository("TeamMemberDAO")
public class TeamMemberDAO implements TeamMemberDAO_interface
{
	@Autowired
	private DataSource dataSource;
	private JdbcOperations jdbc;

	public TeamMemberDAO()
	{
	}

	public TeamMemberDAO(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}

	@Autowired
	public TeamMemberDAO(JdbcOperations jdbcOperations)
	{
		this.jdbc = jdbcOperations;
	}

	private static final String INSERT = "INSERT INTO TeamMember (teamId,teamMemberId) VALUES (?, ?)";
	private static final String GET_ALL = "SELECT teamId,teamMemberId,joinDate FROM TeamMember order by teamMemberId";
	private static final String GET_ONE_TEAMS = "SELECT teamId,teamMemberId,joinDate FROM TeamMember where teamId = ?";
	private static final String GET_ONE = "SELECT teamId,teamMemberId,joinDate FROM TeamMember where teamMemberId = ?";
	private static final String DELETE_ONE = "DELETE FROM TeamMember WHERE teamId = ? AND teamMemberId = ?";
	private static final String DELETE_ALL = "DELETE FROM TeamMember WHERE teamId = ?";
	private static final String UPDATE = "UPDATE TeamMember set teamMemberId=?, joinDate=? where teamId = ?";
	private static final String FIND_BY_TEAMMEMBERID = "SELECT * FROM TeamMember WHERE teamMemberId = ?";

	public static void main(String[] args)
	{
		TeamMemberVO teamMemberVO = new TeamMemberVO();
		teamMemberVO.setTeamId(1);
		teamMemberVO.setTeamMemberId("5D364BF9-CA21-4788-96EF-C1CF92F630B6");
		new TeamMemberDAO().insert(teamMemberVO);

	}

	/*
	 * (non-Javadoc)
	 * @see _9_11_teammember_model.TeamMemberDAO_interface2#insert(java.lang.Integer, java.lang.String)
	 */
	@Override
	public void insert(Integer teamId, String teamMemberId)
	{
		jdbc.update(INSERT, teamId, teamMemberId);
	}

	/*
	 * (non-Javadoc)
	 * @see _9_11_teammember_model.TeamMemberDAO_interface2#insert(_9_11_teammember_model.TeamMemberVO)
	 */
	@Override
	public void insert(TeamMemberVO teamMemberVO)
	{
		Connection con = null;
		PreparedStatement pstmt = null;

		try
		{
//			Class.forName(GlobalService.DRIVER_NAME);
//			con = DriverManager.getConnection(GlobalService.DB_URL, GlobalService.USERID, GlobalService.PASSWORD);

			con = dataSource.getConnection();

			pstmt = con.prepareStatement(INSERT);

			pstmt.setInt(1, teamMemberVO.getTeamId());
			pstmt.setString(2, teamMemberVO.getTeamMemberId());

			pstmt.executeUpdate();
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
					e.printStackTrace(System.err);
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

	/*
	 * (non-Javadoc)
	 * @see _9_11_teammember_model.TeamMemberDAO_interface2#update(_9_11_teammember_model.TeamMemberVO)
	 */
	@Override
	public void update(TeamMemberVO teamMemberVO)
	{
		Connection con = null;
		PreparedStatement pstmt = null;

		try
		{
//			Class.forName(GlobalService.DRIVER_NAME);
//			con = DriverManager.getConnection(GlobalService.DB_URL, GlobalService.USERID, GlobalService.PASSWORD);

			con = dataSource.getConnection();

			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, teamMemberVO.getTeamMemberId());
			pstmt.setDate(2, teamMemberVO.getJoinDate());
			pstmt.setInt(3, teamMemberVO.getTeamId());

			pstmt.executeUpdate();
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
					e.printStackTrace(System.err);
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

	/*
	 * (non-Javadoc)
	 * @see _9_11_teammember_model.TeamMemberDAO_interface2#delete(java.lang.Integer, java.lang.String)
	 */
	@Override
	public void deleteOne(Integer teamId, String teamMemberId)
	{
		Connection con = null;
		PreparedStatement pstmt = null;

		try
		{
//			Class.forName(GlobalService.DRIVER_NAME);
//			con = DriverManager.getConnection(GlobalService.DB_URL, GlobalService.USERID, GlobalService.PASSWORD);

			con = dataSource.getConnection();

			pstmt = con.prepareStatement(DELETE_ONE);
			pstmt.setInt(1, teamId);
			pstmt.setString(2, teamMemberId);
			pstmt.executeUpdate();
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
					e.printStackTrace(System.err);
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
	public void deleteAll(Integer teamId)
	{
		jdbc.update(DELETE_ALL, teamId);
	}

	/*
	 * (non-Javadoc)
	 * @see _9_11_teammember_model.TeamMemberDAO_interface2#findByPrimaryKey(java.lang.Integer, java.lang.String)
	 */
	@Override
	public TeamMemberVO findByPrimaryKey(Integer teamId, String teamMemberId)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		TeamMemberVO teamMemberVO = null;

		try
		{
//			Class.forName(GlobalService.DRIVER_NAME);
//			con = DriverManager.getConnection(GlobalService.DB_URL, GlobalService.USERID, GlobalService.PASSWORD);
			con = dataSource.getConnection();

			pstmt = con.prepareStatement(GET_ONE);
			pstmt.setInt(1, teamId);
			pstmt.setString(2, teamMemberId);
			rs = pstmt.executeQuery();
			teamMemberVO = new TeamMemberVO();
			while (rs.next())
			{
				teamMemberVO.setTeamId(rs.getInt("teamId"));
				teamMemberVO.setTeamMemberId(rs.getString("teamMemberId"));
				teamMemberVO.setJoinDate(rs.getDate("joinDate"));
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			if (rs != null)
			{
				try
				{
					rs.close();
				}
				catch (SQLException e)
				{
					e.printStackTrace();
				}
			}
			if (pstmt != null)
			{
				try
				{
					pstmt.close();
				}
				catch (SQLException e)
				{
					e.printStackTrace(System.err);
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
		return teamMemberVO;
	}

	/*
	 * (non-Javadoc)
	 * @see _9_11_teammember_model.TeamMemberDAO_interface2#getOneTeam(java.lang.Integer)
	 */
	@Override
	public List<TeamMemberVO> getOneTeam(Integer teamId)
	{
		return jdbc.query(GET_ONE_TEAMS, new TeamMemberRowMapper(), teamId);
	}

	/*
	 * (non-Javadoc)
	 * @see _9_11_teammember_model.TeamMemberDAO_interface2#getAll()
	 */
	@Override
	public List<TeamMemberVO> getAll()
	{
		List<TeamMemberVO> list = new ArrayList<TeamMemberVO>();
		TeamMemberVO teamMemberVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try
		{
//			Class.forName(GlobalService.DRIVER_NAME);
//			con = DriverManager.getConnection(GlobalService.DB_URL, GlobalService.USERID, GlobalService.PASSWORD);
			con = dataSource.getConnection();

			pstmt = con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();

			while (rs.next())
			{
				teamMemberVO = new TeamMemberVO();
				teamMemberVO.setTeamId(rs.getInt("teamId"));
				teamMemberVO.setTeamMemberId(rs.getString("teamMemberId"));
				teamMemberVO.setJoinDate(rs.getDate("joinDate"));
				list.add(teamMemberVO);
			}
		}
		catch (SQLException e)
		{
			throw new RuntimeException("A database error occured. " + e.getMessage());
		}
		finally
		{
			if (rs != null)
			{
				try
				{
					rs.close();
				}
				catch (SQLException e)
				{
					e.printStackTrace(System.err);
				}
			}
			if (pstmt != null)
			{
				try
				{
					pstmt.close();
				}
				catch (SQLException e)
				{
					e.printStackTrace(System.err);
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

	@Override
	public List<TeamMemberVO> findByTeamMemberId(String TeamMemberId)
	{
		return jdbc.query(FIND_BY_TEAMMEMBERID, new TeamMemberRowMapper(), TeamMemberId);
	}

	private static final class TeamMemberRowMapper implements RowMapper<TeamMemberVO>
	{

		@Override
		public TeamMemberVO mapRow(ResultSet rs, int rowNum) throws SQLException
		{
			return new TeamMemberVO(rs.getInt("teamId"), rs.getString("teamMemberId"), rs.getDate("joinDate"));
		}

	}

}
