package _9_24_leagueClub_model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository("LeagueClubDAO")
public class LeagueClubDAO implements LeagueClubDAO_I
{

	private JdbcOperations jdbc;

	public LeagueClubDAO()
	{
	}

	@Autowired
	public LeagueClubDAO(JdbcOperations jdbc)
	{
		this.jdbc = jdbc;
	}

	private final String Select_ALL_BY_ID = "select * from LeagueClub where LeagueId =?";
	private final String Add_One_BY_VO = "insert into LeagueClub (leagueId,clubId) values (?,?)";
	private final String Delete_One_BY_ID = "delete from LeagueClub where leagueId=? and clubId =?";
	private final String Select_fightId_By_ClubId = "select * from LeagueClub where clubId=?";
	private final String Update_LeagueClub_Group = "UPDATE LeagueClub SET groups=? WHERE leagueId=? and clubId=? ";

	//查詢全部
	@Override
	public List<LeagueClubVO> find_ALL(int leagueId)
	{

		return jdbc.query(Select_ALL_BY_ID, new LeagueClubRowMap(), leagueId);
	}

	@Override
	public List<LeagueClubVO> get_ClubVOs_By_ClubId(int clubId)
	{
		return jdbc.query(Select_fightId_By_ClubId, new LeagueClubRowMap(), clubId);
	}

	//新增
	@Override
	public int add_One(LeagueClubVO leagueClubVO)
	{
		return jdbc.update(Add_One_BY_VO,
				leagueClubVO.getLeagueId(),
				leagueClubVO.getClubId());
	}

	//刪除
	@Override
	public int delete_One(LeagueClubVO leagueClubVO)
	{
		return jdbc.update(Delete_One_BY_ID,
				leagueClubVO.getLeagueId(),
				leagueClubVO.getClubId());
	}

//修改
	@Override
	public int update(LeagueClubVO leagueClubVO)
	{
		return jdbc.update(Update_LeagueClub_Group,
				leagueClubVO.getGroups(),
				leagueClubVO.getLeagueId(),
				leagueClubVO.getClubId());
	}

	private static final class LeagueClubRowMap implements RowMapper<LeagueClubVO>
	{

		public LeagueClubVO mapRow(ResultSet rs, int rowNum) throws SQLException
		{
			return new LeagueClubVO(rs.getInt(1), rs.getInt(2), rs.getInt(3));

		}
	}

	public static void main(String[] args)
	{

		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(LeagueClubConfig.class);
		LeagueClubDAO_I dao = context.getBean(LeagueClubDAO.class);
		//測試新增
//		LeagueClubVO VO = new LeagueClubVO(1, 15);
//		int success = dao.add_One(VO);

		//測試刪除
//		int success = dao.delete_One(VO);
//		System.out.println(success);

		//測試查詢全部
		List<LeagueClubVO> LeagueClubVO = dao.find_ALL(1);
		for (LeagueClubVO VO : LeagueClubVO)
		{
			System.out.println(VO.getClubId());
		}
	}

}
