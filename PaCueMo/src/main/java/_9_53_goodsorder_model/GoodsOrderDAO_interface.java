package _9_53_goodsorder_model;

import java.util.List;

public interface GoodsOrderDAO_interface
{
	public int insert(GoodsOrderVO vo);

	public int update(GoodsOrderVO vo);

	public int delete(Integer orderId);

	public GoodsOrderVO findByPrimaryKey(Integer orderId);

	public List<GoodsOrderVO> getAll();

}
