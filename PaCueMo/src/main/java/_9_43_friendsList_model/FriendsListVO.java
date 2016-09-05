package _9_43_friendsList_model;

import java.io.Serializable;

public class FriendsListVO implements Serializable
{

	private static final long serialVersionUID = 1L;
	private String memberId;
	private String memberFriendId;
	private int friendStatus;

	public String getMemberId()
	{
		return memberId;
	}

	public void setMemberId(String memberId)
	{
		this.memberId = memberId;
	}

	public String getMemberFriendId()
	{
		return memberFriendId;
	}

	public void setMemberFriendId(String memberFriendId)
	{
		this.memberFriendId = memberFriendId;
	}

	public int getFriendStatus()
	{
		return friendStatus;
	}

	public void setFriendStatus(int friendStatus)
	{
		this.friendStatus = friendStatus;
	}

}
