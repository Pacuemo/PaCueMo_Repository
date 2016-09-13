package _9_41_member_model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository("MemberDAO")
public class MemberDAO_Spring implements MemberDAO_interface_Spring
{

	private JdbcOperations jdbc;
	private static final String INSERT_STMT = "INSERT dbo.Member( memberId, memberFirstName ,memberLastName ,memberPassword ,memberBirthday ,memberPhone ,memberMail,"
			+ " memberPoint ,memberHaveCard ,memberType ,memberRgDateTime, memberMailStatus, member2StepVerify"
			+ ") VALUES ( NEWID(),?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )";
	private static final String INSERT_STMT_fb = "INSERT dbo.Member( memberId, memberFirstName ,memberLastName ,memberBirthday ,memberPhone ,memberMail,"
			+ " memberPoint ,memberHaveCard ,memberFBId ,memberType ,memberRgDateTime, memberMailStatus, member2StepVerify"
			+ ") VALUES ( NEWID(),?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )";
	private static final String GET_ALL_STMT = "SELECT * FROM dbo.Member WHERE memberId = ? ORDER BY memberId";
	private static final String GET_ONE_STMT = "SELECT * FROM dbo.Member WHERE memberId = ?";
	private static final String GET_ONE_STMT_BY_MAIL = "SELECT * FROM dbo.Member WHERE memberMail = ?";
	private static final String GET_ONE_STMT_BY_FBID = "SELECT * FROM dbo.Member WHERE memberFBId = ?";
	private static final String UPDATE = "UPDATE dbo.Member SET memberPhone = ?, memberMail = ? WHERE memberId = ?";
	private static final String UPDATE_FBID = "UPDATE dbo.Member SET memberFBId = ?, memberImgUrl = ? WHERE memberId = ?";
	private static final String UPDATE_SKEY = "UPDATE dbo.Member SET memberSecretKey = ?, member2StepVerify = ? WHERE memberId = ?";
	private static final String UPDATE_PASSWORD_BY_PK = "UPDATE dbo.Member SET memberPassword = ?, memberOutDate = ? WHERE memberId = ?";
	private static final String UPDATE_FORGETPWD_BY_MAIL = "UPDATE dbo.Member SET memberOutDate = ?, memberValidateCode = ? WHERE memberMail = ?";
	private static final String UPDATE_IMG = "UPDATE dbo.Member SET memberImgUrl = ? WHERE memberId = ?";
	private static final String UPDATE_POINT = "UPDATE dbo.Member SET memberPoint = ? WHERE memberId = ?";
	private static final String UPDATE_PLAYERCARD = "UPDATE dbo.Member SET memberHaveCard = ? WHERE memberId = ?";

	@Autowired
	public MemberDAO_Spring(JdbcOperations jdbcOperations)
	{
		this.jdbc = jdbcOperations;
	}

	@Override
	public int insert(MemberVO memberVO)
	{
		return jdbc.update(INSERT_STMT,
				memberVO.getMemberFirstName(),
				memberVO.getMemberLastName(),
				memberVO.getMemberPassword(),
				memberVO.getMemberBirthday(),
				memberVO.getMemberPhone(),
				memberVO.getMemberMail(),
				1000.0,
				false,
				1,
				new Timestamp(System.currentTimeMillis()),
				false,
				false);
	}

	@Override
	public int insert_fb(MemberVO memberVO)
	{
		return jdbc.update(INSERT_STMT_fb,
				memberVO.getMemberFirstName(),
				memberVO.getMemberLastName(),
				memberVO.getMemberBirthday(),
				memberVO.getMemberPhone(),
				memberVO.getMemberMail(),
				1000.0,
				false,
				memberVO.getMemberFBId(),
				1,
				new Timestamp(System.currentTimeMillis()),
				false,
				false);
	}

	@Override
	public int updateForgetPwdByMail(MemberVO memberVO)
	{
		return jdbc.update(UPDATE_FORGETPWD_BY_MAIL,
				memberVO.getMemberOutDate(),
				memberVO.getMemberValidateCode(),
				memberVO.getMemberMail());
	}

	@Override
	public int updatePasswordByPrimaryKey(MemberVO memberVO)
	{
		return jdbc.update(UPDATE_PASSWORD_BY_PK,
				memberVO.getMemberPassword(),
				memberVO.getMemberOutDate(),
				memberVO.getMemberId());
	}

	@Override
	public int updateTwoStepVerifyByPrimaryKey(MemberVO memberVO)
	{
		return jdbc.update(UPDATE_SKEY,
				memberVO.getMemberSecretKey(),
				memberVO.getMember2StepVerify(),
				memberVO.getMemberId());
	}

	@Override
	public int updateFbIdByPrimaryKey(MemberVO memberVO)
	{
		return jdbc.update(UPDATE_FBID,
				memberVO.getMemberFBId(),
				memberVO.getMemberImgUrl(),
				memberVO.getMemberId());
	}

	@Override
	public int updatePlayercard(MemberVO memberVO)
	{
		return jdbc.update(UPDATE_PLAYERCARD,
				memberVO.getMemberHaveCard(),
				memberVO.getMemberId());
	}

	@Override
	public int updateMemberInfo()
	{
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateMemberImg(MemberVO memberVO)
	{
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MemberVO findByPrimaryKey(String memberId)
	{
		try
		{
			return jdbc.queryForObject(GET_ONE_STMT, new MemberRowMapper(), memberId);
		}
		catch (EmptyResultDataAccessException e)
		{

			return null;
		}
	}

	@Override
	public MemberVO findByUserMail(String memberMail)
	{

		try
		{
			return jdbc.queryForObject(GET_ONE_STMT_BY_MAIL, new MemberRowMapper(), memberMail);

		}
		catch (EmptyResultDataAccessException e)
		{

			return null;
		}

	}

	@Override
	public MemberVO findByUserFBID(String fbId)
	{
		try
		{
			return jdbc.queryForObject(GET_ONE_STMT_BY_FBID, new MemberRowMapper(), fbId);
		}
		catch (EmptyResultDataAccessException e)
		{

			return null;
		}
	}

	@Override
	public int updatePointByPrimaryKey(MemberVO memberVO)
	{
		return jdbc.update(UPDATE_POINT,
				memberVO.getMemberPoint(),
				memberVO.getMemberId());
	}

	@Override
	public List<MemberVO> getAll()
	{
		// TODO Auto-generated method stub
		return null;
	}

	//mapRow
	private static final class MemberRowMapper implements RowMapper<MemberVO>
	{

		public MemberVO mapRow(ResultSet rs, int rowNum) throws SQLException
		{
			return new MemberVO(
					rs.getString("memberId"),
					rs.getString("memberFirstName"),
					rs.getString("memberLastName"),
					rs.getString("memberPassword"),
					rs.getDate("memberBirthday"),
					rs.getString("memberPhone"),
					rs.getString("memberMail"),
					rs.getString("memberImgUrl"),
					rs.getDouble("memberPoint"),
					rs.getBoolean("memberHaveCard"),
					rs.getString("memberFBId"),
					rs.getInt("memberType"),
					rs.getTimestamp("memberRgDateTime"),
					rs.getBoolean("memberMailStatus"),
					rs.getTimestamp("memberOutDate"),
					rs.getString("memberValidateCode"),
					rs.getString("memberSecretKey"),
					rs.getBoolean("member2StepVerify"));
		}
	}

}
