package _9_13_invitation_model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository("InvitationDAO")
public class InvitationDAO implements InvitationDAO_I
{
	private JdbcOperations jdbc;

	public InvitationDAO()
	{
	}

	@Autowired
	public InvitationDAO(JdbcOperations jdbc)
	{
		this.jdbc = jdbc;
	}

	private static final String SELECT_BY_MEMBERA_ALL = "SELECT * FROM Invitation WHERE memberA = ?";
	private static final String SELECT_BY_MEMBERA = "SELECT * FROM Invitation WHERE memberA = ? AND invstatus = 0";
	private static final String SELECT_BY_MEMBERB_ALL = "SELECT * FROM Invitation WHERE memberB = ?";
	private static final String SELECT_BY_MEMBERB = "SELECT * FROM Invitation WHERE memberB = ? AND invstatus = 0";
	private static final String SELECT_BY_TEAM = "SELECT * FROM Invitation WHERE teamId = ? AND invstatus = 0";
	private static final String SELECT_BY_CLUB = "SELECT * FROM Invitation WHERE clubId = ? AND invstatus = 0";
	private static final String INSERT = "INSERT INTO Invitation (memberA, memberB, teamId, clubId, invstatus) VALUES (?, ?, ?, ?, 0)";
	private static final String DELETE = "DELETE FROM Invitation WHERE invId = ?";

	/*
	 * (non-Javadoc)
	 * @see _9_13_invitation_model.Ivitation_I#getByTeam(java.lang.Integer)
	 */
	@Override
	public List<InvitationVO> getByTeam(Integer teamId)
	{
		return jdbc.query(SELECT_BY_TEAM, new InvitationRowMapper(), teamId);
	}

	/*
	 * (non-Javadoc)
	 * @see _9_13_invitation_model.Ivitation_I#getByClub(java.lang.Integer)
	 */
	@Override
	public List<InvitationVO> getByClub(Integer clubId)
	{
		return jdbc.query(SELECT_BY_CLUB, new InvitationRowMapper(), clubId);
	}

	/*
	 * (non-Javadoc)
	 * @see _9_13_invitation_model.Ivitation_I#getByMemberA_ALL(java.lang.String)
	 */
	@Override
	public List<InvitationVO> getByMemberA_ALL(String memberId)
	{
		return jdbc.query(SELECT_BY_MEMBERA_ALL, new InvitationRowMapper(), memberId);
	}

	/*
	 * (non-Javadoc)
	 * @see _9_13_invitation_model.Ivitation_I#getByMemberA(java.lang.String)
	 */
	@Override
	public List<InvitationVO> getByMemberA(String memberId)
	{
		return jdbc.query(SELECT_BY_MEMBERA, new InvitationRowMapper(), memberId);
	}

	/*
	 * (non-Javadoc)
	 * @see _9_13_invitation_model.Ivitation_I#getByMemberB_ALL(java.lang.String)
	 */
	@Override
	public List<InvitationVO> getByMemberB_ALL(String memberId)
	{
		return jdbc.query(SELECT_BY_MEMBERB_ALL, new InvitationRowMapper(), memberId);
	}

	/*
	 * (non-Javadoc)
	 * @see _9_13_invitation_model.Ivitation_I#getByMemberB(java.lang.String)
	 */
	@Override
	public List<InvitationVO> getByMemberB(String memberId)
	{
		return jdbc.query(SELECT_BY_MEMBERB, new InvitationRowMapper(), memberId);
	}

	// 新增
	/*
	 * (non-Javadoc)
	 * @see _9_13_invitation_model.Ivitation_I#add(_9_13_invitation_model.InvitationVO)
	 */
	@Override
	public void add(InvitationVO invitationVO)
	{
		jdbc.update(INSERT, invitationVO.getMemberA(), invitationVO.getMemberB(), invitationVO.getTeamId(), invitationVO.getClubId());
	}

	// 刪除
	/*
	 * (non-Javadoc)
	 * @see _9_13_invitation_model.Ivitation_I#delete(java.lang.Integer)
	 */
	@Override
	public void delete(Integer invId)
	{
		jdbc.update(DELETE, invId);
	}

	private static final class InvitationRowMapper implements RowMapper<InvitationVO>
	{
		@Override
		public InvitationVO mapRow(ResultSet rs, int rowNum) throws SQLException
		{
			return new InvitationVO(rs.getInt("invId"), rs.getString("memberA"), rs.getString("memberB"),
					rs.getInt("teamId"), rs.getInt("clubId"), rs.getInt("invstatus"));
		}
	}

	public static void main(String[] args)
	{
		String insert = "INSERT INTO dbo.Invitation (memberA, memberB, teamId, clubId, invstatus)"
				+ " VALUES ('5D364BF9-CA21-4788-96EF-C1CF92F630B6', 'B660A9A0-CE10-45BB-B6A5-FF516102E880', 4, NULL, 0)";
		InvitationVO invitationVO = new InvitationVO();
		invitationVO.setMemberA("6B3F8AE1-B555-43CF-BB51-A809B1D2573A");//home laptop Id
		invitationVO.setMemberB("7CC8A025-9060-4642-85CC-C89C3E67302A");
		invitationVO.setTeamId(4);
		invitationVO.setClubId(0);
		invitationVO.setInvstatus(0);

		ApplicationContext context = new AnnotationConfigApplicationContext(InvitationConfig.class);
		InvitationDAO_I dao = (InvitationDAO_I) context.getBean("InvitationDAO");

		try
		{
			dao.add(invitationVO);
//			dao.delete(1);
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
