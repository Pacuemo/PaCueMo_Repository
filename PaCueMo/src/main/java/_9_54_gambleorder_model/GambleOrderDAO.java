package _9_54_gambleorder_model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import _54_gambleorder_service.GambleOrderBeans_Config;

public class GambleOrderDAO implements GambleOrderDAO_interface
{

	private JdbcTemplate JdbcTemplate;

	private static final String GET_ALL_STMT = "SELECT gambleId,memberId,battleId,betMoney,betTeam FROM GambleOrder";
	private static final String GET_ONE_STMT = "SELECT gambleId,memberId,battleId,betMoney,betTeam FROM GambleOrder WHERE gambleId = ?";
	private static final String INSERT_STMT = "INSERT INTO dbo.GambleOrder ( memberId, battleId, betMoney, betTeam ) VALUES( ?, ?, ? , ? )";
	private static final String DELETE_STMT = "DELETE FROM GambleOrder WHERE gambleId = ?";
	private static final String UPDATE_STMT = "UPDATE GambleOrder SET memberId=? , battleId=? , betMoney=? ,betTeam=? WHERE gambleId = ?;";
	private static final String GET_BY_MB_ID = "SELECT gambleId,memberId,battleId,betMoney,betTeam FROM GambleOrder WHERE memberid = ?";
	private static final String GET_BY_BATTLE_ID = "SELECT gambleId,memberId,battleId,betMoney,betTeam FROM GambleOrder WHERE battleId = ?";

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
		int num = JdbcTemplate.update(INSERT_STMT, vo.getMemberId(), vo.getBattleId(), vo.getBetMoney(), vo.getBetTeam());
		System.out.println(" =============== 新增" + num + "筆 GambleOrderVO ===============");
		return num;
	}

	@Override
	public Integer update(GambleOrderVO vo)
	{
		int num = JdbcTemplate.update(UPDATE_STMT, vo.getMemberId(), vo.getBattleId(), vo.getBetMoney(), vo.getBetTeam(), vo.getGambleId());
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

	public List<GambleOrderVO> getByMemberId(String memberId)
	{
		return JdbcTemplate.query(GET_BY_MB_ID, new GambleOrderRowmapper(), memberId);
	}

	public List<GambleOrderVO> getBybattleId(Integer battleId)
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
			gbVO.setBetMoney(rs.getDouble("betMoney"));
			gbVO.setBetTeam(rs.getInt("betTeam")); //-- (0)代表主隊, (1)代表客隊
			return gbVO;
		}

	}

	public static void main(String[] args)
	{
		ApplicationContext context = new AnnotationConfigApplicationContext(GambleOrderBeans_Config.class);
		GambleOrderDAO dao = (GambleOrderDAO) context.getBean("gambleOrderDAO");
		//=============== 測試insert() ================
//		GambleOrderVO vvo = new GambleOrderVO();
//		vvo.setMemberId("3071C15D-997A-4898-9AFF-7854F31B974A");
//		vvo.setBattleId(254);
//		vvo.setBetMoney(2300.0);
//		vvo.setBetTeam(0);
//		System.out.println(dao.insert(vvo));
		//=============== 測試delete() ================
//		dao.delete(42);
		//=============== 測試 UPDATE ================
//		GambleOrderVO vvo = new GambleOrderVO();
//		vvo.setGambleId(35);
//		vvo.setMemberId("3071C15D-997A-4898-9AFF-7854F31B974A");
//		vvo.setBattleId(254);
//		vvo.setBetMoney(2300.0);
//		vvo.setBetTeam(0);
//		dao.update(vvo);
		//=============== 測試 查一筆 ================
//		GambleOrderVO vvvo = dao.findByPrimaryKey(35);
//		System.out.println(String.format("%1s %40s %5s %10s %10s", vvvo.getGambleId(), vvvo.getMemberId(), vvvo.getBattleId(), vvvo.getBetMoney(), vvvo.getBetTeam()));
		//=============== 測試getAll() ================
//		List<GambleOrderVO> list = dao.getAll();
//		for (GambleOrderVO vo : list)
//		{
//			String tmp = String.format("%1s %40s %5s %10s %10s", vo.getGambleId(), vo.getMemberId(), vo.getBattleId(), vo.getBetMoney(), vo.getBetTeam());
//			System.out.println(tmp);
//		}
		//=============== 測試 getByMemberId(String memberId) ================
//		List<GambleOrderVO> list = dao.getByMemberId("84CBDD6A-70CF-4D8F-B119-05958F3B930E");
//		for (GambleOrderVO vo : list)
//		{
//			String tmp = String.format("%1s %40s %5s %10s %10s", vo.getGambleId(), vo.getMemberId(), vo.getBattleId(), vo.getBetMoney(), vo.getBetTeam());
//			System.out.println(tmp);
//		}
		//=============== 測試 getByBattleId(Integer battleId) ================		
//		List<GambleOrderVO> list = dao.getBybattleId(1);
//		for (GambleOrderVO vo : list)
//		{
//			String tmp = String.format("%1s %40s %5s %10s %10s", vo.getGambleId(), vo.getMemberId(), vo.getBattleId(), vo.getBetMoney(), vo.getBetTeam());
//			System.out.println(tmp);
//		}
//		((ConfigurableApplicationContext) context).close();
	}

}