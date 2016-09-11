package _9_53_goodsorder_model;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class GoodsOrderRowMapper implements RowMapper<GoodsOrderVO>
{

	@Override
	public GoodsOrderVO mapRow(ResultSet rs, int rowNum) throws SQLException
	{
		GoodsOrderVO gdVO = new GoodsOrderVO();
		gdVO.setOrderId(rs.getInt("orderId"));
		gdVO.setMemberId(rs.getString("memberId"));
		gdVO.setCardNum(rs.getString("cardNum"));
		gdVO.setFullName(rs.getString("fullName"));
		gdVO.setExpireYY(rs.getString("expireYY"));
		gdVO.setExpireMM(rs.getString("expireMM"));
		gdVO.setCvc(rs.getString("cvc"));
		gdVO.setNtdQty(rs.getInt("ntdQty"));
		gdVO.setCoinQty(rs.getDouble("coinQty"));
		gdVO.setOrderDateTime(rs.getTimestamp("orderDateTime"));
		gdVO.setIsPay(rs.getBoolean("isPay"));
		return gdVO;
	}

}
