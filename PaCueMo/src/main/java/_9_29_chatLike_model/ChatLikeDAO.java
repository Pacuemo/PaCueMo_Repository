package _9_29_chatLike_model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class ChatLikeDAO implements ChatLikeDAO_I
{

	@Autowired
	private JdbcOperations jdbc;

	private static final String Select_All_ChatLike = "select chatId,memberName,memberId from chatLike where chatId=?";
	private static final String add_One_ChatLike = "insert into ChatLike values (?,?,?)";
	private static final String Has_Click_Like = "select count(*) from chatLike where chatId=? and memberId=?";

	private static final class ChatLikeMapper implements RowMapper<ChatLikeVO>
	{

		@Override
		public ChatLikeVO mapRow(ResultSet rs, int rowNum) throws SQLException
		{

			return new ChatLikeVO(rs.getInt("chatId"),
					rs.getString("memberName"),
					rs.getString("memberId"));
		}

	}

	@Override
	public List<ChatLikeVO> Select_All_ChatLike(int chatId)
	{
		return jdbc.query(Select_All_ChatLike, new ChatLikeMapper(), chatId);
	}

	@Override
	public int Has_Click_Like(int chatId, String memberId)
	{
		try
		{
			return jdbc.queryForObject(Has_Click_Like, Integer.class, chatId, memberId);
		}
		catch (Exception e)
		{
			return 0;
		}

	}

	@Override
	public int add_One_ChatLike(ChatLikeVO chatLikeVO)
	{
		return jdbc.update(add_One_ChatLike,
				chatLikeVO.getChatId(),
				chatLikeVO.getMemberName(),
				chatLikeVO.getMemberId());

	}

}
