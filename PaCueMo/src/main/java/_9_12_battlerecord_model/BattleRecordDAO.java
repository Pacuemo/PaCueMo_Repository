package _9_12_battlerecord_model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import _00_initial_service.GlobalService;

public class BattleRecordDAO implements BattleRecordDAO_interface {

	private static final String INSERT = "INSERT INTO BattleRecord (teamIdA,teamIdB,courtId,battleMode,battleBet,battleDateTime) "
			+ "VALUES (?, ?, ?, ?, ?, ?)";
	private static final String UPDATE = "UPDATE BattleRecord set teamIdA=?, teamIdB=?, battleStatus=?, courtId=?, battleMode=?, "
			+ "battleBet=?, battleDateTime=?, result=?, reportA=?, reportB=? where battleId = ?";
	private static final String REPORT_A = "UPDATE BattleRecord set reportA=? where battleId = ? and teamIdA = ?";
	private static final String REPORT_B = "UPDATE BattleRecord set reportB=? where battleId = ? and teamIdB = ?";
	private static final String UPDATE_RESULT = "UPDATE BattleRecord set result=? where battleId = ?";
	private static final String GET_ALL = "SELECT battleId,teamIdA,createDate,teamProp,avgRank FROM Team order by teamId";
	private static final String GET_ONE = "SELECT teamId,teamName,createDate,teamProp,avgRank FROM Team where teamId = ?";
	private static final String DELETE_TEAM = "DELETE FROM Team where teamId = ?";
	private static final String DELETE_TEAM_MEMBERS = "DELETE FROM TeamMember where teamId = ?";
	private static final String GET_TEAM_MEMBERS = "SELECT teamId,teamMemberId,joinDate,isCaptain FROM TeamMember where teamId = ? order by teamMemberId";

	private static final String SELECT_TEAM_MEMBERS_POINT = "SELECT m.[memberId],m.[memberFirstName],m.[memberLastName],[memberPoint],tm.teamId"
			+ "FROM dbo.Member m JOIN (SELECT [teamId],[teamMemberId] FROM dbo.TeamMember )tm"
			+ "ON m.memberId = tm.teamMemberId" + "WHERE tm.teamId = 1";

	@Override
	public void insert(BattleRecordVO battleRecordVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(GlobalService.DRIVER_NAME);
			con = DriverManager.getConnection(GlobalService.DB_URL, GlobalService.USERID, GlobalService.PASSWORD);
			pstmt = con.prepareStatement(INSERT);

			pstmt.setInt(1, battleRecordVO.getTeamIdA());
			pstmt.setInt(2, battleRecordVO.getTeamIdB());
			pstmt.setInt(3, battleRecordVO.getCourtId());
			pstmt.setInt(4, battleRecordVO.getBattleMode());
			pstmt.setDouble(5, battleRecordVO.getBattleBet());
			pstmt.setTimestamp(6, battleRecordVO.getBattleDateTime());

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
	public void update(BattleRecordVO battleRecordVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(GlobalService.DRIVER_NAME);
			con = DriverManager.getConnection(GlobalService.DB_URL, GlobalService.USERID, GlobalService.PASSWORD);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, battleRecordVO.getTeamIdA());
			pstmt.setInt(2, battleRecordVO.getTeamIdB());
			pstmt.setBoolean(3, battleRecordVO.getBattleStatus());
			pstmt.setInt(4, battleRecordVO.getCourtId());
			pstmt.setInt(5, battleRecordVO.getBattleMode());
			pstmt.setDouble(6, battleRecordVO.getBattleBet());
			pstmt.setTimestamp(7, battleRecordVO.getBattleDateTime());
			pstmt.setInt(8, battleRecordVO.getResult());
			pstmt.setInt(9, battleRecordVO.getReportA());
			pstmt.setInt(10, battleRecordVO.getReportB());
			pstmt.setInt(11, battleRecordVO.getBattleId());

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

	public void reportA(BattleRecordVO battleRecordVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(GlobalService.DRIVER_NAME);
			con = DriverManager.getConnection(GlobalService.DB_URL, GlobalService.USERID, GlobalService.PASSWORD);
			pstmt = con.prepareStatement(REPORT_A);
			pstmt.setInt(1, battleRecordVO.getReportA());
			pstmt.setInt(2, battleRecordVO.getBattleId());
			pstmt.setInt(3, battleRecordVO.getTeamIdA());

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

	public void reportB(BattleRecordVO battleRecordVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(GlobalService.DRIVER_NAME);
			con = DriverManager.getConnection(GlobalService.DB_URL, GlobalService.USERID, GlobalService.PASSWORD);
			pstmt = con.prepareStatement(REPORT_B);
			pstmt.setInt(1, battleRecordVO.getReportB());
			pstmt.setInt(2, battleRecordVO.getBattleId());
			pstmt.setInt(3, battleRecordVO.getTeamIdB());

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

	public void updateResult(Integer battleId, Integer result) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(GlobalService.DRIVER_NAME);
			con = DriverManager.getConnection(GlobalService.DB_URL, GlobalService.USERID, GlobalService.PASSWORD);
			pstmt = con.prepareStatement(UPDATE_RESULT);
			pstmt.setInt(1, result);
			pstmt.setInt(2, battleId);

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
	public void delete(Integer batteleRecordId) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = DriverManager.getConnection(GlobalService.DB_URL, GlobalService.USERID, GlobalService.PASSWORD);
			pstmt = con.prepareStatement(DELETE_TEAM);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public BattleRecordVO findByPrimaryKey(Integer battleId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		return null;
	}

	@Override
	public BattleRecordVO findByTeamIdA(Integer teamIdA) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BattleRecordVO findByTeamIdB(Integer teamIdB) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BattleRecordVO> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	public static void main(String arg[]) {
		BattleRecordVO battleRecordVO = new BattleRecordVO();
		battleRecordVO.setTeamIdA(1);
		battleRecordVO.setTeamIdB(2);
		battleRecordVO.setBattleStatus(true);
		battleRecordVO.setCourtId(1);
		battleRecordVO.setBattleMode(3);
		battleRecordVO.setBattleBet((double) 0);
		battleRecordVO.setBattleDateTime(new Timestamp(System.currentTimeMillis()));

		BattleRecordDAO dao = new BattleRecordDAO();
		dao.insert(battleRecordVO);
	}

}
