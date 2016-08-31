package _41_login_service;

import _00_initial_Servise.GlobalService;
import member_model.MemberDAO;
import member_model.MemberDAO_interface;
import member_model.MemberVO;

public class MemberService
{
	private MemberDAO_interface dao;

	public MemberService()
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
