package _45_websocket_test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.annotation.SendToUser;
import org.springframework.stereotype.Controller;

import com.google.gson.Gson;

import _43_member_service.MemberService;
import _9_43_friendsList_model.FriendsListDAO_interface_Spring;
import _9_44_chat_model.ChatVO;

@Controller
public class TestWebSocketController
{
	@Autowired
	private SimpMessagingTemplate messaging;
	@Autowired
	private FriendsListDAO_interface_Spring dao;
	@Autowired
	private MemberService ms;
	@Autowired
	private Gson gson;

	@MessageMapping("/friendslist")
	@SendToUser("/queue/fd")
	public String friendList(String key)
	{
		messaging.convertAndSendToUser(key, "/queue/fd", gson.toJson(ms.showAllFriends(key)));
		return null;

	}

	@MessageMapping("/chat")
	@SendToUser("/queue/chat")
	public ChatVO chat(ChatVO chatVO)
	{
		System.out.println(chatVO.getMemberId());
		System.out.println(chatVO.getMessage());
		messaging.convertAndSendToUser(chatVO.getFriendId(), "/queue/chat", chatVO);
		return null;

	}

//	@SubscribeMapping({ "/test" })
//	public List<FriendsListVO> handleSubscription()
//	{
//		return dao.getAllFriends("476903C9-9720-4504-8BE6-FCEA58E5E38B");
//	}

//	@MessageMapping("/friendslist")
//	@SendToUser("/queue/test/test")
//	public Shout handleShout(String message)
//	{
//		Shout outgoing = new Shout();
//		outgoing.setName("test");
//		outgoing.setMessage(message);
//		outgoing.setTimestamp(new Timestamp(System.currentTimeMillis()));
//		messaging.convertAndSendToUser("tw11509", "/queue/test/test", "fuck");
//		return outgoing;
//
//	}
}
