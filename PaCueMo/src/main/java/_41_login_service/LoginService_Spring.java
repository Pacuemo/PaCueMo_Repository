package _41_login_service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import _00_initial_service.GlobalService;
import _9_41_member_model.MemberDAO_interface_Spring;
import _9_41_member_model.MemberVO;

@Component
public class LoginService_Spring
{
	@Autowired
	private MemberDAO_interface_Spring dao;

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

	public MemberVO findbyGUID(String GUID)
	{
		MemberVO memberVO = dao.findByPrimaryKey(GUID);

		if (memberVO != null)
		{

			return memberVO;

		}
		return null;
	}

	public MemberVO checkMail(String mail)
	{
		MemberVO memberVO = dao.findByUserMail(mail);

		if (memberVO != null)
		{

			return memberVO;

		}
		return null;
	}

	public MemberVO checkFbId(String fbId)
	{
		MemberVO memberVO = dao.findByUserFBID(fbId);

		if (memberVO != null)
		{
			return memberVO;
		}

		return null;
	}

	public boolean checkTwoStepVerify(String mail)
	{
		MemberVO memberVO = dao.findByUserMail(mail);

		if (memberVO != null)
		{
			if (memberVO.getMember2StepVerify())
			{
				return true;
			}

		}
		return false;
	}

	public boolean checkTwoStepVerify_fb(String fbId)
	{
		MemberVO memberVO = dao.findByUserFBID(fbId);

		if (memberVO != null)
		{
			if (memberVO.getMember2StepVerify())
			{
				return true;
			}

		}
		return false;
	}

	public MemberVO getSKeyByGUID(String guid)
	{
		MemberVO memberVO = dao.findByPrimaryKey(guid);

		if (memberVO != null)
		{
			return memberVO;
		}

		return null;
	}

	public int setForgetPasswordInfo(MemberVO memberVO)
	{
		return dao.updateForgetPwdByMail(memberVO);
	}

	public int setNewPassword(MemberVO memberVO)
	{
		return dao.updatePasswordByPrimaryKey(memberVO);
	}
}
