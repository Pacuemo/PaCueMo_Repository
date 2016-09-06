package _9_23_league_model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.text.ParseException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository("LeagueDAO")
public class LeagueDAO implements LeagueDAO_I
{

	private JdbcOperations jdbc;
	private final String Select_All = "select * from league order by startDate desc";
	private final String Select_One_BY_ID = "select * from league where leagueID = ?";
	private final String Add_One_BY_VO = "insert into league values (?,?,?,?,?)";
	private final String Delete_One_BY_ID = "delete from league where leagueId =?";
	private final String Update_One_BY_VO = "update league set leagueName=?,clubAmount=?,startDate=?,endDate=?,courtId=? where leagueId=?";
	private final String Select_Like_BY_NAME = "select * from league where leagueName LIKE ? order by leagueId asc";

	@Autowired
	public LeagueDAO(JdbcOperations jdbcOperations)
	{
		this.jdbc = jdbcOperations;
	}

	//查詢BY NAME
	@Override
	public List<LeagueVO> find_by_name(String name)
	{
		String[] queryName = { "%" + name + "%" };
		int[] type = { Types.NVARCHAR };
		return jdbc.query(Select_Like_BY_NAME, queryName, type, new LeagueRowMapper());
	}

	//查尋
	@Override
	public LeagueVO findOne(int id)
	{
		return jdbc.queryForObject(Select_One_BY_ID, new LeagueRowMapper(), id);

	}

	@Override
	public List<LeagueVO> find_All()
	{
		return jdbc.query(Select_All, new LeagueRowMapper());
	}

	//新增
	@Override
	public int addOne(LeagueVO VO)
	{

		return jdbc.update(Add_One_BY_VO,
				VO.getLeagueName(),
				VO.getClubAmount(),
				VO.getStartDate(),
				VO.getEndDate(),
				VO.getPlaceID());
	}

	//刪除
	@Override
	public int deleteOne(int leagueId)
	{

		return jdbc.update(Delete_One_BY_ID, leagueId);
	}

	//修改
	@Override
	public int updateOne(LeagueVO VO)
	{
		return jdbc.update(Update_One_BY_VO,
				VO.getLeagueName(),
				VO.getClubAmount(),
				VO.getStartDate(),
				VO.getEndDate(),
				VO.getPlaceID(),
				VO.getLeagueID());
	}

	//mapRow
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

	public static void main(String[] args) throws ParseException
	{
		LeagueVO leagueVO = null;
		ApplicationContext context = new AnnotationConfigApplicationContext(LeagueConfig.class);
		//測試查詢
		LeagueDAO_I dao = (LeagueDAO_I) context.getBean("LeagueDAO");
//		leagueVO= dao.findOne(1);
//		System.out.println(leagueVO.getLeagueName());

		//測試新增及修改
//		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
//		leagueVO = (LeagueVO) context.getBean("LeagueVO");
//		leagueVO.setLeagueName("幹積八");
//		leagueVO.setStartDate(sdFormat.parse("2012-12-01"));
//		leagueVO.setEndDate(sdFormat.parse("2012-12-31"));
//		leagueVO.setClubAmount(12);
//		leagueVO.setPlaceID(3);
//		leagueVO.setLeagueID(1);
//		int success = dao.updateOne(leagueVO);

//
//		int success = dao.addOne(leagueVO);
//		System.out.println(success);

		//測試刪除
//		int success = dao.deleteOne(3);
//		System.out.println(success);

		//測試查詢BYNAME
		List<LeagueVO> leagueVOs = dao.find_by_name("世");
		for (LeagueVO vo : leagueVOs)
		{
			System.out.print("name= ");
			System.out.println(vo.getLeagueName());
		}
	}

}
