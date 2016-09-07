package _9_27_clubApply_model;

import java.util.List;

public interface ClubApplyDAO_I
{

	//新增
	int add_One(ClubApplyVO VO);

	//刪除
	int delete_One(int clubId, String MemberId);

	//透過memberId查詢
	List<ClubApplyVO> get_All_MemberId(String MemberId);

	//透過clubId查詢
	List<ClubApplyVO> get_All_ClubId(int ClubId);

}
