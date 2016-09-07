package _9_31_court_model;

import java.io.Serializable;

public class CourtVO implements Serializable
{
	private static final long serialVersionUID = 1L;
	private Integer courtId;
	private String name;
	private String courtaddress;
	private String imgUrl;
	private Double latitue;
	private Double longitue;
	private String webUrl;
	private String phone;

	public Integer getCourtId()
	{
		return courtId;
	}

	public void setCourtId(Integer courtId)
	{
		this.courtId = courtId;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getCourtaddress()
	{
		return courtaddress;
	}

	public void setCourtaddress(String courtaddress)
	{
		this.courtaddress = courtaddress;
	}

	public String getImgUrl()
	{
		return imgUrl;
	}

	public void setImgUrl(String imgUrl)
	{
		this.imgUrl = imgUrl;
	}

	public Double getLatitue()
	{
		return latitue;
	}

	public void setLatitue(Double latitue)
	{
		this.latitue = latitue;
	}

	public Double getLongitue()
	{
		return longitue;
	}

	public void setLongitue(Double longitue)
	{
		this.longitue = longitue;
	}

	public String getWebUrl()
	{
		return webUrl;
	}

	public void setWebUrl(String webUrl)
	{
		this.webUrl = webUrl;
	}

	public String getPhone()
	{
		return phone;
	}

	public void setPhone(String phone)
	{
		this.phone = phone;
	}
}
