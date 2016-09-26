package _9_29_message_model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class MessageDAO implements MessageDAO_I
{

	@Autowired
	private JdbcOperations jdbc;
	private static final String Select_All_Message = "select * from message where chatId=?";
	private static final String Add_One_ClubChat = "insert into message values (?,?,?,?,?,?,?)";

	private static final class MessageRowMapper implements RowMapper<MessageVO>
	{

		@Override
		public MessageVO mapRow(ResultSet rs, int rowNum) throws SQLException
		{

			return new MessageVO(rs.getInt("messageId"),
					rs.getInt("chatId"),
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
	public List<MessageVO> get_All_By_ChatId(int chatId)
	{

		return jdbc.query(Select_All_Message, new MessageRowMapper(), chatId);
	}

	//新增
	@Override
	public int add_One_By_MessageVO(MessageVO messageVO)
	{

		return jdbc.update(Add_One_ClubChat,
				messageVO.getChatId(),
				messageVO.getMemberId(),
				messageVO.getMemberName(),
				messageVO.getMemberUrl(),
				messageVO.getMemberFBId(),
				messageVO.getContent(),
				messageVO.getChatDateTime());
	}
}
