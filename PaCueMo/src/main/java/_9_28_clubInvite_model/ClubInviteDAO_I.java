package _9_28_clubInvite_model;

import java.util.List;

public interface ClubInviteDAO_I
{

	//新增
	int add_One(ClubInviteVO VO);

	//刪除
	int delete_One(int clubId, String MemberId);

	//透過memberId查詢
	List<ClubInviteVO> get_All_MemberId(String MemberId);

}
