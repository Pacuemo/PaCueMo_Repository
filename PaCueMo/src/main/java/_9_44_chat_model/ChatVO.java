package _9_44_chat_model;

import java.sql.Date;

public class ChatVO
{
	private String memberId;
	private String memberName;
	private String friendId;
	private String friendName;
	private String message;
	private Date messageTime;

	public ChatVO()
	{
		super();
	}

	public ChatVO(String memberId, String memberName, String friendId, String friendName, String message, Date messageTime)
	{
		super();
		this.memberId = memberId;
		this.memberName = memberName;
		this.friendId = friendId;
		this.friendName = friendName;
		this.message = message;
		this.messageTime = messageTime;
	}

	public String getMemberId()
	{
		return memberId;
	}

	public void setMemberId(String memberId)
	{
		this.memberId = memberId;
	}

	public String getMemberName()
	{
		return memberName;
	}

	public void setMemberName(String memberName)
	{
		this.memberName = memberName;
	}

	public String getFriendId()
	{
		return friendId;
	}

	public void setFriendId(String friendId)
	{
		this.friendId = friendId;
	}

	public String getFriendName()
	{
		return friendName;
	}

	public void setFriendName(String friendName)
	{
		this.friendName = friendName;
	}

	public String getMessage()
	{
		return message;
	}

	public void setMessage(String message)
	{
		this.message = message;
	}

	public Date getMessageTime()
	{
		return messageTime;
	}

	public void setMessageTime(Date messageTime)
	{
		this.messageTime = messageTime;
	}

}
