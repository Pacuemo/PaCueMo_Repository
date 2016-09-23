package _9_26_fightRecord_model;

import java.util.List;

public interface FightRecordDAO_I
{

	List<FightRecordVO> find_All_By_clubMemberId(String clubMemberId);

	List<FightRecordVO> find_All_By_fightId(int fightId);

	List<FightRecordVO> find_All_By_clubId(int clubId);

	int add_One(FightRecordVO fightRecordVO);

	int delete_One(int fightId, String memberId);

	int delete_ALL(int fightId);

	FightRecordVO get_One(int fightId, String memberId);

}
