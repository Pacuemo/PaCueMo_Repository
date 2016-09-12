package _9_21_club_model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import _00_config.RootConfig;

@Repository("ClubDAO")
public class ClubDAO implements ClubDAO_I
{
	@Autowired
	private JdbcOperations jdbc;

	private static final String insert_state = "insert into club(clubName,clubImgURL,clubDate,clubHead,clubProp) values (?,?,?,?,?)";
	private static final String delete_state = "delete from club where clubID=?";
	private static final String get_one_state = "select clubID,clubName,clubImgURL,clubDate,clubHead,clubProp from club where clubID=? ";
	private static final String get_all = "select clubID,clubName,clubImgURL,clubDate,clubHead,clubProp from club order by clubID ";
	private static final String update_one = "update club set clubImgURL=?,clubHead=?,clubProp=? where clubId = ?";
	private static final String Get_All_By_Name = "select * from club where clubName LIKE ?";

	@Override
	public int insert(ClubVO clubVO)
	{
		return jdbc.update(insert_state,
				clubVO.getClubName(),
				clubVO.getClubImageName(),
				clubVO.getClubDate(),
				clubVO.getClubHead(),
				clubVO.getClubProp());
	}

	@Override
	public int delete(int clubId)
	{
		return jdbc.update(delete_state, clubId);
	}

	@Override
	public int update(ClubVO clubVO)
	{
		return jdbc.update(update_one,
				clubVO.getClubImageName(),
				clubVO.getClubHead(),
				clubVO.getClubProp(),
				clubVO.getClubID());
	}

	@Override
	public ClubVO findByPK(int clubId) throws RuntimeException
	{
		return jdbc.queryForObject(get_one_state, new ClubRowMapper(), clubId);
	}

	@Override
	public List<ClubVO> getAll()
	{
		return jdbc.query(get_all, new ClubRowMapper());
	}

	public List<ClubVO> getAll_By_Name(String name)
	{
		String queryName = "%" + name + "%";
		return jdbc.query(Get_All_By_Name, new ClubRowMapper(), queryName);
	}

	private static final class ClubRowMapper implements RowMapper<ClubVO>
	{

		@Override
		public ClubVO mapRow(ResultSet rs, int rowNum) throws SQLException
		{

			return new ClubVO(
					rs.getInt("clubId"),
					rs.getString("clubName"),
					rs.getString("clubImgUrl"),
					rs.getDate("clubDate"),
					rs.getString("clubHead"),
					rs.getInt("clubProp"));
		}

	}

	public static void main(String[] args)
	{
//		ClubDAO_I dao = new ClubDAO();

		ApplicationContext context = new AnnotationConfigApplicationContext(RootConfig.class);
		ClubDAO_I dao = (ClubDAO) context.getBean("ClubDAO");
//		ClubVO clubVO = dao.findByPK(1);
//
//		System.out.println("clubName" + clubVO.getClubName());
//		List<ClubVO> clubVOs = dao.getAll();
//		for (ClubVO clubVO : clubVOs)
//		{
//			System.out.println("ClubID:" + clubVO.getClubID());
//			System.out.println("imgNAme:" + clubVO.getClubImageName());
//			System.out.println("ClubName:" + clubVO.getClubName());
//		}
		List<ClubVO> clubVOs = dao.getAll_By_Name("社");
		for (ClubVO vo : clubVOs)
		{

			System.out.println(vo.getClubName());
		}

	}

}
