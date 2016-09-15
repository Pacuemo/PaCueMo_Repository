package _9_13_teaminvite_model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository("TeamInviteDAO")
public class TeamInviteDAO implements TeamInviteDAO_I
{
	private JdbcOperations jdbc;

	public TeamInviteDAO()
	{
	}

	@Autowired
	public TeamInviteDAO(JdbcOperations jdbc)
	{
		this.jdbc = jdbc;
	}

	private static final String SELECT_BY_MEMBER_ALL = "SELECT * FROM TeamInvite WHERE memberId = ?";
	private static final String SELECT_BY_MEMBER = "SELECT * FROM TeamInvite WHERE memberId = ? AND invstatus = 0";
	private static final String SELECT_BY_TEAM_MEMBER_ALL = "SELECT * FROM TeamInvite WHERE teamMemberId = ?";
	private static final String SELECT_BY_TEAM_MEMBER = "SELECT * FROM TeamInvite WHERE teamMemberId = ? AND invstatus = 0";
	private static final String SELECT_BY_TEAM = "SELECT * FROM TeamInvite WHERE teamId = ? AND invstatus = 0";
	private static final String INSERT = "INSERT INTO TeamInvite (teamId, memberId, teamMemberId) VALUES (?, ?, ?)";
	private static final String DELETE = "DELETE FROM TeamInvite WHERE teamId = ? and memberId = ?";
	private static final String UPDATE = "UPDATE TeamInvite SET applystatus = ? WHERE teamId = ? AND memberId = ? AND teamMemberId =?";

	/*
	 * (non-Javadoc)
	 * @see _9_13_teamInvite_model.TeamInviteDAO_I#getByTeam(java.lang.Integer)
	 */
	@Override
	public List<TeamInviteVO> getByTeam(Integer teamId)
	{
		return jdbc.query(SELECT_BY_TEAM, new InvitationRowMapper(), teamId);
	}

	/*
	 * (non-Javadoc)
	 * @see _9_13_teamInvite_model.TeamInviteDAO_I#getByMemberId_ALL(java.lang.String)
	 */
	@Override
	public List<TeamInviteVO> getByMemberId_ALL(String memberId)
	{
		return jdbc.query(SELECT_BY_MEMBER_ALL, new InvitationRowMapper(), memberId);
	}

	/*
	 * (non-Javadoc)
	 * @see _9_13_teamInvite_model.TeamInviteDAO_I#getByMemberId(java.lang.String)
	 */
	@Override
	public List<TeamInviteVO> getByMemberId(String memberId)
	{
		return jdbc.query(SELECT_BY_MEMBER, new InvitationRowMapper(), memberId);
	}

	/*
	 * (non-Javadoc)
	 * @see _9_13_teamInvite_model.TeamInviteDAO_I#getByTeamMemberId_ALL(java.lang.String)
	 */
	@Override
	public List<TeamInviteVO> getByTeamMemberId_ALL(String teamMemberId)
	{
		return jdbc.query(SELECT_BY_TEAM_MEMBER_ALL, new InvitationRowMapper(), teamMemberId);
	}

	/*
	 * (non-Javadoc)
	 * @see _9_13_teamInvite_model.TeamInviteDAO_I#getByTeamMemberId(java.lang.String)
	 */
	@Override
	public List<TeamInviteVO> getByTeamMemberId(String teamMemberId)
	{
		return jdbc.query(SELECT_BY_TEAM_MEMBER, new InvitationRowMapper(), teamMemberId);
	}

	/*
	 * (non-Javadoc)
	 * @see _9_13_teamInvite_model.TeamInviteDAO_I#add(_9_13_teamInvite_model.TeamInviteVO)
	 */
	@Override
	public void add(TeamInviteVO teamInviteVO)
	{
		jdbc.update(INSERT, teamInviteVO.getTeamId(), teamInviteVO.getMemberId(), teamInviteVO.getTeamMemberId());
	}

	/*
	 * (non-Javadoc)
	 * @see _9_13_teamInvite_model.TeamInviteDAO_I#delete(java.lang.Integer)
	 */
	@Override
	public void delete(Integer teamId, String memberId)
	{
		jdbc.update(DELETE, teamId, memberId);
	}

	public void update(Integer invstatus, Integer teamId, String memberId, String teamMemberID)
	{
		jdbc.update(UPDATE, invstatus, teamId, memberId);
	}

	private static final class InvitationRowMapper implements RowMapper<TeamInviteVO>
	{
		@Override
		public TeamInviteVO mapRow(ResultSet rs, int rowNum) throws SQLException
		{
			return new TeamInviteVO(rs.getInt("teamId"), rs.getString("memberId"), rs.getString("teamMemberId"),
					rs.getInt("invstatus"), rs.getDate("inviteDate"));
		}
	}

	public static void main(String[] args)
	{
		String insert = "INSERT INTO dbo.Invitation (memberA, memberB, teamId, clubId, invstatus)"
				+ " VALUES ('5D364BF9-CA21-4788-96EF-C1CF92F630B6', 'B660A9A0-CE10-45BB-B6A5-FF516102E880', 4, NULL, 0)";
		TeamInviteVO teamInviteVO = new TeamInviteVO();
		teamInviteVO.setTeamId(4);
		teamInviteVO.setMemberId("DEEAD64A-A89F-49DF-8D71-C5F8465195A3");//EEIT Id
		teamInviteVO.setTeamMemberId("5D364BF9-CA21-4788-96EF-C1CF92F630B6");

		ApplicationContext context = new AnnotationConfigApplicationContext(TeamInviteConfig.class);
		TeamInviteDAO_I dao = (TeamInviteDAO) context.getBean(TeamInviteDAO.class);

		try
		{
			dao.add(teamInviteVO);
//			dao.delete(4, "DEEAD64A-A89F-49DF-8D71-C5F8465195A3");
//			System.out.println(dao.getByTeam(4).get(0).getInvId());
//			List<InvitationVO> invits = dao.getByTeam(4);
//			for (InvitationVO vo : invits)
//			{
//				System.out.println(vo.getInvId());
//				System.out.println(vo.getTeamId());
//			}

			System.out.println("good");
		}
		catch (Exception e)
		{
			e.printStackTrace();
			System.out.println("幹");
		}
		((AnnotationConfigApplicationContext) context).close();
	}

}
