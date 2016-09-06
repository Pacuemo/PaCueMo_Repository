package _9_23_league_model;

import java.util.List;

public interface LeagueDAO_I
{

	//查詢BY NAME
	List<LeagueVO> find_by_name(String name);

	//查詢全部
	List<LeagueVO> find_All();

	//查尋
	LeagueVO findOne(int id);

	//新增
	int addOne(LeagueVO VO);

	//刪除
	int deleteOne(int leagueId);

	//修改
	int updateOne(LeagueVO VO);

}
