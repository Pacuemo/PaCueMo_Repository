package _9_27_clubApply_model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class ClubApplyDAO implements ClubApplyDAO_I
{
	@Autowired
	private JdbcOperations jdbc;
	private static final String add_One_By_Id = "insert into clubApply values(?,?,?)";
	private static final String get_All_By_MemberId = "select * from ClubApply where memberId=?";
	private static final String get_All_By_ClubId = "select * from clubApply where clubId=?";
	private static final String delete_One_By_Id = "delete from clubApply where clubId=? AND memberId=?";

	private static final class ClubApplyRowMapper implements RowMapper<ClubApplyVO>
	{

		@Override
		public ClubApplyVO mapRow(ResultSet rs, int rowNum) throws SQLException
		{
			return new ClubApplyVO(
					rs.getInt("clubId"),
					rs.getString("memberId"),
					rs.getDate("applyDate"));
		}

	}

	//新增
	/*
	 * (non-Javadoc)
	 * @see _9_27_clubApply_model.ClubApplyDAO_I#add_One(_9_27_clubApply_model.ClubApplyVO)
	 */
	@Override
	public int add_One(ClubApplyVO VO)
	{
		return jdbc.update(add_One_By_Id,
				VO.getClubId(),
				VO.getMemberId(),
				VO.getApplyDate());
	}

	//刪除
	/*
	 * (non-Javadoc)
	 * @see _9_27_clubApply_model.ClubApplyDAO_I#delete_One(java.lang.String)
	 */
	@Override
	public int delete_One(int clubId, String MemberId)
	{
		return jdbc.update(delete_One_By_Id, clubId, MemberId);
	}

	//透過memberId查詢
	/*
	 * (non-Javadoc)
	 * @see _9_27_clubApply_model.ClubApplyDAO_I#get_All_MemberId(java.lang.String)
	 */
	@Override
	public List<ClubApplyVO> get_All_MemberId(String MemberId)
	{
		return jdbc.query(get_All_By_MemberId, new ClubApplyRowMapper(), MemberId);
	}

	//透過clubId查詢
	/*
	 * (non-Javadoc)
	 * @see _9_27_clubApply_model.ClubApplyDAO_I#get_All_ClubId(java.lang.String)
	 */
	@Override
	public List<ClubApplyVO> get_All_ClubId(int ClubId)
	{
		return jdbc.query(get_All_By_ClubId, new ClubApplyRowMapper(), ClubId);
	}
}
