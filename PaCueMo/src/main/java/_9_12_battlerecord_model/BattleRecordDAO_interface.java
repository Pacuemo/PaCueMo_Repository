package _9_12_battlerecord_model;

import java.util.List;
import java.util.Set;


public interface BattleRecordDAO_interface {
	   public void insert(BattleRecordVO battleRecordVO);
       public void update(BattleRecordVO battleRecordVO);
       public void delete(Integer batteleRecordId);
       public BattleRecordVO findByPrimaryKey(Integer battleId);
       public BattleRecordVO findByTeamIdA(Integer teamIdA);
       public BattleRecordVO findByTeamIdB(Integer teamIdB);
       public List<BattleRecordVO> getAll();
}
