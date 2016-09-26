package _21_club_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import _9_29_chatLike_model.ChatLikeDAO_I;
import _9_29_chatLike_model.ChatLikeVO;
import _9_29_clubChat_model.ClubChatDAO_I;
import _9_29_clubChat_model.ClubChatVO;
import _9_29_message_model.MessageDAO_I;
import _9_29_message_model.MessageVO;

@Component
public class ClubChat_Service
{

	@Autowired
	private ClubChatDAO_I clubChatDAO;
	@Autowired
	private MessageDAO_I messageDAO;
	@Autowired
	private ChatLikeDAO_I chatLikeDAO;

//新增社團聊天主題
	public int add_One_Chate(ClubChatVO clubChatVO)
	{

		return clubChatDAO.add_One_By_ChatVO(clubChatVO);

	}

//新增社團聊天訊息
	public int add_One_Message(MessageVO messageVO)
	{

		return messageDAO.add_One_By_MessageVO(messageVO);

	}

//查詢留言訊息
	public List<ClubChatVO> get_All_ClubChat_By_ClubId(int clubId, String memberId)
	{

		List<ClubChatVO> clubChatVOs = clubChatDAO.get_All_By_ClubId(clubId);
		for (ClubChatVO clubChatVO : clubChatVOs)
		{
			int chatId = clubChatVO.getChatId();
			List<MessageVO> messageVOs = messageDAO.get_All_By_ChatId(chatId);
			clubChatVO.setMessageVOs(messageVOs);
			clubChatVO.setMessageCount(messageVOs.size());
			List<ChatLikeVO> chatLikeVOs = chatLikeDAO.Select_All_ChatLike(chatId);
			clubChatVO.setChatLikeVOs(chatLikeVOs);
			clubChatVO.setLike(chatLikeVOs.size());
			clubChatVO.setHasClick(chatLikeDAO.Has_Click_Like(chatId, memberId));
		}
		return clubChatVOs;
	}

	//新增社團聊天LIKE
	public int add_One_ChatLike(ChatLikeVO chatLikeVO)
	{

		return chatLikeDAO.add_One_ChatLike(chatLikeVO);

	}

	public int get_ClubId(int clubId, String memberId)
	{
		return clubChatDAO.Select_ClubId(clubId, memberId);
	}

}
