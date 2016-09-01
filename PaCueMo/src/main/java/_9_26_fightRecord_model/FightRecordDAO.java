package _9_26_fightRecord_model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository("FightRecordDAO")
public class FightRecordDAO
{
	private JdbcOperations jdbc;

	public FightRecordDAO()
	{
	}

	@Autowired
	public FightRecordDAO(JdbcOperations jdbc)
	{
		this.jdbc = jdbc;
	}

	private final String Select_ALL_BY_clubMemberId = "select * from FightRecord where clubMemberId = ?";
	private final String Select_ALL_BY_fightId = "select * from FightRecord where fightId = ?";
	private final String Select_ALL_BY_clubId = "select * from FightRecord where clubId = ?";
	private final String Add_One_BY_VO = "insert into LeagueRecord values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	private final String Delete_One_BY_ID = "delete from LeagueRecord where fightId =?";

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

	public List<FightRecordVO> find_All_By_clubMemberId(String clubMemberId)
	{

		return jdbc.query(Select_ALL_BY_clubMemberId, new FightRecordRowMapper(), clubMemberId);
	}

	public List<FightRecordVO> find_All_By_fightId(int fightId)
	{

		return jdbc.query(Select_ALL_BY_fightId, new FightRecordRowMapper(), fightId);
	}

	public List<FightRecordVO> find_All_By_clubId(int clubId)
	{

		return jdbc.query(Select_ALL_BY_clubId, new FightRecordRowMapper(), clubId);
	}

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

	public int delete_One(int fightId)
	{
		return jdbc.update(Delete_One_BY_ID, fightId);
	}
}
