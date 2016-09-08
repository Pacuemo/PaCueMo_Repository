package _9_41_member_model;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component
public class MemberVO implements Serializable
{

	private static final long serialVersionUID = 1L;

	private String memberId;
	private String memberFirstName;
	private String memberLastName;
	private String memberPassword;
	private Date memberBirthday;
	private String memberPhone;
	private String memberMail;
	private String memberImgUrl;
	private double memberPoint;
	private boolean memberHaveCard;
	private String memberFBId;
	private int memberType;
	private Timestamp memberRgDateTime;
	private boolean memberMailStatus;
	private Timestamp memberOutDate;
	private String memberValidateCode;
	private String memberSecretKey;
	private boolean member2StepVerify;

	public MemberVO()
	{

	}

	public MemberVO(String memberId, String memberFirstName, String memberLastName, String memberPassword, Date memberBirthday, String memberPhone, String memberMail, String memberImgUrl, double memberPoint, boolean memberHaveCard, String memberFBId, int memberType, Timestamp memberRgDateTime, boolean memberMailStatus, Timestamp memberOutDate, String memberValidateCode, String memberSecretKey, boolean member2StepVerify)
	{
		super();
		this.memberId = memberId;
		this.memberFirstName = memberFirstName;
		this.memberLastName = memberLastName;
		this.memberPassword = memberPassword;
		this.memberBirthday = memberBirthday;
		this.memberPhone = memberPhone;
		this.memberMail = memberMail;
		this.memberImgUrl = memberImgUrl;
		this.memberPoint = memberPoint;
		this.memberHaveCard = memberHaveCard;
		this.memberFBId = memberFBId;
		this.memberType = memberType;
		this.memberRgDateTime = memberRgDateTime;
		this.memberMailStatus = memberMailStatus;
		this.memberOutDate = memberOutDate;
		this.memberValidateCode = memberValidateCode;
		this.memberSecretKey = memberSecretKey;
		this.member2StepVerify = member2StepVerify;
	}

	public String getMemberId()
	{
		return memberId;
	}

	public void setMemberId(String memberId)
	{
		this.memberId = memberId;
	}

	public String getMemberFirstName()
	{
		return memberFirstName;
	}

	public void setMemberFirstName(String memberFirstName)
	{
		this.memberFirstName = memberFirstName;
	}

	public String getMemberLastName()
	{
		return memberLastName;
	}

	public void setMemberLastName(String memberLastName)
	{
		this.memberLastName = memberLastName;
	}

	public String getMemberPassword()
	{
		return memberPassword;
	}

	public void setMemberPassword(String memberPassword)
	{
		this.memberPassword = memberPassword;
	}

	public Date getMemberBirthday()
	{
		return memberBirthday;
	}

	public void setMemberBirthday(Date memberBirthday)
	{
		this.memberBirthday = memberBirthday;
	}

	public String getMemberPhone()
	{
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone)
	{
		this.memberPhone = memberPhone;
	}

	public String getMemberMail()
	{
		return memberMail;
	}

	public void setMemberMail(String memberMail)
	{
		this.memberMail = memberMail;
	}

	public String getMemberImgUrl()
	{
		return memberImgUrl;
	}

	public void setMemberImgUrl(String memberImgUrl)
	{
		this.memberImgUrl = memberImgUrl;
	}

	public double getMemberPoint()
	{
		return memberPoint;
	}

	public void setMemberPoint(double memberPoint)
	{
		this.memberPoint = memberPoint;
	}

	public boolean getMemberHaveCard()
	{
		return memberHaveCard;
	}

	public void setMemberHaveCard(boolean memberHaveCard)
	{
		this.memberHaveCard = memberHaveCard;
	}

	public String getMemberFBId()
	{
		return memberFBId;
	}

	public void setMemberFBId(String memberFBId)
	{
		this.memberFBId = memberFBId;
	}

	public int getMemberType()
	{
		return memberType;
	}

	public void setMemberType(int memberType)
	{
		this.memberType = memberType;
	}

	public Timestamp getMemberRgDateTime()
	{
		return memberRgDateTime;
	}

	public void setMemberRgDateTime(Timestamp memberRgDateTime)
	{
		this.memberRgDateTime = memberRgDateTime;
	}

	public boolean getMemberMailStatus()
	{
		return memberMailStatus;
	}

	public void setMemberMailStatus(boolean memberMailStatus)
	{
		this.memberMailStatus = memberMailStatus;
	}

	public Timestamp getMemberOutDate()
	{
		return memberOutDate;
	}

	public void setMemberOutDate(Timestamp memberOutDate)
	{
		this.memberOutDate = memberOutDate;
	}

	public String getMemberValidateCode()
	{
		return memberValidateCode;
	}

	public void setMemberValidateCode(String memberValidateCode)
	{
		this.memberValidateCode = memberValidateCode;
	}

	public String getMemberSecretKey()
	{
		return memberSecretKey;
	}

	public void setMemberSecretKey(String memberSecretKey)
	{
		this.memberSecretKey = memberSecretKey;
	}

	public boolean getMember2StepVerify()
	{
		return member2StepVerify;
	}

	public void setMember2StepVerify(boolean member2StepVerify)
	{
		this.member2StepVerify = member2StepVerify;
	}

}
