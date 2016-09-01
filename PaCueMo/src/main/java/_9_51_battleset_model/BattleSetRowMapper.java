package _9_51_battleset_model;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class BattleSetRowMapper implements RowMapper<BattleSetVO>
{

	@Override
	public BattleSetVO mapRow(ResultSet rs, int cloumn) throws SQLException
	{
		BattleSetVO bSetVO = new BattleSetVO();
		bSetVO.setBattleId(rs.getInt("battleId"));
		bSetVO.setBattleDateTime(rs.getTimestamp("battleDateTime"));
		bSetVO.setHomeId(rs.getInt("homeId"));
		bSetVO.setAwayId(rs.getInt("awayId"));
		bSetVO.setHomeScore(rs.getInt("homeScore"));
		bSetVO.setAwayScore(rs.getInt("awayScore"));
		bSetVO.setHomebet(rs.getDouble("homebet"));
		bSetVO.setAwaybet(rs.getDouble("awaybet"));

		return bSetVO;
	}

}
