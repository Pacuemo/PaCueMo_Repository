package _9_28_clubInvite_model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class ClubInviteDAO implements ClubInviteDAO_I
{
	@Autowired
	private JdbcOperations jdbc;
	private static final String add_One_By_Id = "insert into ClubInvite values(?,?,?,?)";
	private static final String get_All_By_Id = "select * from ClubInvite where memberId=?";
	private static final String delete_One_By_Id = "delete from ClubInvite where clubId=? AND memberId=?";

	private static final class ClubInviteRowMapper implements RowMapper<ClubInviteVO>
	{

		@Override
		public ClubInviteVO mapRow(ResultSet rs, int rowNum) throws SQLException
		{

			return new ClubInviteVO(
					rs.getInt("clubId"),
					rs.getString("memberId"),
					rs.getString("clubMemberId"),
					rs.getDate("inviteDay"));
		}

	}

	//新增
	/*
	 * (non-Javadoc)
	 * @see _9_28_clubInvite_model.ClubInviteDAO_I#add_One(_9_28_clubInvite_model.ClubInviteVO)
	 */
	@Override
	public int add_One(ClubInviteVO VO)
	{
		return jdbc.update(add_One_By_Id,
				VO.getClubId(),
				VO.getMemberId(),
				VO.getClubMemberId(),
				VO.getInviteDay());
	}

	//刪除
	/*
	 * (non-Javadoc)
	 * @see _9_28_clubInvite_model.ClubInviteDAO_I#delete_One(java.lang.String)
	 */
	@Override
	public int delete_One(int clubId, String MemberId)
	{
		return jdbc.update(delete_One_By_Id, clubId, MemberId);
	}

	//透過memberId查詢
	/*
	 * (non-Javadoc)
	 * @see _9_28_clubInvite_model.ClubInviteDAO_I#get_All_MemberId(java.lang.String)
	 */
	@Override
	public List<ClubInviteVO> get_All_MemberId(String MemberId)
	{
		return jdbc.query(get_All_By_Id, new ClubInviteRowMapper(), MemberId);
	}

}
