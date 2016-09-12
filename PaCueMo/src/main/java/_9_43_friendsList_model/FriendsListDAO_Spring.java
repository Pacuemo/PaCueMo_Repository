package _9_43_friendsList_model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository("FriendsListDAO")
public class FriendsListDAO_Spring implements FriendsListDAO_interface_Spring
{

	private JdbcOperations jdbc;
	private final String GET_ALL_FRIENDS = "SELECT * FROM friendsList WHERE memberId = ? AND memberStatus='1'";
	private final String GET_ALL_INVITE = "SELECT * FROM friendsList WHERE memberId = ? AND memberStatus='2'";
	private final String Delete_friend = "DELETE FROM dbo.FriendsList WHERE memberId= ? AND memberFriendId= ? ";

	@Autowired
	public FriendsListDAO_Spring(JdbcOperations jdbcOperations)
	{
		this.jdbc = jdbcOperations;
	}

	/* type 1 為朋友 type2 為邀請中 */
	@Override
	public List<FriendsListVO> getAllFriends(String memberId)
	{
		return jdbc.query(GET_ALL_FRIENDS, new FriendsListMapper(), memberId);
	}

	@Override
	public List<FriendsListVO> getAllFriendsInvite(String memberId)
	{
		return jdbc.query(GET_ALL_INVITE, new FriendsListMapper(), memberId);
	}

	@Override
	public int deleteFriend(FriendsListVO friendsListVO)
	{
		return jdbc.update(Delete_friend,
				friendsListVO.getMemberId(),
				friendsListVO.getMemberFriendId());
	}

	//mapRow
	private static final class FriendsListMapper implements RowMapper<FriendsListVO>
	{

		public FriendsListVO mapRow(ResultSet rs, int rowNum) throws SQLException
		{
			return new FriendsListVO(
					rs.getString("memberId"),
					rs.getString("memberFriendId"),
					rs.getInt("memberStatus"));
		}
	}

}
