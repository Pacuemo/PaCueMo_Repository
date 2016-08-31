package teammember_model;

import java.sql.*;
import java.util.*;

import _00_initial_servise.GlobalService;
import teammember_model.TeamMemberVO;

public class TeamMemberDAO implements TeamMemberDAO_interface {

	private static final String INSERT = "INSERT INTO TeamMember (teamId,teamMemberId,joinDate,isCaptain) VALUES (?, ?, ?, ?)";
	private static final String GET_ALL = "SELECT teamId,teamMemberId,joinDate,isCaptain FROM TeamMember order by teamMemberId";
	private static final String GET_ONE = "SELECT teamId,teamMemberId,joinDate,isCaptain FROM TeamMember where teamMemberId = ?";
	private static final String DELETE = "DELETE FROM TeamMember where teamMemberId = ?";
	private static final String UPDATE = "UPDATE TeamMember set teamMemberId=?, joinDate=?, isCaptain=? where teamId = ?";

	@Override
	public void insert(TeamMemberVO teamMemberVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(GlobalService.DRIVER_NAME);
			con = DriverManager.getConnection(GlobalService.DB_URL, GlobalService.USERID, GlobalService.PASSWORD);
			pstmt = con.prepareStatement(INSERT);
			
			pstmt.setInt(1, teamMemberVO.getTeamId());
			pstmt.setInt(2, teamMemberVO.getTeamMemberId());
			pstmt.setDate(3, teamMemberVO.getJoinDate());
			pstmt.setBoolean(4, teamMemberVO.getIsCaptain());

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
			
			pstmt.setInt(1, teamMemberVO.getTeamMemberId());
			pstmt.setDate(2, teamMemberVO.getJoinDate());
			pstmt.setBoolean(3, teamMemberVO.getIsCaptain());
			pstmt.setInt(4, teamMemberVO.getTeamId());

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
	public void delete(Integer teamMemberId) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(GlobalService.DRIVER_NAME);
			con = DriverManager.getConnection(GlobalService.DB_URL, GlobalService.USERID, GlobalService.PASSWORD);

			pstmt = con.prepareStatement(DELETE);
			pstmt.setInt(1, teamMemberId);
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
	public TeamMemberVO findByPrimaryKey(Integer teamMemberId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		TeamMemberVO teamMemberVO = null;

		try {
			Class.forName(GlobalService.DRIVER_NAME);
			con = DriverManager.getConnection(GlobalService.DB_URL, GlobalService.USERID, GlobalService.PASSWORD);
			pstmt = con.prepareStatement(GET_ONE);
			pstmt.setInt(1, teamMemberId);

			rs = pstmt.executeQuery();
			teamMemberVO = new TeamMemberVO();
			while (rs.next()) {
				teamMemberVO.setTeamId(rs.getInt("teamId"));
				teamMemberVO.setTeamMemberId(rs.getInt("teamMemberId"));
				teamMemberVO.setJoinDate(rs.getDate("joinDate"));
				teamMemberVO.setIsCaptain(rs.getBoolean("isCaptain"));
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
				teamMemberVO.setTeamMemberId(rs.getInt("teamMemberId"));
				teamMemberVO.setJoinDate(rs.getDate("joinDate"));
				teamMemberVO.setIsCaptain(rs.getBoolean("isCaptain"));
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
