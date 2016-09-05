package _9_41_member_model;

import java.sql.Date;
import java.util.List;

public interface MemberDAO_interface
{
	public MemberVO insert(String memberFirstName, String memberLastName, String memberPassword, Date memberBirthday, String memberPhone, String memberMail);

	public MemberVO insert_fb(String memberFirstName, String memberLastName, Date memberBirthday, String memberPhone, String memberMail, String memberFBId);

	public MemberVO update();

	public MemberVO findByPrimaryKey(String memberId);

	public MemberVO findByUserMail(String memberMail);

	public MemberVO findByUserFBID(String fbId);

	public MemberVO findSKeyByUserMail(String memberMail);

	public MemberVO findSKeyByUserFBID(String fbId);

	public List<MemberVO> getAll();

}
