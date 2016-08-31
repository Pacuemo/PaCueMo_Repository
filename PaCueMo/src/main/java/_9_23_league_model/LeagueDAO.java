package _9_23_league_model;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import _00_config.RootConfig;

@Repository("leagueDAO")
public class LeagueDAO
{

	private JdbcOperations jdbc;
	private final String Select_One_BY_ID = "select * from league where leagueID = ?";

	@Autowired
	public LeagueDAO(JdbcOperations jdbcOperations)
	{
		this.jdbc = jdbcOperations;
	}

	public LeagueVO findOne(int id)
	{
		return jdbc.queryForObject(Select_One_BY_ID, new LeagueRowMapper(), id);

	}

	private static final class LeagueRowMapper implements RowMapper<LeagueVO>
	{

		public LeagueVO mapRow(ResultSet rs, int rowNum) throws SQLException
		{

			return new LeagueVO(
					rs.getInt("leagueID"),
					rs.getString("leagueName"),
					rs.getInt("clubAmount"),
					rs.getDate("startDate"),
					rs.getDate("endDate"),
					rs.getInt("courtId"));
		}
	}

	public static void main(String[] args)
	{

		ApplicationContext context = new AnnotationConfigApplicationContext(RootConfig.class);
		LeagueDAO dao = (LeagueDAO) context.getBean("leagueDAO");
		LeagueVO leagueVO = dao.findOne(1);
		System.out.println(leagueVO.getLeagueName());
	}

}
