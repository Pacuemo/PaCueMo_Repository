package _9_11_teammember_model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import _00_initial_service.GlobalService;

public class TeamMemberDAO implements TeamMemberDAO_interface {

	private static final String INSERT = "INSERT INTO TeamMember (teamId,teamMemberId) VALUES (?, ?)";
	private static final String GET_ALL = "SELECT teamId,teamMemberId,joinDate FROM TeamMember order by teamMemberId";
	private static final String GET_ONE_TEAMS = "SELECT teamId,teamMemberId,joinDate FROM TeamMember where teamId = ?";
	private static final String GET_ONE = "SELECT teamId,teamMemberId,joinDate FROM TeamMember where teamMemberId = ?";
	private static final String DELETE = "DELETE FROM TeamMember WHERE teamId = ? AND teamMemberId = ?";
	private static final String UPDATE = "UPDATE TeamMember set teamMemberId=?, joinDate=? where teamId = ?";

	public static void main(String[] args) {
		// TeamMemberVO teamMemberVO = new TeamMemberVO();
		// teamMemberVO.setTeamId(6);
		// teamMemberVO.setTeamMemberId(9);
		// teamMemberVO.setIsCaptain(false);
		// new TeamMemberDAO().insert(teamMemberVO);

	}

	@Override
	public void insert(TeamMemberVO teamMemberVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(GlobalService.DRIVER_NAME);
			con = DriverManager.getConnection(GlobalService.DB_URL, GlobalService.USERID, GlobalService.PASSWORD);
			pstmt = con.prepareStatement(INSERT);

			pstmt.setInt(1, teamMemberVO.getTeamId());
			pstmt.setString(2, teamMemberVO.getTeamMemberId());

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public void update(TeamMemberVO teamMemberVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(GlobalService.DRIVER_NAME);
			con = DriverManager.getConnection(GlobalService.DB_URL, GlobalService.USERID, GlobalService.PASSWORD);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, teamMemberVO.getTeamMemberId());
			pstmt.setDate(2, teamMemberVO.getJoinDate());
			pstmt.setInt(3, teamMemberVO.getTeamId());

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public void delete(Integer teamId, String teamMemberId) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(GlobalService.DRIVER_NAME);
			con = DriverManager.getConnection(GlobalService.DB_URL, GlobalService.USERID, GlobalService.PASSWORD);

			pstmt = con.prepareStatement(DELETE);
			pstmt.setInt(1, teamId);
			pstmt.setString(1, teamMemberId);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public TeamMemberVO findByPrimaryKey(Integer teamId, String teamMemberId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		TeamMemberVO teamMemberVO = null;

		try {
			Class.forName(GlobalService.DRIVER_NAME);
			con = DriverManager.getConnection(GlobalService.DB_URL, GlobalService.USERID, GlobalService.PASSWORD);
			pstmt = con.prepareStatement(GET_ONE);
			pstmt.setInt(1, teamId);
			pstmt.setString(2, teamMemberId);
			rs = pstmt.executeQuery();
			teamMemberVO = new TeamMemberVO();
			while (rs.next()) {
				teamMemberVO.setTeamId(rs.getInt("teamId"));
				teamMemberVO.setTeamMemberId(rs.getString("teamMemberId"));
				teamMemberVO.setJoinDate(rs.getDate("joinDate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return teamMemberVO;
	}

	@Override
	public List<TeamMemberVO> getOneTeam(Integer teamId) {
		List<TeamMemberVO> list = new ArrayList<TeamMemberVO>();
		TeamMemberVO teamMemberVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(GlobalService.DRIVER_NAME);
			con = DriverManager.getConnection(GlobalService.DB_URL, GlobalService.USERID, GlobalService.PASSWORD);
			pstmt = con.prepareStatement(GET_ONE_TEAMS);
			pstmt.setInt(1, teamId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				teamMemberVO = new TeamMemberVO();
				teamMemberVO.setTeamId(rs.getInt("teamId"));
				teamMemberVO.setTeamMemberId(rs.getString("teamMemberId"));
				teamMemberVO.setJoinDate(rs.getDate("joinDate"));
				list.add(teamMemberVO);
			}
		} catch (SQLException e) {
			throw new RuntimeException("A database error occured. " + e.getMessage());
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}

	@Override
	public List<TeamMemberVO> getAll() {
		List<TeamMemberVO> list = new ArrayList<TeamMemberVO>();
		TeamMemberVO teamMemberVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(GlobalService.DRIVER_NAME);
			con = DriverManager.getConnection(GlobalService.DB_URL, GlobalService.USERID, GlobalService.PASSWORD);
			pstmt = con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				teamMemberVO = new TeamMemberVO();
				teamMemberVO.setTeamId(rs.getInt("teamId"));
				teamMemberVO.setTeamMemberId(rs.getString("teamMemberId"));
				teamMemberVO.setJoinDate(rs.getDate("joinDate"));
				list.add(teamMemberVO);
			}
		} catch (SQLException e) {
			throw new RuntimeException("A database error occured. " + e.getMessage());
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}

}
