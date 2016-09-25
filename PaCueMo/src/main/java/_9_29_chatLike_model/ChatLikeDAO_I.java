package _9_29_chatLike_model;

import java.util.List;

public interface ChatLikeDAO_I
{

	List<ChatLikeVO> Select_All_ChatLike(int chatId);

	int Has_Click_Like(int chatId, String memberId);

	int add_One_ChatLike(ChatLikeVO chatLikeVO);

}
