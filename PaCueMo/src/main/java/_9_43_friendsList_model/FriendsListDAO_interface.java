package _9_43_friendsList_model;

import java.util.List;

public interface FriendsListDAO_interface
{
	public List<FriendsListVO> getAllFriends(String memberId);

	public List<FriendsListVO> getAllFriendsInvite(String memberId);

	public int deleteFriend(String memberId, String friendId);
}
