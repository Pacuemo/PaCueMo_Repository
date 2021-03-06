package _9_43_friendsList_model;

import java.util.List;

public interface FriendsListDAO_interface_Spring
{
	public List<FriendsListVO> getAllFriends(String memberId);

	public List<FriendsListVO> getAllFriendsInvite(String memberId);

	public List<FriendsListVO> getAllFriendsInviting(String memberId);

	public int deleteFriend(FriendsListVO friendsListVO);

	public FriendsListVO getFriend(FriendsListVO friendsListVO);

	public int insertFriend(FriendsListVO friendsListVO);

	public int updateFriend(FriendsListVO friendsListVO);
}
