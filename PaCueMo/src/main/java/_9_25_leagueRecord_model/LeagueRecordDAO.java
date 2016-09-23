package _9_25_leagueRecord_model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository("LeagueRecordDAO")
public class LeagueRecordDAO implements LeagueRecordDAO_I
{
	@Autowired
	private JdbcOperations jdbc;
	private final String Select_One_BY_FightId = "select * from LeagueRecord where fightId=? ";
	private final String Select_One_BY_ClubID = "select * from LeagueRecord where leagueId=? and (clubIdA = ? OR clubIdB=?)";
	private final String Select_ALL_BY_leagueId = "select * from LeagueRecord where leagueId = ? order by fightid desc";
	private final String Add_One_BY_VO = "insert into LeagueRecord values (?,?,?,?,?,?,?,?,?)";
	private final String Delete_One_BY_ID = "delete from LeagueRecord where fightId =?";
	private final String Update_One_BY_VO = "update LeagueRecord set clubIdA=?,clubIdB=?,fightDateTime=?,rounds=?,scoreA=?,scoreB=?,totalTime=? where fightId=?";
	private final String Select_WinCount_By_ID = "SELECT COUNT(*) FROM leagueRecord where winner=?";
	private final String Select_Last_Data = "SELECT TOP 1 * FROM leagueRecord ORDER BY fightId DESC";

	private static final class LeagueRecordDAORowMapper implements RowMapper<LeagueRecordVO>
	{
		public LeagueRecordVO mapRow(ResultSet rs, int rowNum) throws SQLException
		{
			return new LeagueRecordVO(
					rs.getInt("fightId"),
					rs.getInt("leagueId"),
					rs.getInt("clubIdA"),
					rs.getInt("clubIdB"),
					rs.getTimestamp("fightDateTime"),
					rs.getInt("rounds"),
					rs.getInt("scoreA"),
					rs.getInt("scoreB"),
					rs.getString("totalTime"));
		}
	}

	@Override
	public LeagueRecordVO find_One(int fightId)
	{
		try
		{
			return jdbc.queryForObject(Select_One_BY_FightId, new LeagueRecordDAORowMapper(), fightId);
		}
		catch (DataAccessException E)
		{
			return null;
		}
	}

	@Override
	public LeagueRecordVO find_Last_One()
	{
		try
		{
			return jdbc.queryForObject(Select_Last_Data, new LeagueRecordDAORowMapper());
		}
		catch (DataAccessException E)
		{
			return null;
		}
	}

	@Override
	public List<LeagueRecordVO> find_One(int leagueId, int clubId)
	{
		return jdbc.query(Select_One_BY_ClubID, new LeagueRecordDAORowMapper(), leagueId, clubId, clubId);
	}

	@Override
	public List<LeagueRecordVO> find_All(int leagueId)
	{
		return jdbc.query(Select_ALL_BY_leagueId, new LeagueRecordDAORowMapper(), leagueId);
	}

	@Override
	public int add_One(LeagueRecordVO VO)
	{
		return jdbc.update(Add_One_BY_VO,
				VO.getLeagueId(),
				VO.getClubIdA(),
				VO.getClubIdB(),
				VO.getFightDateTime(),
				//new SimpleDateFormat('yyyy-mm-dd hh:mm:ss').parse(VO.getFightDateTime());
				VO.getRounds(),
				VO.getScoreA(),
				VO.getScoreB(),
				VO.getTotalTime(),
				VO.getWinner());
	}

	@Override
	public int delete_One(int fightId)
	{
		return jdbc.update(Delete_One_BY_ID, fightId);
	}

	@Override
	public int win_Count(int clubId)
	{
		try
		{
			return jdbc.queryForObject(Select_WinCount_By_ID, Integer.class, clubId);
		}
		catch (DataAccessException e)
		{
			return 0;
		}
	}

	@Override
	public int update_One(LeagueRecordVO VO)
	{
//"clubIdA=?,clubIdB=?,fightDateTime=?,rounds=?,scoreA=?,scoreB=?,totalTime=? where fightId=?";
		return jdbc.update(Update_One_BY_VO,
				VO.getClubIdA(),
				VO.getClubIdB(),
				VO.getFightDateTime(),
				VO.getRounds(),
				VO.getScoreA(),
				VO.getScoreB(),
				VO.getTotalTime(),
				VO.getFightId());
	}

	public static void main(String[] args) throws ParseException
	{
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(LeagueRecordConfig.class);
		LeagueRecordDAO_I dao = context.getBean(LeagueRecordDAO.class);
		//查詢某社團
//		List<LeagueRecordVO> LeagueRecordVOs = dao.find_One(3);
//		for (LeagueRecordVO VO : LeagueRecordVOs)
//		{
//			System.out.println(VO.getScoreA());
//		}
		//查詢全部資料
//		List<LeagueRecordVO> LeagueRecordVOs = dao.find_All(1);
//		for (LeagueRecordVO VO : LeagueRecordVOs)
//		{
//			System.out.println(VO.getScoreA());
//		}

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		System.out.println(sdf.parse("2016-09-25T20:30:00"));
//		LeagueRecordVO VO = new LeagueRecordVO(12, 1, 3, 4, new java.sql.Date(sdf.parse("2012-12-31 05:31:32").getTime()), 3, 31, 33, "120分鐘");
		//新增
//		int success = dao.add_One(VO);
		//刪除
//		int success = dao.delete_One(13);
		//修改
//		int success = dao.update_One(VO);
//		System.out.println(success);
	}
}
