package _9_29_chatLike_model;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class ChatLikeVO implements Serializable
{

	private static final long serialVersionUID = 1L;

	private int chatId;
	private String memberName;
	private String memberId;

	public ChatLikeVO()
	{

	}

	public ChatLikeVO(int chatId, String memberName, String memberId)
	{

		this.chatId = chatId;
		this.memberName = memberName;
		this.memberId = memberId;
	}

	public int getChatId()
	{
		return chatId;
	}

	public void setChatId(int chatId)
	{
		this.chatId = chatId;
	}

	public String getMemberName()
	{
		return memberName;
	}

	public void setMemberName(String memberName)
	{
		this.memberName = memberName;
	}

	public String getMemberId()
	{
		return memberId;
	}

	public void setMemberId(String memberId)
	{
		this.memberId = memberId;
	}

}
