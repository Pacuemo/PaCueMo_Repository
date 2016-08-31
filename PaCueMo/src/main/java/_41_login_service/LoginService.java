package _41_login_service;

import _00_initial_service.GlobalService;
import _9_41_member_model.MemberDAO;
import _9_41_member_model.MemberDAO_interface;
import _9_41_member_model.MemberVO;

public class LoginService
{
	private MemberDAO_interface dao;

	public LoginService()
	{
		dao = new MemberDAO();
	}

	public MemberVO checkMailPwd(String mail, String pwd)
	{
		MemberVO memberVO = dao.findByUserMail(mail);

		if (memberVO != null)
		{
			if (GlobalService.getMD5Endocing(pwd).equals(memberVO.getMemberPassword()))
			{
				return memberVO;
			}
		}

		return null;
	}
}
