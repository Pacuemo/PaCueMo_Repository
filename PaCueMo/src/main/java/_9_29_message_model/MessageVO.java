package _9_29_message_model;

import java.io.Serializable;
import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component
public class MessageVO implements Serializable
{

	private static final long serialVersionUID = 1L;

	private int messageId;
	private int chatId;
	private String memberId;
	private String memberName;
	private String memberUrl;
	private String memberFBId;
	private String content;
	private Timestamp chatDateTime;

	public MessageVO()
	{

	}

	public MessageVO(int messageId, int chatId, String memberId, String memberName, String memberUrl, String memberFBId, String content, Timestamp chatDateTime)
	{

		this.chatId = chatId;
		this.messageId = messageId;
		this.memberId = memberId;
		this.memberName = memberName;
		this.memberUrl = memberUrl;
		this.memberFBId = memberFBId;
		this.content = content;
		this.chatDateTime = chatDateTime;
	}

	public int getMessageId()
	{
		return messageId;
	}

	public void setMessageId(int messageId)
	{
		this.messageId = messageId;
	}

	public String getMemberFBId()
	{
		return memberFBId;
	}

	public void setMemberFBId(String memberFBId)
	{
		this.memberFBId = memberFBId;
	}

	public int getChatId()
	{
		return chatId;
	}

	public void setChatId(int chatId)
	{
		this.chatId = chatId;
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

	public String getMemberUrl()
	{
		return memberUrl;
	}

	public void setMemberUrl(String memberUrl)
	{
		this.memberUrl = memberUrl;
	}

	public String getContent()
	{
		return content;
	}

	public void setContent(String content)
	{
		this.content = content;
	}

	public Timestamp getChatDateTime()
	{
		return chatDateTime;
	}

	public void setChatDateTime(Timestamp chatDateTime)
	{
		this.chatDateTime = chatDateTime;
	}

}
