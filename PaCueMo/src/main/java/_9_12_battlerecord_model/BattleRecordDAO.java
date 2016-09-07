package _9_12_battlerecord_model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository("BattleRecordDAO")
public class BattleRecordDAO
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

	public void add(BattleRecordVO battleRecordVO)
	{
		jdbc.update(INSERT, battleRecordVO.getTeamIdA(), battleRecordVO.getTeamIdB(), battleRecordVO.getCourtId(),
				battleRecordVO.getBattleMode(), battleRecordVO.getBattleBet(), battleRecordVO.getBattleDateTime());
	}

	public void accept_Reject(Integer battleStatus, Integer battleId)
	{
		jdbc.update(ACCEPT, battleStatus, battleId);
	}

	public void reportA(BattleRecordVO battleRecordVO)
	{
		jdbc.update(REPORT_A, battleRecordVO.getReportB(), battleRecordVO.getBattleId());
	}

	public void reportB(BattleRecordVO battleRecordVO)
	{
		jdbc.update(REPORT_B, battleRecordVO.getReportB(), battleRecordVO.getBattleId());
	}

	//由service 判斷何時該呼叫此方法
	public void updateResult(BattleRecordVO battleRecordVO)
	{
		if (battleRecordVO.getReportA() == battleRecordVO.getReportB())
		{
			jdbc.update(UPDATE_RESULT, battleRecordVO.getReportA());
		}
		else
		{
			jdbc.update(UPDATE_RESULT, 5); //結果(5)表示有衝突
		}
	}

	public void delete(Integer batteleRecordId)
	{
		jdbc.update(DELETE, batteleRecordId);
	}

	public BattleRecordVO findById(Integer battleId)
	{
		return jdbc.queryForObject(GET_ONE, new BattleRecordRowMapper(), battleId);
	}

	public List<BattleRecordVO> findByTeamIdA(Integer teamIdA)
	{
		return jdbc.query(FIND_BY_TEAM_A, new BattleRecordRowMapper(), teamIdA);
	}

	public List<BattleRecordVO> findByTeamIdB(Integer teamIdB)
	{
		return jdbc.query(FIND_BY_TEAM_B, new BattleRecordRowMapper(), teamIdB);
	}

	public List<BattleRecordVO> getAll()
	{
		return jdbc.query(GET_ALL, new BattleRecordRowMapper());
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
		battleRecordVO.setTeamIdB(1);
		battleRecordVO.setBattleStatus(0);
		battleRecordVO.setCourtId(1);
		battleRecordVO.setBattleMode(3);
		battleRecordVO.setBattleBet((double) 0);
		battleRecordVO.setBattleDateTime(new Timestamp(System.currentTimeMillis()));

		ApplicationContext context = new AnnotationConfigApplicationContext(BatteleRecordConfig.class);
		BattleRecordDAO dao = context.getBean(BattleRecordDAO.class);

		try
		{
//			dao.add(battleRecordVO);
//			dao.accept_Reject(0, 1);
//			System.out.println(dao.findById(1).getBattleId() + " " +dao.findById(1).getTeamIdA() );

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
