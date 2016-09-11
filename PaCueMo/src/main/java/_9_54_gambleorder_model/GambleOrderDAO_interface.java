package _9_54_gambleorder_model;

import java.util.List;

public interface GambleOrderDAO_interface
{
	public Integer insert(GambleOrderVO vo);

	public Integer update(GambleOrderVO vo);

	public Integer delete(Integer gambleId);

	public GambleOrderVO findByPrimaryKey(Integer gambleId);

	public List<GambleOrderVO> getAll();

}
