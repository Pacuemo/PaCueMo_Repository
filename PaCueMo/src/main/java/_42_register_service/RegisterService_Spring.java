package _42_register_service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import _9_41_member_model.MemberDAO_interface_Spring;
import _9_41_member_model.MemberVO;

@Component
public class RegisterService_Spring
{
	@Autowired
	private MemberDAO_interface_Spring dao;

	public String checkMail(String mail)
	{
		MemberVO memberVO = dao.findByUserMail(mail);

		if (memberVO != null)
		{
			return "false";
		}

		return "true";
	}

	public MemberVO saveMember(MemberVO memberVO)
	{

		if (dao.insert(memberVO) == 1)
		{
			memberVO = dao.findByUserMail(memberVO.getMemberMail());
		}
		else
		{
			memberVO = null;
		}

		if (memberVO != null)
		{
			return memberVO;
		}

		return null;
	}

	public MemberVO saveMember_fb(MemberVO memberVO)
	{

		if (dao.insert_fb(memberVO) == 1)
		{
			memberVO = dao.findByUserFBID(memberVO.getMemberFBId());
		}
		else
		{
			memberVO = null;
		}

		if (memberVO != null)
		{
			return memberVO;
		}

		return null;
	}
}
