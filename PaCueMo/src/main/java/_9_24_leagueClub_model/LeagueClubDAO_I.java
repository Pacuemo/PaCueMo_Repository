package _9_24_leagueClub_model;

import java.util.List;

public interface LeagueClubDAO_I
{

	//查詢全部
	List<LeagueClubVO> find_ALL(int leagueId);

	//新增
	int add_One(LeagueClubVO leagueClubVO);

	//刪除
	int delete_One(LeagueClubVO leagueClubVO);

}
