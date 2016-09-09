package _43_member_service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import _9_41_member_model.MemberDAO_interface_Spring;
import _9_41_member_model.MemberVO;
import _9_43_friendsList_model.FriendsListDAO_interface;
import _9_43_friendsList_model.FriendsListVO;

@Component
public class MemberService_Spring
{
	@Autowired
	private MemberDAO_interface_Spring dao;
	@Autowired
	private FriendsListDAO_interface fDao;

	public void activateTwoStepVerification(MemberVO memberVO)
	{
		dao.updateTwoStepVerifyByPrimaryKey(memberVO);
	}

	public void connectFbAccount(MemberVO memberVO)
	{

		if (dao.findByUserFBID(memberVO.getMemberFBId()) == null)
		{
			dao.updateFbIdByPrimaryKey(memberVO);
		}
	}

	public HashMap<String, List<String>> showAllFriends(String memberId)
	{
		HashMap<String, List<String>> map = new HashMap<>();
		List<FriendsListVO> friends = fDao.getAllFriends(memberId);
		List<String> friendids = new ArrayList<>();
		List<String> names = new ArrayList<>();
		List<String> imgUrls = new ArrayList<>();
		List<String> fbIds = new ArrayList<>();

		for (FriendsListVO friend : friends)
		{
			String friendid = friend.getMemberFriendId();
			MemberVO memberVO = dao.findByPrimaryKey(friendid);
			friendids.add(friendid);
			names.add(memberVO.getMemberLastName() + memberVO.getMemberFirstName());
			imgUrls.add(memberVO.getMemberImgUrl());
			fbIds.add(memberVO.getMemberFBId());
		}

		map.put("ids", friendids);
		map.put("names", names);
		map.put("imgs", imgUrls);
		map.put("fbIds", fbIds);

		return map;
	}

	public HashMap<String, List<String>> showAllFriendsInvite(String memberId)
	{
		HashMap<String, List<String>> map = new HashMap<>();
		List<FriendsListVO> friends = fDao.getAllFriendsInvite(memberId);
		List<String> friendids = new ArrayList<>();
		List<String> names = new ArrayList<>();
		List<String> imgUrls = new ArrayList<>();
		List<String> fbIds = new ArrayList<>();

		for (FriendsListVO friend : friends)
		{
			String friendid = friend.getMemberFriendId();
			MemberVO memberVO = dao.findByPrimaryKey(friendid);
			friendids.add(friendid);
			names.add(memberVO.getMemberLastName() + memberVO.getMemberFirstName());
			imgUrls.add(memberVO.getMemberImgUrl());
			fbIds.add(memberVO.getMemberFBId());
		}

		map.put("ids", friendids);
		map.put("names", names);
		map.put("imgs", imgUrls);
		map.put("fbIds", fbIds);

		return map;
	}

	public int deleteFriend(String memberId, String friendId)
	{

		return fDao.deleteFriend(memberId, friendId);
	}

	public static void main(String[] args)
	{
		MemberService_Spring memberService = new MemberService_Spring();
		HashMap<String, List<String>> map = memberService.showAllFriends("B411208D-B026-4973-845E-F4C6DFCDF263");

		for (String str : map.get("ids"))
		{
			System.out.println(str);
		}
		for (String str : map.get("names"))
		{
			System.out.println(str);
		}
		for (String str : map.get("img"))
		{
			System.out.println(str);
		}
		for (String str : map.get("fbIds"))
		{
			System.out.println(str);
		}

	}
}
