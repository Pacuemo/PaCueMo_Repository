package _9_24_leagueClub_model;

import java.util.List;

public interface LeagueClubDAO_I
{

	//查詢全部
	List<LeagueClubVO> find_ALL(int leagueId);

	List<LeagueClubVO> get_ClubVOs_By_ClubId(int clubId);

	//新增
	int add_One(LeagueClubVO leagueClubVO);

	//刪除
	int delete_One(LeagueClubVO leagueClubVO);

}
