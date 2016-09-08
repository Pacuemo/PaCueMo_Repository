package _9_25_leagueRecord_model;

import java.util.List;

public interface LeagueRecordDAO_I
{

	List<LeagueRecordVO> find_One(int leagueId, int clubId);

	List<LeagueRecordVO> find_All(int leagueId);

	int add_One(LeagueRecordVO VO);

	int delete_One(int fightId);

	int update_One(LeagueRecordVO VO);

}
