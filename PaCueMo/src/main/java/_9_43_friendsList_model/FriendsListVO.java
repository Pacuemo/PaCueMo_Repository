package _9_43_friendsList_model;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class FriendsListVO implements Serializable
{

	private static final long serialVersionUID = 1L;
	private String memberId;
	private String memberFriendId;
	private int memberStatus;

	public FriendsListVO()
	{

	}

	public FriendsListVO(String memberId, String memberFriendId, int memberStatus)
	{
		super();
		this.memberId = memberId;
		this.memberFriendId = memberFriendId;
		this.memberStatus = memberStatus;
	}

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

	public int getMemberStatus()
	{
		return memberStatus;
	}

	public void setMemberStatus(int memberStatus)
	{
		this.memberStatus = memberStatus;
	}

}
