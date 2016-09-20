package _9_41_member_model;

import java.util.List;

public interface MemberDAO_interface_Spring
{
	public int insert(MemberVO memberVO);

	public int insert_fb(MemberVO memberVO);

	public int updateForgetPwdByMail(MemberVO memberVO);

	public int updatePasswordByPrimaryKey(MemberVO memberVO);

	public int updateTwoStepVerifyByPrimaryKey(MemberVO memberVO);

	public int updateFbIdByPrimaryKey(MemberVO memberVO);

	public int updateMemberInfo();

	public int updateMemberImg(MemberVO memberVO);

	public int updatePlayercard(MemberVO memberVO);

	public MemberVO findByPrimaryKey(String memberId);

	public MemberVO findByUserMail(String memberMail);

	public MemberVO findByUserFBID(String fbId);

	public int updatePointByPrimaryKey(MemberVO memberVO);

	public List<MemberVO> getAll();

	public List<MemberVO> searchMember(String keyword);

}
