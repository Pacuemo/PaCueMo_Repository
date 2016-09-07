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

	private static final String INSERT = "INSERT INTO Team (teamName,teamProp,teamHead) VALUES (?, ?, ?)";
	private static final String INSERT_TeamMember_LEADER = "INSERT INTO TeamMember (teamId,teamMemberId) VALUES (?, ?)";
	private static final String FIND_TEAMID = "SELECT teamId FROM Team where teamHead = ?";
	private static final String GET_ALL = "SELECT teamId,teamName,createDate,teamProp,avgRank,teamHead,content FROM Team order by teamId";
	private static final String GET_ONE = "SELECT teamId,teamName,createDate,teamProp,avgRank,teamHead,content FROM Team where teamId = ?";
	private static final String DELETE_TEAM = "DELETE FROM Team where teamId = ?";
	private static final String DELETE_TEAM_MEMBERS = "DELETE FROM TeamMember where teamId = ?";
	private static final String UPDATE = "UPDATE Team set teamName=?, createDate=?, teamProp=?, avgRank=?, teamHead=?, content=? where teamId = ?";
	private static final String GET_TEAM_MEMBERS = "SELECT teamId,teamMemberId,joinDate FROM TeamMember where teamId = ?";
	private static final String UPDATE_AVG = " UPDATE Team SET avgRank=? WHERE teamId=?";
	private static final String SELECT_TEAM_MEMBERS = "SELECT teamMemberId FROM TeamMember where teamId=?";
//	private static final String SELECT_ = "SELECT ranking FROM PlayerRecord where teamId=?"; PlayerRecordDAO 之後會有總平均? 拿來用就好

	public static void main(String[] args)
	{
		TeamVO teamVO = new TeamVO();
		teamVO.setTeamName("test91");
		teamVO.setTeamProp(2);
		teamVO.setTeamHead("9");
	}

	/*
	 * (non-Javadoc)
	 * @see _9_10_team_model.Test#insert(_9_10_team_model.TeamVO)
	 */
	// @Override
	// public void insert(TeamVO teamVO) {
	// Connection con = null;
	// PreparedStatement pstmt = null;
	// try {
	// Class.forName(GlobalService.DRIVER_NAME);
	// con = DriverManager.getConnection(GlobalService.DB_URL,
	// GlobalService.USERID, GlobalService.PASSWORD);
	// pstmt = con.prepareStatement(INSERT);
	//
	// pstmt.setString(1, teamVO.getTeamName());
	// pstmt.setInt(2, teamVO.getTeamProp());
	// pstmt.setInt(3, teamVO.getTeamHead());
	//
	// pstmt.executeUpdate();
	// } catch (Exception e) {
	// e.printStackTrace();
	// } finally {
	// if (pstmt != null) {
	// try {
	// pstmt.close();
	// } catch (SQLException e) {
	// e.printStackTrace(System.err);
	// }
	// }
	// if (con != null) {
	// try {
	// con.close();
	// } catch (Exception e) {
	// e.printStackTrace(System.err);
	// }
	// }
	// }
	// }

	/*
	 * (non-Javadoc)
	 * @see _9_10_team_model.Test#createTeam(_9_10_team_model.TeamVO,
	 * java.lang.Integer)
	 */
	@Override
	@SuppressWarnings("resource")
	public void createTeam(TeamVO teamVO) throws SQLException
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		try
		{
			Class.forName(GlobalService.DRIVER_NAME);
			con = DriverManager.getConnection(GlobalService.DB_URL, GlobalService.USERID, GlobalService.PASSWORD);

			con.setAutoCommit(false);
			// 先新增隊伍
			String memberId = teamVO.getTeamHead();
			pstmt = con.prepareStatement(INSERT);
			pstmt.setString(1, teamVO.getTeamName());
			pstmt.setInt(2, teamVO.getTeamProp());
			pstmt.setString(3, memberId);
			pstmt.executeUpdate();
			// 查詢隊伍Id
			pstmt = con.prepareStatement(FIND_TEAMID);
			pstmt.setString(1, memberId);
			ResultSet rs = pstmt.executeQuery();
			Integer teamId = null;
			if (rs.next())
			{
				teamId = rs.getInt("teamId");
			}
			// 再新增隊長
			pstmt = con.prepareStatement(INSERT_TeamMember_LEADER);
			pstmt.setInt(1, teamId);
			pstmt.setString(2, memberId);
		}
		catch (SQLException e)
		{
			e.printStackTrace();
			con.rollback();
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
					con.setAutoCommit(true);
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
	 * @see _9_10_team_model.Test#update(_9_10_team_model.TeamVO)
	 */
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
			pstmt.setString(5, teamVO.getTeamHead());
			pstmt.setString(6, teamVO.getContent());
			pstmt.setInt(7, teamVO.getTeamId());

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
	 * @see _9_10_team_model.Test#delete(java.lang.Integer)
	 */
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

	/*
	 * (non-Javadoc)
	 * @see _9_10_team_model.Test#findByPrimaryKey(java.lang.Integer)
	 */
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
				teamVO.setTeamHead(rs.getString("teamHead"));
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

	/*
	 * (non-Javadoc)
	 * @see _9_10_team_model.Test#getAll()
	 */
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
				teamVO.setTeamHead(rs.getString("teamHead"));
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

	/*
	 * (non-Javadoc)
	 * @see _9_10_team_model.Test#getMemsByTeamId(java.lang.Integer)
	 */
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
				teamMemVO.setTeamMemberId(rs.getString("teamMemberId"));
				teamMemVO.setJoinDate(rs.getDate("joinDate"));
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

	@SuppressWarnings("resource")
	public void updateAvg(Integer teamId)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		List<String> teamMemberIdList = new ArrayList<>();
		try
		{
			Class.forName(GlobalService.DRIVER_NAME);
			con = DriverManager.getConnection(GlobalService.DB_URL, GlobalService.USERID, GlobalService.PASSWORD);

			con.setAutoCommit(false);
			// 先查詢team所有成員
			pstmt = con.prepareStatement(SELECT_TEAM_MEMBERS);
			pstmt.setInt(1, teamId);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next())
			{
				teamMemberIdList.add(rs.getString("teamMemberId"));
			}
			// 再查出會員評分 等PlayerRecordDAO 出來取得總平均
			pstmt = con.prepareStatement(DELETE_TEAM);
			pstmt.setInt(1, teamId);
			pstmt.executeUpdate();

			Double avgRank = null; // 注入這裡
			// 把平均評分 update 到team table
			pstmt = con.prepareStatement(UPDATE_AVG);
			pstmt.setDouble(1, avgRank);
			pstmt.setInt(2, teamId);
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

}
