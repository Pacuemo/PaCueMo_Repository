package com.member.model;

import _00_initial_Servise.GlobalService;

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
