package _9_51_battleset_model;

import java.util.List;

public interface BattleSetDAO_interface
{
	public void insert(BattleSetVO vo);

	public void delete(Integer battleId);

	public void update(BattleSetVO vo);

	public BattleSetVO findByPrimaryKey(Integer battleId);

	public List<BattleSetVO> getAll();

	public List<BattleSetVO> getSetsById(Integer battleId);

	public List<BattleSetVO> getSetsByDate(String queryDate);
}
