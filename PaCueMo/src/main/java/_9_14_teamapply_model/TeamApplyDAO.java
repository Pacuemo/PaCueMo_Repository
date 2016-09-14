package _9_14_teamapply_model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository("TeamApplyDAO")
public class TeamApplyDAO implements TeamApplyDAO_I
{
	@Autowired
	private JdbcOperations jdbc;

	public TeamApplyDAO()
	{
	}

	private static final String SELECT_BY_TEAM = "SELECT * FROM TeamApply WHERE teamId = ? AND applystatus = 0";
	private static final String SELECT_BY_MEMBER_ALL = "SELECT * FROM TeamApply WHERE memberId = ?";
	private static final String SELECT_BY_MEMBER_APPLYING = "SELECT * FROM TeamApply WHERE memberId = ? AND applystatus = 0";
	private static final String INSERT = "INSERT INTO TeamApply (teamId, memberId) VALUES (?, ?)";
	private static final String DELETE = "DELETE FROM TeamApply WHERE teamId = ? and memberId = ?";
	private static final String UPDATE = "UPDATE TeamApply SET applystatus = ? WHERE teamId = ? AND memberId = ?";

	/*
	 * (non-Javadoc)
	 * @see _9_14_teamapply_model.TeamApplyDAO_I#getByTeam(java.lang.Integer)
	 */
	@Override
	public List<TeamApplyVO> getByTeam(Integer teamId)
	{
		return jdbc.query(SELECT_BY_TEAM, new TeamApplyRowMapper(), teamId);
	}

	/*
	 * (non-Javadoc)
	 * @see _9_14_teamapply_model.TeamApplyDAO_I#getByMemberId_ALL(java.lang.String)
	 */
	@Override
	public List<TeamApplyVO> getByMemberId_ALL(String memberId)
	{
		return jdbc.query(SELECT_BY_MEMBER_ALL, new TeamApplyRowMapper(), memberId);
	}

	/*
	 * (non-Javadoc)
	 * @see _9_14_teamapply_model.TeamApplyDAO_I#getByMemberId(java.lang.String)
	 */
	@Override
	public List<TeamApplyVO> getByMemberId_Applying(String memberId)
	{
		return jdbc.query(SELECT_BY_MEMBER_APPLYING, new TeamApplyRowMapper(), memberId);
	}

	/*
	 * (non-Javadoc)
	 * @see _9_14_teamapply_model.TeamApplyDAO_I#add(_9_14_teamapply_model.TeamApplyVO)
	 */
	@Override
	public void add(TeamApplyVO teamApplyVO)
	{
		jdbc.update(INSERT, teamApplyVO.getTeamId(), teamApplyVO.getMemberId());
	}

	/*
	 * (non-Javadoc)
	 * @see _9_14_teamapply_model.TeamApplyDAO_I#delete(java.lang.Integer, java.lang.String)
	 */
	@Override
	public void delete(Integer teamId, String memberId)
	{
		jdbc.update(DELETE, teamId, memberId);
	}

	@Override
	public void update(Integer invstatus, Integer teamId, String memberId)
	{
		jdbc.update(UPDATE, invstatus, teamId, memberId);
	}

	private static final class TeamApplyRowMapper implements RowMapper<TeamApplyVO>
	{
		@Override
		public TeamApplyVO mapRow(ResultSet rs, int rowNum) throws SQLException
		{
			return new TeamApplyVO(rs.getInt("teamId"), rs.getString("memberId"), rs.getInt("applystatus"), rs.getDate("applyDate"));
		}
	}

}
