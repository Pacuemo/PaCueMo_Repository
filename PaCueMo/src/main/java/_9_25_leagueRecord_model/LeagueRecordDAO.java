package _9_25_leagueRecord_model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository("LeagueRecordDAO")
public class LeagueRecordDAO implements LeagueRecordDAO_I
{
	private JdbcOperations jdbc;

	public LeagueRecordDAO()
	{
	}

	@Autowired
	public LeagueRecordDAO(JdbcOperations jdbc)
	{
		this.jdbc = jdbc;
	}

	private final String Select_One_BY_ClubID = "select * from LeagueRecord where clubIdA = ? OR clubIdB=?";
	private final String Select_ALL_BY_leagueId = "select * from LeagueRecord where leagueId = ?";
	private final String Add_One_BY_VO = "insert into LeagueRecord values (?,?,?,?,?,?,?,?)";
	private final String Delete_One_BY_ID = "delete from LeagueRecord where fightId =?";
	private final String Update_One_BY_VO = "update LeagueRecord set clubIdA=?,clubIdB=?,fightDateTime=?,rounds=?,scoreA=?,scoreB=?,totalTime=? where fightId=?";

	private static final class LeagueRecordDAORowMapper implements RowMapper<LeagueRecordVO>
	{
		public LeagueRecordVO mapRow(ResultSet rs, int rowNum) throws SQLException
		{
			return new LeagueRecordVO(
					rs.getInt("fightId"),
					rs.getInt("leagueId"),
					rs.getInt("clubIdA"),
					rs.getInt("clubIdB"),
					rs.getDate("fightDateTime"),
					rs.getInt("rounds"),
					rs.getInt("scoreA"),
					rs.getInt("scoreB"),
					rs.getString("totalTime"));
		}
	}

	@Override
	public List<LeagueRecordVO> find_One(int clubId)
	{
		return jdbc.query(Select_One_BY_ClubID, new LeagueRecordDAORowMapper(), clubId, clubId);
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
				VO.getRounds(),
				VO.getScoreA(),
				VO.getScoreB(),
				VO.getTotalTime());
	}

	@Override
	public int delete_One(int fightId)
	{
		return jdbc.update(Delete_One_BY_ID, fightId);
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
		LeagueRecordVO VO = new LeagueRecordVO(12, 1, 3, 4, new java.sql.Date(sdf.parse("2012-12-31 05:31:32").getTime()), 3, 31, 33, "120分鐘");
		//新增
//		int success = dao.add_One(VO);
		//刪除
//		int success = dao.delete_One(13);
		//修改
		int success = dao.update_One(VO);
		System.out.println(success);
	}
}
