package _9_29_clubChat_model;

import java.util.List;

public interface ClubChatDAO_I
{

	//查詢
	List<ClubChatVO> get_All_By_ClubId(int clubId);

	//新增
	int add_One_By_ChatVO(ClubChatVO clubChatVO);

	Integer Select_ClubId(int clubId, String memberId);

}
