package _42_register_service;

import java.sql.Date;

import _9_41_member_model.MemberDAO;
import _9_41_member_model.MemberDAO_interface;
import _9_41_member_model.MemberVO;

public class RegisterService
{
	private MemberDAO_interface dao;

	public RegisterService()
	{
		dao = new MemberDAO();
	}

	public String checkMail(String mail)
	{
		MemberVO memberVO = dao.findByUserMail(mail);

		if (memberVO != null)
		{
			return "false";
		}

		return "true";
	}

	public String saveMember(String memberFirstName, String memberLastName, String memberPassword, Date memberBirthday, String memberPhone, String memberMail)
	{

		MemberVO memberVO = dao.insert(memberFirstName, memberLastName, memberPassword, memberBirthday, memberPhone, memberMail);

		if (memberVO != null)
		{
			return "false";
		}

		return "true";
	}
}
