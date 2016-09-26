package _9_29_message_model;

import java.util.List;

public interface MessageDAO_I
{

	//查詢
	List<MessageVO> get_All_By_ChatId(int chatId);

	//新增
	int add_One_By_MessageVO(MessageVO messageVO);

}
