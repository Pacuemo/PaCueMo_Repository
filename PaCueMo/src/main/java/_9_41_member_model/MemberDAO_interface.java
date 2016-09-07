package _9_41_member_model;

import java.sql.Date;
import java.util.List;

public interface MemberDAO_interface
{
	public MemberVO insert(String memberFirstName, String memberLastName, String memberPassword, Date memberBirthday, String memberPhone, String memberMail);

	public MemberVO insert_fb(String memberFirstName, String memberLastName, Date memberBirthday, String memberPhone, String memberMail, String memberFBId);

	public int updatePasswordByMail(String memberMail);

	public int updatePasswordByPrimaryKey(String memberId);

	public MemberVO updateSKeyByPrimaryKey(String memberId, String memberSecretKey, boolean status);

	public MemberVO updateFbIdByPrimaryKey(String memberId, String fbId, String memberImgUrl);

	public MemberVO updateMemberInfo(String memberId, String memberMail, String memberPhone);

	public MemberVO updateMemberImg(String memberId, String memberImgUrl);

	public MemberVO findByPrimaryKey(String memberId);

	public MemberVO findByUserMail(String memberMail);

	public MemberVO findByUserFBID(String fbId);

	public MemberVO findSKeyByUserMail(String memberMail);

	public MemberVO findSKeyByUserFBID(String fbId);

	public MemberVO updatePointByPrimaryKey(String memberId, Double point);

	public List<MemberVO> getAll();

}
