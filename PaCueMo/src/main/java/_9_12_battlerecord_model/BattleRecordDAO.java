package _9_12_battlerecord_model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository("BattleRecordDAO")
public class BattleRecordDAO implements BattleRecordDAO_I
{
	private JdbcOperations jdbc;

	public BattleRecordDAO()
	{
	}

	@Autowired
	public BattleRecordDAO(JdbcOperations jdbc)
	{
		this.jdbc = jdbc;
	}

	private static final String INSERT = "INSERT INTO BattleRecord (teamIdA,teamIdB,battleStatus,courtId,battleMode,battleBet,battleDateTime,"
			+ "result,reportA,reportB) VALUES (?, ?, 0, ?, ?, ?, ?, 0, 0, 0)";
	private static final String ACCEPT = "UPDATE BattleRecord set battleStatus=? where battleId = ?";
	private static final String REPORT_A = "UPDATE BattleRecord set reportA=? where battleId = ?";
	private static final String REPORT_B = "UPDATE BattleRecord set reportB=? where battleId = ?";
	private static final String UPDATE_RESULT = "UPDATE BattleRecord set result=? where battleId = ?";
	private static final String DELETE = "DELETE FROM BattleRecord where battleId = ?";
	private static final String GET_ONE = "SELECT * FROM BattleRecord where battleId = ?";
	private static final String FIND_BY_TEAM_A = "SELECT * FROM BattleRecord where teamIdA = ?";
	private static final String FIND_BY_TEAM_B = "SELECT * FROM BattleRecord where teamIdB = ?";
	private static final String GET_ALL = "SELECT * FROM BattleRecord";
	private static final String GET_ABSENCE_PERCENT = "SELECT 100*COUNT(*)/(SELECT COUNT(*) FROM BattleRecord WHERE "
			+ "(result != 0 and result != 6) AND (teamIdA = ? OR teamIdB =?)) FROM BattleRecord WHERE "
			+ "(teamIdA = ? AND result = 4) OR (teamIdB = ? AND result = 5)";
	private static final String GET_WPCT = "SELECT 100*COUNT(*)/(SELECT COUNT(*) FROM BattleRecord WHERE "
			+ "(result = 1 OR result = 2 OR result = 3) AND (teamIdA = ? OR teamIdB = ?)) FROM BattleRecord WHERE "
			+ "(teamIdA = ? AND result = 1) OR (teamIdB = ? AND result = 2)";

	/*
	 * (non-Javadoc)
	 * @see _9_12_battlerecord_model.BattleRecordDAO_I#add(_9_12_battlerecord_model.BattleRecordVO)
	 */
	@Override
	public void add(BattleRecordVO battleRecordVO)
	{
		jdbc.update(INSERT, battleRecordVO.getTeamIdA(), battleRecordVO.getTeamIdB(), battleRecordVO.getCourtId(),
				battleRecordVO.getBattleMode(), battleRecordVO.getBattleBet(), battleRecordVO.getBattleDateTime());
	}

	/*
	 * (non-Javadoc)
	 * @see _9_12_battlerecord_model.BattleRecordDAO_I#accept_Reject(java.lang.Integer, java.lang.Integer)
	 */
	@Override
	public void accept_Reject(Integer battleStatus, Integer battleId)
	{
		jdbc.update(ACCEPT, battleStatus, battleId);
	}

	/*
	 * (non-Javadoc)
	 * @see _9_12_battlerecord_model.BattleRecordDAO_I#reportA(_9_12_battlerecord_model.BattleRecordVO)
	 */
	@Override
	public void reportA(BattleRecordVO battleRecordVO)
	{
		jdbc.update(REPORT_A, battleRecordVO.getReportB(), battleRecordVO.getBattleId());
	}

	/*
	 * (non-Javadoc)
	 * @see _9_12_battlerecord_model.BattleRecordDAO_I#reportB(_9_12_battlerecord_model.BattleRecordVO)
	 */
	@Override
	public void reportB(BattleRecordVO battleRecordVO)
	{
		jdbc.update(REPORT_B, battleRecordVO.getReportB(), battleRecordVO.getBattleId());
	}

	//由service 判斷何時該呼叫此方法
	/*
	 * (non-Javadoc)
	 * @see _9_12_battlerecord_model.BattleRecordDAO_I#updateResult(_9_12_battlerecord_model.BattleRecordVO)
	 */
	@Override
	public void updateResult(BattleRecordVO battleRecordVO)
	{
		if (battleRecordVO.getReportA() == battleRecordVO.getReportB())
		{
			jdbc.update(UPDATE_RESULT, battleRecordVO.getReportA());
		}
		else
		{
			jdbc.update(UPDATE_RESULT, 6); //結果(6)表示有衝突
		}
	}

	/*
	 * (non-Javadoc)
	 * @see _9_12_battlerecord_model.BattleRecordDAO_I#delete(java.lang.Integer)
	 */
	@Override
	public void delete(Integer batteleRecordId)
	{
		jdbc.update(DELETE, batteleRecordId);
	}

	/*
	 * (non-Javadoc)
	 * @see _9_12_battlerecord_model.BattleRecordDAO_I#findById(java.lang.Integer)
	 */
	@Override
	public BattleRecordVO findById(Integer battleId)
	{
		return jdbc.queryForObject(GET_ONE, new BattleRecordRowMapper(), battleId);
	}

	/*
	 * (non-Javadoc)
	 * @see _9_12_battlerecord_model.BattleRecordDAO_I#findByTeamIdA(java.lang.Integer)
	 */
	@Override
	public List<BattleRecordVO> findByTeamIdA(Integer teamIdA)
	{
		return jdbc.query(FIND_BY_TEAM_A, new BattleRecordRowMapper(), teamIdA);
	}

	/*
	 * (non-Javadoc)
	 * @see _9_12_battlerecord_model.BattleRecordDAO_I#findByTeamIdB(java.lang.Integer)
	 */
	@Override
	public List<BattleRecordVO> findByTeamIdB(Integer teamIdB)
	{
		return jdbc.query(FIND_BY_TEAM_B, new BattleRecordRowMapper(), teamIdB);
	}

	/*
	 * (non-Javadoc)
	 * @see _9_12_battlerecord_model.BattleRecordDAO_I#getAll()
	 */
	@Override
	public List<BattleRecordVO> getAll()
	{
		return jdbc.query(GET_ALL, new BattleRecordRowMapper());
	}

	/*
	 * (non-Javadoc)
	 * @see _9_12_battlerecord_model.BattleRecordDAO_I#getAbsencePercent(java.lang.Integer)
	 */
	@Override
	public Double getAbsencePercent(Integer teamId)
	{
		try
		{
			return jdbc.queryForObject(GET_ABSENCE_PERCENT, Double.class, teamId, teamId, teamId, teamId);
		}
		catch (DataAccessException e)
		{

		}
		return null;
	}

	/*
	 * (non-Javadoc)
	 * @see _9_12_battlerecord_model.BattleRecordDAO_I#getWPCT(java.lang.Integer)
	 */
	@Override
	public Double getWPCT(Integer teamId)
	{
		return jdbc.queryForObject(GET_WPCT, Double.class, teamId, teamId, teamId, teamId);
	}

	private static final class BattleRecordRowMapper implements RowMapper<BattleRecordVO>
	{
		public BattleRecordVO mapRow(ResultSet rs, int rowNum) throws SQLException
		{
			return new BattleRecordVO(rs.getInt("battleId"), rs.getInt("teamIdA"), rs.getInt("teamIdB"), rs.getInt("battleStatus"),
					rs.getInt("courtId"), rs.getInt("battleMode"), rs.getDouble("battleBet"), rs.getTimestamp("battleDateTime"),
					rs.getInt("result"), rs.getInt("reportA"), rs.getInt("reportB"));
		}
	}

	public static void main(String arg[])
	{
		BattleRecordVO battleRecordVO = new BattleRecordVO();
		battleRecordVO.setTeamIdA(4);
		battleRecordVO.setTeamIdB(3);
		battleRecordVO.setBattleStatus(0);
		battleRecordVO.setCourtId(1);
		battleRecordVO.setBattleMode(3);
		battleRecordVO.setBattleBet((double) 0);
		battleRecordVO.setBattleDateTime(new Timestamp(System.currentTimeMillis()));

		ApplicationContext context = new AnnotationConfigApplicationContext(BatteleRecordConfig.class);
		BattleRecordDAO_I dao = context.getBean(BattleRecordDAO.class);

		try
		{
//			dao.add(battleRecordVO);
//			dao.accept_Reject(0, 1);
//			System.out.println(dao.findById(1).getBattleId() + " " +dao.findById(1).getTeamIdA() );

			System.out.println(dao.getAbsencePercent(4));

			System.out.println("good");
		}
		catch (Exception e)
		{
			e.printStackTrace();
			System.out.println("fuck");
		}
		((AnnotationConfigApplicationContext) context).close();

	}

}
