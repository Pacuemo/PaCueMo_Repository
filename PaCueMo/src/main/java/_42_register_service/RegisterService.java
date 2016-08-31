package _42_register_service;

import _4_member_model.MemberDAO;
import _4_member_model.MemberDAO_interface;
import _4_member_model.MemberVO;

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
}
