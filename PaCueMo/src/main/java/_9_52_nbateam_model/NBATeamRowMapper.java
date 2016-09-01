package _9_52_nbateam_model;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class NBATeamRowMapper implements RowMapper<NBATeamVO>
{

	@Override
	public NBATeamVO mapRow(ResultSet rs, int column) throws SQLException
	{
		NBATeamVO nbaVO = new NBATeamVO();
		nbaVO.setTeamID(rs.getInt("teamId"));
		nbaVO.setTeamName(rs.getString("teamName"));
		nbaVO.setTeamLogoURL(rs.getString("teamLogoURL"));
		return nbaVO;
	}

}
