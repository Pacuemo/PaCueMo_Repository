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
	private JdbcOperations jdbc;

	public TeamApplyDAO()
	{
	}

	@Autowired
	public TeamApplyDAO(JdbcOperations jdbc)
	{
		this.jdbc = jdbc;
	}

	private static final String SELECT_BY_TEAM = "SELECT * FROM TeamApply WHERE teamId = ? AND invstatus = 0";
	private static final String SELECT_BY_MEMBER_ALL = "SELECT * FROM TeamApply WHERE memberId = ?";
	private static final String SELECT_BY_MEMBER = "SELECT * FROM TeamApply WHERE memberId = ? AND invstatus = 0";
	private static final String INSERT = "INSERT INTO TeamApply (teamId, memberId) VALUES (?, ?)";
	private static final String DELETE = "DELETE FROM TeamApply WHERE teamId = ? and memberId = ?";

	/*
	 * (non-Javadoc)
	 * @see _9_14_teamapply_model.TeamApplyDAO_I#getByTeam(java.lang.Integer)
	 */
	@Override
	public List<TeamApplyVO> getByTeam(Integer teamId)
	{
		return jdbc.query(SELECT_BY_TEAM, new InvitationRowMapper(), teamId);
	}

	/*
	 * (non-Javadoc)
	 * @see _9_14_teamapply_model.TeamApplyDAO_I#getByMemberId_ALL(java.lang.String)
	 */
	@Override
	public List<TeamApplyVO> getByMemberId_ALL(String memberId)
	{
		return jdbc.query(SELECT_BY_MEMBER_ALL, new InvitationRowMapper(), memberId);
	}

	/*
	 * (non-Javadoc)
	 * @see _9_14_teamapply_model.TeamApplyDAO_I#getByMemberId(java.lang.String)
	 */
	@Override
	public List<TeamApplyVO> getByMemberId(String memberId)
	{
		return jdbc.query(SELECT_BY_MEMBER, new InvitationRowMapper(), memberId);
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

	private static final class InvitationRowMapper implements RowMapper<TeamApplyVO>
	{
		@Override
		public TeamApplyVO mapRow(ResultSet rs, int rowNum) throws SQLException
		{
			return new TeamApplyVO(rs.getInt("teamId"), rs.getString("memberId"), rs.getInt("invstatus"), rs.getDate("inviteDate"));
		}
	}

	public static void main(String[] args)
	{

	}

}
