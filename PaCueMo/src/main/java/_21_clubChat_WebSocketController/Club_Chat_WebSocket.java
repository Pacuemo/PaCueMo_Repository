package _21_clubChat_WebSocketController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import com.google.gson.Gson;

import _21_club_service.ClubChat_Service;
import _9_29_chatLike_model.ChatLikeVO;
import _9_29_clubChat_model.ClubChatVO;
import _9_29_message_model.MessageVO;

@Controller
public class Club_Chat_WebSocket
{

	@Autowired
	private ClubChat_Service clubChat_Service;
	@Autowired
	private Gson gson;
	@Autowired
	private SimpMessagingTemplate messageing;

//新增劉言
	@MessageMapping("/chatBoard")
	public String addChat(ClubChatVO chatVO)
	{
		int success = clubChat_Service.add_One_Chate(chatVO);
		if (success == 1)
		{
			int chatId = clubChat_Service.get_ClubId(chatVO.getClubId(), chatVO.getMemberId());
			chatVO.setChatId(chatId);
			messageing.convertAndSendToUser(String.valueOf(chatVO.getClubId()), "/queue/chatBoard", chatVO);
		}
		return null;
	}

	//新增message
	@MessageMapping("/message")
	public String addMessage(MessageVO messageVO)
	{
		int success = clubChat_Service.add_One_Message(messageVO);

		if (success == 1)
		{
			messageing.convertAndSendToUser(String.valueOf(messageVO.getClubId()), "/queue/message", messageVO);
		}
		return null;
	}

	//新增喜歡
	@MessageMapping("/chatLike")
	public String addChatLike(ChatLikeVO chatLikeVO)
	{
		int success = clubChat_Service.add_One_ChatLike(chatLikeVO);
		if (success == 1)
		{
			messageing.convertAndSendToUser(String.valueOf(chatLikeVO.getClubId()), "/queue/chatLike", chatLikeVO);

		}
		return null;
	}

}
