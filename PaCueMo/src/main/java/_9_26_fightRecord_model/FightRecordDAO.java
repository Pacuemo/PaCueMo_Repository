package _9_26_fightRecord_model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository("FightRecordDAO")
public class FightRecordDAO implements FightRecordDAO_I
{
	@Autowired
	private JdbcOperations jdbc;

	private final String Select_ALL_BY_clubMemberId = "select * from FightRecord where clubMemberId = ?";
	private final String Select_ALL_BY_fightId = "select * from FightRecord where fightId = ?";
	private final String Select_ALL_BY_clubId = "select * from FightRecord where clubId = ?";
	private final String Add_One_BY_VO = "insert into FightRecord values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	private final String Delete_One_BY_ID = "delete from FightRecord where fightId =? and clubMemberId=?";
	private final String Delete_ALL_BY_FightId = "delete from FightRecord where fightId =?";
	private final String Select_One_By_ClubMemberId = "select * from fightRecord where fightId =? and clubMemberId=?";

	private static final class FightRecordRowMapper implements RowMapper<FightRecordVO>
	{
		public FightRecordVO mapRow(ResultSet rs, int rowNum) throws SQLException
		{
			return new FightRecordVO(
					rs.getInt("fightId"),
					rs.getInt("clubId"),
					rs.getString("clubMemberId"),
					rs.getInt("gamePlayer"),
					rs.getString("position"),
					rs.getBoolean("gameStart"),
					rs.getString("minPlay"),
					rs.getInt("trePA"),
					rs.getInt("trePM"),
					rs.getDouble("trePP"),
					rs.getInt("twoPA"),
					rs.getInt("twoPM"),
					rs.getDouble("twoPP"),
					rs.getInt("fta"),
					rs.getInt("ftm"),
					rs.getDouble("ftp"),
					rs.getInt("ofRep"),
					rs.getInt("deRep"),
					rs.getInt("totalRep"),
					rs.getInt("ass"),
					rs.getInt("steal"),
					rs.getInt("block"),
					rs.getInt("turnOver"),
					rs.getInt("fouls"),
					rs.getInt("score"));
		}

	}

	@Override
	public List<FightRecordVO> find_All_By_clubMemberId(String clubMemberId)
	{

		return jdbc.query(Select_ALL_BY_clubMemberId, new FightRecordRowMapper(), clubMemberId);
	}

	@Override
	public FightRecordVO get_One(int fightId, String memberId)
	{
		try
		{
			return jdbc.queryForObject(Select_One_By_ClubMemberId, new FightRecordRowMapper(), fightId, memberId);
		}
		catch (Exception e)
		{
			return null;
		}
	}

	@Override
	public List<FightRecordVO> find_All_By_fightId(int fightId)
	{

		return jdbc.query(Select_ALL_BY_fightId, new FightRecordRowMapper(), fightId);
	}

	@Override
	public List<FightRecordVO> find_All_By_clubId(int clubId)
	{

		return jdbc.query(Select_ALL_BY_clubId, new FightRecordRowMapper(), clubId);
	}

	@Override
	public int add_One(FightRecordVO fightRecordVO)
	{
		return jdbc.update(Add_One_BY_VO,
				fightRecordVO.getFightId(),
				fightRecordVO.getClubId(),
				fightRecordVO.getClubMemberId(),
				fightRecordVO.getGamePlayer(),
				fightRecordVO.getPosition(),
				fightRecordVO.isGameStart(),
				fightRecordVO.getMinPlay(),
				fightRecordVO.getTrePA(),
				fightRecordVO.getTrePM(),
				fightRecordVO.getTrePP(),
				fightRecordVO.getTwoPA(),
				fightRecordVO.getTwoPM(),
				fightRecordVO.getTwoPP(),
				fightRecordVO.getFta(),
				fightRecordVO.getFtm(),
				fightRecordVO.getFtp(),
				fightRecordVO.getOfRep(),
				fightRecordVO.getDeRep(),
				fightRecordVO.getTotalRep(),
				fightRecordVO.getAss(),
				fightRecordVO.getSteal(),
				fightRecordVO.getBlock(),
				fightRecordVO.getTurnOver(),
				fightRecordVO.getFouls(),
				fightRecordVO.getScore());
	}

	@Override
	public int delete_One(int fightId, String memberId)
	{
		return jdbc.update(Delete_One_BY_ID, fightId, memberId);
	}

	@Override
	public int delete_ALL(int fightId)
	{
		return jdbc.update(Delete_ALL_BY_FightId, fightId);
	}

	public static void main(String[] args)
	{
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(FightRecordConfig.class);
		FightRecordDAO_I dao = context.getBean(FightRecordDAO.class);
		List<FightRecordVO> fightRecords = null;
		//用社團ID查尋連賽紀錄
//		fightRecords=dao.find_All_By_clubId(3);
		//用fightId查尋連賽紀錄
//		fightRecords = dao.find_All_By_fightId(2);
		//用clubMemberId查詢聯賽紀錄
//		fightRecords = dao.find_All_By_clubMemberId("100");
//		for (FightRecordVO VO : fightRecords)
//		{
//			System.out.println(VO.getPosition());
//		}

		//新增一筆記錄 
//		FightRecordVO VO = new FightRecordVO(14, 10, "100", 38, "幹", false, "05:11", 0, 0, 0.0, 1, 1, 100.0, 0, 0, 0.0, 0, 0, 0, 0, 0, 0, 1, 2, 2);
//		int success = dao.add_One(VO);
//		System.out.println(success);

		//刪除一筆資料
		int success = dao.delete_One(14, "100");
		System.out.println(success);
		context.close();
	}
}
