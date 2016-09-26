package _9_29_clubChat_model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

import org.springframework.stereotype.Component;

import _9_29_chatLike_model.ChatLikeVO;
import _9_29_message_model.MessageVO;

@Component
public class ClubChatVO implements Serializable
{

	private static final long serialVersionUID = 1L;

	private int chatId;
	private int clubId;
	private String memberId;
	private String memberName;
	private String memberUrl;
	private String memberFBId;
	private String content;
	private Timestamp chatDateTime;
	private List<MessageVO> messageVOs;
	private int messageCount;
	private List<ChatLikeVO> chatLikeVOs;
	private int like;
	private int hasClick;

	public ClubChatVO()
	{

	}

	public ClubChatVO(int chatId, int clubId, String memberId, String memberName, String memberUrl, String memberFBId, String content, Timestamp timestamp)
	{

		this.chatId = chatId;
		this.clubId = clubId;
		this.memberId = memberId;
		this.memberName = memberName;
		this.memberUrl = memberUrl;
		this.memberFBId = memberFBId;
		this.content = content;
		this.chatDateTime = timestamp;
	}

	public int getChatId()
	{
		return chatId;
	}

	public void setChatId(int chatId)
	{
		this.chatId = chatId;
	}

	public int getClubId()
	{
		return clubId;
	}

	public void setClubId(int clubId)
	{
		this.clubId = clubId;
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

	public List<MessageVO> getMessageVOs()
	{
		return messageVOs;
	}

	public void setMessageVOs(List<MessageVO> messageVOs)
	{
		this.messageVOs = messageVOs;
	}

	public String getMemberFBId()
	{
		return memberFBId;
	}

	public void setMemberFBId(String memberFBId)
	{
		this.memberFBId = memberFBId;
	}

	public int getMessageCount()
	{
		return messageCount;
	}

	public void setMessageCount(int MessageCount)
	{
		this.messageCount = MessageCount;
	}

	public int getLike()
	{
		return like;
	}

	public void setLike(int like)
	{
		this.like = like;
	}

	public List<ChatLikeVO> getChatLikeVOs()
	{
		return chatLikeVOs;
	}

	public void setChatLikeVOs(List<ChatLikeVO> chatLikeVOs)
	{
		this.chatLikeVOs = chatLikeVOs;
	}

	public int getHasClick()
	{
		return hasClick;
	}

	public void setHasClick(int hasClick)
	{
		this.hasClick = hasClick;
	}

}
