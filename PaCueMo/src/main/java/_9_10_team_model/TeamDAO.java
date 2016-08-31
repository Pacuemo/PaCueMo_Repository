package _9_10_team_model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import _00_initial_service.GlobalService;
import _9_11_teammember_model.TeamMemberVO;

public class TeamDAO implements TeamDAO_interface
{

	private static final String INSERT = "INSERT INTO Team (teamName,createDate,teamProp,avgRank,content) VALUES (?, ?, ?, ?)";
	private static final String GET_ALL = "SELECT teamId,teamName,createDate,teamProp,avgRank,content FROM Team order by teamId";
	private static final String GET_ONE = "SELECT teamId,teamName,createDate,teamProp,avgRank,content FROM Team where teamId = ?";
	private static final String DELETE_TEAM = "DELETE FROM Team where teamId = ?";
	private static final String DELETE_TEAM_MEMBERS = "DELETE FROM TeamMember where teamId = ?";
	private static final String UPDATE = "UPDATE Team set teamName=?, createDate=?, teamProp=?, avgRank=?, content=? where teamId = ?";
	private static final String GET_TEAM_MEMBERS = "SELECT teamId,teamMemberId,joinDate,isCaptain FROM TeamMember where teamId = ?";

	@Override
	public void insert(TeamVO teamVO)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		try
		{
			Class.forName(GlobalService.DRIVER_NAME);
			con = DriverManager.getConnection(GlobalService.DB_URL, GlobalService.USERID, GlobalService.PASSWORD);
			pstmt = con.prepareStatement(INSERT);

			pstmt.setString(1, teamVO.getTeamName());
			pstmt.setDate(2, teamVO.getCreateDate());
			pstmt.setInt(3, teamVO.getTeamProp());
			pstmt.setDouble(4, teamVO.getAvgRank());
			pstmt.setString(5, teamVO.getContent());

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

	@Override
	public void update(TeamVO teamVO)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		try
		{
			Class.forName(GlobalService.DRIVER_NAME);
			con = DriverManager.getConnection(GlobalService.DB_URL, GlobalService.USERID, GlobalService.PASSWORD);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, teamVO.getTeamName());
			pstmt.setDate(2, teamVO.getCreateDate());
			pstmt.setInt(3, teamVO.getTeamProp());
			pstmt.setDouble(4, teamVO.getAvgRank());
			pstmt.setString(5, teamVO.getContent());
			pstmt.setInt(6, teamVO.getTeamId());

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

	@SuppressWarnings("resource")
	@Override
	public void delete(Integer teamId)
	{

		Connection con = null;
		PreparedStatement pstmt = null;

		try
		{
			Class.forName(GlobalService.DRIVER_NAME);
			con = DriverManager.getConnection(GlobalService.DB_URL, GlobalService.USERID, GlobalService.PASSWORD);

			con.setAutoCommit(false);
			// 先刪除TeamMember
			pstmt = con.prepareStatement(DELETE_TEAM_MEMBERS);
			pstmt.setInt(1, teamId);
			pstmt.executeUpdate();
			// 再刪除 Team
			pstmt = con.prepareStatement(DELETE_TEAM);
			pstmt.setInt(1, teamId);
			pstmt.executeUpdate();

			con.commit();
			con.setAutoCommit(true);
		}
		catch (SQLException e)
		{
			if (con != null)
			{
				try
				{
					con.rollback();
				}
				catch (SQLException excep)
				{
					throw new RuntimeException("rollback error occured. " + excep.getMessage());
				}
			}
			throw new RuntimeException("A database error occured. " + e.getMessage());
		}
		catch (ClassNotFoundException e)
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
	public TeamVO findByPrimaryKey(Integer teamId)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		TeamVO teamVO = null;

		try
		{
			Class.forName(GlobalService.DRIVER_NAME);
			con = DriverManager.getConnection(GlobalService.DB_URL, GlobalService.USERID, GlobalService.PASSWORD);
			pstmt = con.prepareStatement(GET_ONE);
			pstmt.setInt(1, teamId);

			rs = pstmt.executeQuery();
			teamVO = new TeamVO();
			while (rs.next())
			{
				teamVO.setTeamId(rs.getInt("teamId"));
				teamVO.setTeamName(rs.getString("teamName"));
				teamVO.setCreateDate(rs.getDate("createDate"));
				teamVO.setTeamProp(rs.getInt("teamProp"));
				teamVO.setAvgRank(rs.getDouble("avgRank"));
				teamVO.setContent(rs.getString("content"));
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		catch (ClassNotFoundException e)
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
		return teamVO;
	}

	@Override
	public List<TeamVO> getAll()
	{
		List<TeamVO> list = new ArrayList<TeamVO>();
		TeamVO teamVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try
		{
			Class.forName(GlobalService.DRIVER_NAME);
			con = DriverManager.getConnection(GlobalService.DB_URL, GlobalService.USERID, GlobalService.PASSWORD);
			pstmt = con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();

			while (rs.next())
			{
				teamVO = new TeamVO();
				teamVO.setTeamId(rs.getInt("teamId"));
				teamVO.setTeamName(rs.getString("teamName"));
				teamVO.setCreateDate(rs.getDate("createDate"));
				teamVO.setTeamProp(rs.getInt("teamProp"));
				teamVO.setAvgRank(rs.getDouble("avgRank"));
				teamVO.setContent(rs.getString("content"));
				list.add(teamVO);
			}
		}
		catch (SQLException se)
		{
			throw new RuntimeException("A database error occured. " + se.getMessage());
		}
		catch (ClassNotFoundException e)
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

	@Override
	public Set<TeamMemberVO> getMemsByTeamId(Integer teamId)
	{
		Set<TeamMemberVO> set = new LinkedHashSet<TeamMemberVO>();
		TeamMemberVO teamMemVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try
		{
			Class.forName(GlobalService.DRIVER_NAME);
			con = DriverManager.getConnection(GlobalService.DB_URL, GlobalService.USERID, GlobalService.PASSWORD);
			pstmt = con.prepareStatement(GET_TEAM_MEMBERS);
			pstmt.setInt(1, teamId);
			rs = pstmt.executeQuery();

			while (rs.next())
			{
				teamMemVO = new TeamMemberVO();
				teamMemVO.setTeamId(rs.getInt("teamId"));
				teamMemVO.setTeamMemberId(rs.getInt("teamMemberId"));
				teamMemVO.setJoinDate(rs.getDate("joinDate"));
				teamMemVO.setIsCaptain(rs.getBoolean("isCaptain"));
				set.add(teamMemVO);
			}
		}
		catch (SQLException e)
		{
			throw new RuntimeException("A database error occured. " + e.getMessage());
		}
		catch (ClassNotFoundException e)
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
		return set;
	}

}
