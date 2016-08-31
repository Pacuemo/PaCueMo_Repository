package com.member.model;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Date;
import java.sql.Timestamp;

public class MemberVO implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int memberId;
	private String memberFirstName;
	private String memberLastName; 
	private String memberPassword;
	private Date memberBirthday;
	private String memberPhone;
	private String memberMail;
	private String memberFileName;
	private double memberPoint;
	private boolean memberHaveCard;
	private String memberFBId;
	private int memberType;
	private Timestamp memberRgDateTime;
	private boolean  memberMailStatus;
	private Timestamp memberOutDate;
	private String memberValidateCode;
	private String memberSecretKey;
	
	public MemberVO() {
		
	}
	
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public String getMemberFirstName() {
		return memberFirstName;
	}
	public void setMemberFirstName(String memberFirstName) {
		this.memberFirstName = memberFirstName;
	}
	public String getMemberLastName() {
		return memberLastName;
	}
	public void setMemberLastName(String memberLastName) {
		this.memberLastName = memberLastName;
	}
	public String getMemberPassword() {
		return memberPassword;
	}
	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}
	public Date getMemberBirthday() {
		return memberBirthday;
	}
	public void setMemberBirthday(Date memberBirthday) {
		this.memberBirthday = memberBirthday;
	}
	public String getMemberPhone() {
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}
	public String getMemberMail() {
		return memberMail;
	}
	public void setMemberMail(String memberMail) {
		this.memberMail = memberMail;
	}
	public String getMemberFileName() {
		return memberFileName;
	}
	public void setMemberFileName(String memberFileName) {
		this.memberFileName = memberFileName;
	}
	public double getMemberPoint() {
		return memberPoint;
	}
	public void setMemberPoint(double memberPoint) {
		this.memberPoint = memberPoint;
	}
	public boolean isMemberHaveCard() {
		return memberHaveCard;
	}
	public void setMemberHaveCard(boolean memberHaveCard) {
		this.memberHaveCard = memberHaveCard;
	}
	public String getMemberFBId() {
		return memberFBId;
	}
	public void setMemberFBId(String memberFBId) {
		this.memberFBId = memberFBId;
	}
	public int getMemberType() {
		return memberType;
	}
	public void setMemberType(int memberType) {
		this.memberType = memberType;
	}
	public Timestamp getMemberRgDateTime() {
		return memberRgDateTime;
	}
	public void setMemberRgDateTime(Timestamp memberRgDateTime) {
		this.memberRgDateTime = memberRgDateTime;
	}
	public boolean isMemberMailStatus() {
		return memberMailStatus;
	}
	public void setMemberMailStatus(boolean memberMailStatus) {
		this.memberMailStatus = memberMailStatus;
	}
	public Timestamp getMemberOutDate() {
		return memberOutDate;
	}
	public void setMemberOutDate(Timestamp memberOutDate) {
		this.memberOutDate = memberOutDate;
	}
	public String getMemberValidateCode() {
		return memberValidateCode;
	}
	public void setMemberValidateCode(String memberValidateCode) {
		this.memberValidateCode = memberValidateCode;
	}
	public String getMemberSecretKey() {
		return memberSecretKey;
	}
	public void setMemberSecretKey(String memberSecretKey) {
		this.memberSecretKey = memberSecretKey;
	}

}	
