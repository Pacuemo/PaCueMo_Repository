package com.member.model;

import java.util.List;

public interface MemberDAO_interface {
	public void insert(MemberVO memberVO);
    public void update(MemberVO memberVO);
    public MemberVO findByPrimaryKey(Integer memberId);
    public MemberVO findByUserMail(String memberMail);
    public MemberVO findByUserFBID(Integer memberFBId);
    public List<MemberVO> getAll();
}
