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

	public MemberVO checkFbId(String fbId)
	{
		MemberVO memberVO = dao.findByUserFBID(fbId);

		if (memberVO != null)
		{
			return memberVO;
		}

		return null;
	}

	public String checkTwoStepVerify(String mail)
	{
		MemberVO memberVO = dao.findByUserMail(mail);

		if (memberVO != null)
		{
			if (memberVO.getMember2StepVerify())
			{
				return "true" + memberVO.getMemberId();
			}

		}
		return "false";
	}

	public String checkTwoStepVerify_fb(String fbId)
	{
		MemberVO memberVO = dao.findByUserFBID(fbId);

		if (memberVO != null)
		{
			if (memberVO.getMember2StepVerify())
			{
				return "true" + memberVO.getMemberId();
			}

		}
		return "false";
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

}
