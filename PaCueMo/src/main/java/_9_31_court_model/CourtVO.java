package _9_31_court_model;

import java.io.Serializable;

public class CourtVO implements Serializable {

	private Integer courtId;
	private String name;
	private String address;
	private String photo1;
	private Double latitue;
	private Double longitue;
	private String web;
	private String phone;

	public Integer getCourtId() {
		return courtId;
	}

	public void setCourtId(Integer courtId) {
		this.courtId = courtId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhoto1() {
		return photo1;
	}

	public void setPhoto1(String photo1) {
		this.photo1 = photo1;
	}

	public Double getLatitue() {
		return latitue;
	}

	public void setLatitue(Double latitue) {
		this.latitue = latitue;
	}

	public Double getLongitue() {
		return longitue;
	}

	public void setLongitue(Double longitue) {
		this.longitue = longitue;
	}

	public String getWeb() {
		return web;
	}

	public void setWeb(String web) {
		this.web = web;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
}