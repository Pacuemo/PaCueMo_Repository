package _9_53_goodsorder_model;

public class GoodsOrderVO
{
	private Integer orderId;
	private String memberId;
	private String cardNum;
	private String fullName;
	private String expireMM;
	private String expireYY;
	private String cvc;
	private Integer ntdQty;
	private Integer coinQty;
	private java.sql.Timestamp orderDateTime;
	private Boolean isPay;

	public GoodsOrderVO()
	{

	}

	public Integer getOrderId()
	{
		return orderId;
	}

	public void setOrderId(Integer orderId)
	{
		this.orderId = orderId;
	}

	public String getMemberId()
	{
		return memberId;
	}

	public void setMemberId(String memberId)
	{
		this.memberId = memberId;
	}

	public String getCardNum()
	{
		return cardNum;
	}

	public void setCardNum(String cardNum)
	{
		this.cardNum = cardNum;
	}

	public String getFullName()
	{
		return fullName;
	}

	public void setFullName(String fullName)
	{
		this.fullName = fullName;
	}

	public String getExpireMM()
	{
		return expireMM;
	}

	public void setExpireMM(String expireMM)
	{
		this.expireMM = expireMM;
	}

	public String getExpireYY()
	{
		return expireYY;
	}

	public void setExpireYY(String expireYY)
	{
		this.expireYY = expireYY;
	}

	public String getCvc()
	{
		return cvc;
	}

	public void setCvc(String cvc)
	{
		this.cvc = cvc;
	}

	public Integer getNtdQty()
	{
		return ntdQty;
	}

	public void setNtdQty(Integer ntdQty)
	{
		this.ntdQty = ntdQty;
	}

	public Integer getCoinQty()
	{
		return coinQty;
	}

	public void setCoinQty(Integer coinQty)
	{
		this.coinQty = coinQty;
	}

	public java.sql.Timestamp getOrderDateTime()
	{
		return orderDateTime;
	}

	public void setOrderDateTime(java.sql.Timestamp orderDateTime)
	{
		this.orderDateTime = orderDateTime;
	}

	public Boolean getIsPay()
	{
		return isPay;
	}

	public void setIsPay(Boolean isPay)
	{
		this.isPay = isPay;
	}

}
