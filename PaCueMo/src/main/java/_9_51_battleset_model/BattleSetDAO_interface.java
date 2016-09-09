package _9_51_battleset_model;

import java.util.List;

public interface BattleSetDAO_interface
{
	public void insert(BattleSetVO vo);

	public int delete(Integer battleId);

	public int update(BattleSetVO vo);

	public BattleSetVO findByPrimaryKey(Integer battleId);

	public List<BattleSetVO> getAll();

	public List<BattleSetVO> getSetsById(Integer battleId);

	public List<BattleSetVO> getSetsByDate(String queryDate);

	public Integer getBattleSetsCountByDate(String queryDate);

	public List<BattleSetVO> getSetsByDateAndPage(String queryDate, Integer pageNo);

	public List<BattleSetVO> getSetsByIdAndPage(Integer teamId, Integer pageNo);

}
