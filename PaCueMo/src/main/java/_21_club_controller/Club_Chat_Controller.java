package _21_club_controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import _21_club_service.ClubChat_Service;
import _9_29_chatLike_model.ChatLikeVO;
import _9_29_clubChat_model.ClubChatVO;
import _9_29_message_model.MessageVO;

@Controller
@RequestMapping(value = "/clubChat")
public class Club_Chat_Controller
{

	@Autowired
	private ClubChat_Service clubChat_Service;
	@Autowired
	private Gson gson;

	@RequestMapping(value = "/getAll", method = RequestMethod.GET)
	public String getAll(int clubId, String memberId, HttpServletRequest request)
	{
		request.setAttribute("clubChats", clubChat_Service.get_All_ClubChat_By_ClubId(clubId, memberId));
		return "/club/Message";
	}

//新增劉言
	@ResponseBody
	@RequestMapping(value = "/addChat", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public String addChat(@RequestBody ClubChatVO chatVO)
	{

		int success = clubChat_Service.add_One_Chate(chatVO);
		int chatId = clubChat_Service.get_ClubId(chatVO.getClubId(), chatVO.getMemberId());
		HashMap<String, Object> message = new HashMap<String, Object>();
		message.put("status", success);
		message.put("chatId", chatId);
		return gson.toJson(message);
	}

	//新增message
	@ResponseBody
	@RequestMapping(value = "/addMessage", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public String addMessage(@RequestBody MessageVO messageVO)
	{
		int success = clubChat_Service.add_One_Message(messageVO);
		HashMap<String, Object> message = new HashMap<String, Object>();
		message.put("status", success);
		return gson.toJson(message);
	}

	//新增message
	@ResponseBody
	@RequestMapping(value = "/addChatLike", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public String addChatLike(@RequestBody ChatLikeVO chatLikeVO)
	{
		int success = clubChat_Service.add_One_ChatLike(chatLikeVO);
		HashMap<String, Object> message = new HashMap<String, Object>();
		message.put("status", success);
		return gson.toJson(message);
	}

}
