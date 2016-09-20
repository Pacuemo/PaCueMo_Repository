package _9_54_gambleorder_model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import _00_config.RootConfig;

@Repository
public class GambleOrderDAO implements GambleOrderDAO_interface
{
	@Autowired
	private JdbcTemplate JdbcTemplate;

	private static final String GET_ALL_STMT = "SELECT gambleId,memberId,battleId,betHome,betAway,betTime FROM GambleOrder";
	private static final String GET_ONE_STMT = "SELECT gambleId,memberId,battleId,betHome,betAway,betTime FROM GambleOrder WHERE gambleId = ?";
	private static final String INSERT_STMT = "INSERT INTO dbo.GambleOrder ( memberId, battleId, betHome, betAway,betTime ) VALUES( ?, ?, ? , ? , ? )";
	private static final String DELETE_STMT = "DELETE FROM GambleOrder WHERE gambleId = ?";
	private static final String UPDATE_STMT = "UPDATE GambleOrder SET memberId=? , battleId=? , betHome=? ,betAway=? ,betTime=? WHERE gambleId = ?;";
	private static final String GET_BY_MB_ID = "SELECT gambleId,memberId,battleId,betHome,betAway,betTime FROM GambleOrder WHERE memberid = ?";
	private static final String GET_BY_BATTLE_ID = "SELECT gambleId,memberId,battleId,betHome,betAway,betTime FROM GambleOrder WHERE battleId = ?";

	public GambleOrderDAO()
	{
	}

	public GambleOrderDAO(JdbcTemplate JdbcTemplate)
	{
		this.JdbcTemplate = JdbcTemplate;
	}

	@Override
	public Integer insert(GambleOrderVO vo)
	{
		int num = JdbcTemplate.update(INSERT_STMT,
				vo.getMemberId(),
				vo.getBattleId(),
				vo.getBetHome(),
				vo.getBetAway(),
				vo.getBetTime());
		System.out.println(" =============== 新增" + num + "筆 GambleOrderVO ===============");
		return num;
	}

	@Override
	public Integer update(GambleOrderVO vo)
	{
		int num = JdbcTemplate.update(UPDATE_STMT,
				vo.getMemberId(),
				vo.getBattleId(),
				vo.getBetHome(),
				vo.getBetAway(),
				vo.getBetTime(),
				vo.getGambleId());
		System.out.println(" =============== 修改" + num + "筆 GambleOrderVO ===============");
		return num;
	}

	@Override
	public Integer delete(Integer gambleId)
	{
		int num = JdbcTemplate.update(DELETE_STMT, gambleId);
		System.out.println(" =============== 刪除" + num + "筆 GambleOrderVO ===============");
		return num;
	}

	@Override
	public GambleOrderVO findByPrimaryKey(Integer gambleId)
	{
		try
		{
			return JdbcTemplate.queryForObject(GET_ONE_STMT, new GambleOrderRowmapper(), gambleId);
		}
		catch (EmptyResultDataAccessException e)
		{
			return null;
		}
	}

	@Override
	public List<GambleOrderVO> getAll()
	{
		return JdbcTemplate.query(GET_ALL_STMT, new GambleOrderRowmapper());
	}

	@Override
	public List<GambleOrderVO> getByMemberId(String memberId)
	{
		return JdbcTemplate.query(GET_BY_MB_ID, new GambleOrderRowmapper(), memberId);
	}

	@Override
	public List<GambleOrderVO> getByBattleId(Integer battleId)
	{
		return JdbcTemplate.query(GET_BY_BATTLE_ID, new GambleOrderRowmapper(), battleId);
	}

	private static final class GambleOrderRowmapper implements RowMapper<GambleOrderVO>
	{

		@Override
		public GambleOrderVO mapRow(ResultSet rs, int rowNum) throws SQLException
		{
			GambleOrderVO gbVO = new GambleOrderVO();
			gbVO.setGambleId(rs.getInt("gambleId"));
			gbVO.setMemberId(rs.getString("memberId"));
			gbVO.setBattleId(rs.getInt("battleId"));
			gbVO.setBetHome(rs.getDouble("betHome"));
			gbVO.setBetAway(rs.getDouble("betAway"));
			gbVO.setBetTime(rs.getTimestamp("betTime"));
			return gbVO;
		}

	}

	public static void main(String[] args)
	{
//		ApplicationContext context = new AnnotationConfigApplicationContext(GambleOrderBeans_Config.class);
		ApplicationContext context = new AnnotationConfigApplicationContext(RootConfig.class);
		GambleOrderDAO dao = (GambleOrderDAO) context.getBean("gambleOrderDAO");
		//=============== 測試insert() ================
//		GambleOrderVO vvo = new GambleOrderVO();
//		vvo.setMemberId("01BF5304-DBCF-4BA9-A2C6-7200C98D7B9B");
//		vvo.setBattleId(254);
//		vvo.setBetHome(2300.0);
//		vvo.setBetAway(9000.0);
//		vvo.setBetTime(java.sql.Timestamp.valueOf("2016-09-19 11:23:00"));
//		System.out.println(dao.insert(vvo));
		//=============== 測試delete() ================
//		dao.delete(42);
		//=============== 測試 UPDATE ================
//		GambleOrderVO vvo = new GambleOrderVO();
//		vvo.setGambleId(44);
//		vvo.setMemberId("01BF5304-DBCF-4BA9-A2C6-7200C98D7B9B");
//		vvo.setBattleId(254);
//		vvo.setBetHome(0.0);
//		vvo.setBetAway(0.0);
//		vvo.setBetTime(java.sql.Timestamp.valueOf("2016-09-19 11:23:00"));
//		dao.update(vvo);
		//=============== 測試 查一筆 ================
//		GambleOrderVO vvvo = dao.findByPrimaryKey(20);
//		System.out.println(
//				String.format("%1s %40s %5s %10s %10s \t %10s",
//						vvvo.getGambleId(),
//						vvvo.getMemberId(),
//						vvvo.getBattleId(),
//						vvvo.getBetHome(),
//						vvvo.getBetAway(),
//						vvvo.getBetTime()));
		//=============== 測試getAll() ================
//		List<GambleOrderVO> list = dao.getAll();
//		for (GambleOrderVO vo : list)
//		{
//			String tmp = String.format("%1s %40s %5s %10s %10s \t %10s",
//					vo.getGambleId(),
//					vo.getMemberId(),
//					vo.getBattleId(),
//					vo.getBetHome(),
//					vo.getBetAway(),
//					vo.getBetTime());
//			System.out.println(tmp);
//		}
		//=============== 測試 getByMemberId(String memberId) ================
//		List<GambleOrderVO> list = dao.getByMemberId("01BF5304-DBCF-4BA9-A2C6-7200C98D7B9B");
//		for (GambleOrderVO vo : list)
//		{
//			String tmp = String.format("%1s %40s %5s %10s %10s \t %10s",
//					vo.getGambleId(),
//					vo.getMemberId(),
//					vo.getBattleId(),
//					vo.getBetHome(),
//					vo.getBetAway(),
//					vo.getBetTime());
//			System.out.println(tmp);
//		}
		//=============== 測試 getByBattleId(Integer battleId) ================		
//		List<GambleOrderVO> list = dao.getByBattleId(1);
//		for (GambleOrderVO vo : list)
//		{
//			String tmp = String.format("%1s %40s %5s %10s %10s \t %10s",
//					vo.getGambleId(),
//					vo.getMemberId(),
//					vo.getBattleId(),
//					vo.getBetHome(),
//					vo.getBetAway(),
//					vo.getBetTime());
//			System.out.println(tmp);
//		}
//		((ConfigurableApplicationContext) context).close();
	}

}
