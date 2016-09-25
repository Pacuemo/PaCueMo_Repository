package _9_29_clubChat_model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class ClubChatDAO implements ClubChatDAO_I
{

	@Autowired
	private JdbcOperations jdbc;

	private static final String Select_All_ClubChat = "select * from clubchat where clubId=? order by chatId desc";
	private static final String Add_One_ClubChat = "insert into clubchat values (?,?,?,?,?,?,?)";
	private static final String Select_ClubId = "select top(1) chatId from clubchat where clubId=? and memberId=? order by chatId desc";

	private static final class ClubChatRowMapper implements RowMapper<ClubChatVO>
	{

		@Override
		public ClubChatVO mapRow(ResultSet rs, int rowNum) throws SQLException
		{

			return new ClubChatVO(rs.getInt("chatId"),
					rs.getInt("clubId"),
					rs.getString("memberId"),
					rs.getString("memberName"),
					rs.getString("memberUrl"),
					rs.getString("memberFBId"),
					rs.getString("content"),
					rs.getTimestamp("chatDateTime"));
		}

	}

	//查詢
	@Override
	public List<ClubChatVO> get_All_By_ClubId(int clubId)
	{

		return jdbc.query(Select_All_ClubChat, new ClubChatRowMapper(), clubId);
	}

	@Override
	public Integer Select_ClubId(int clubId, String memberId)
	{

		return jdbc.queryForObject(Select_ClubId, Integer.class, clubId, memberId);
	}

	//新增
	@Override
	public int add_One_By_ChatVO(ClubChatVO clubChatVO)
	{

		return jdbc.update(Add_One_ClubChat,
				clubChatVO.getClubId(),
				clubChatVO.getMemberId(),
				clubChatVO.getMemberName(),
				clubChatVO.getMemberUrl(),
				clubChatVO.getMemberFBId(),
				clubChatVO.getContent(),
				clubChatVO.getChatDateTime());
	}

}
