package _43_member_service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Component;

import _9_41_member_model.MemberDAO;
import _9_41_member_model.MemberDAO_interface;
import _9_41_member_model.MemberVO;
import _9_43_friendsList_model.FriendsListDAO;
import _9_43_friendsList_model.FriendsListDAO_interface;
import _9_43_friendsList_model.FriendsListVO;

@Component
public class MemberService
{
	private MemberDAO_interface dao;
	private FriendsListDAO_interface fDao;

	public MemberService()
	{
		dao = new MemberDAO();
		fDao = new FriendsListDAO();
	}

	public MemberVO activate2StepVerify(String guid, String sKey, Boolean status)
	{

		MemberVO memberVO = dao.updateSKeyByPrimaryKey(guid, sKey, status);

		if (memberVO != null)
		{
			return memberVO;
		}
		return null;
	}

	public MemberVO connectFbAccount(String guid, String fbId)
	{
		MemberVO memberVO = null;

		if (dao.findByUserFBID(fbId) == null)
		{
			memberVO = dao.updateFbIdByPrimaryKey(guid, fbId, null);
		}

		if (memberVO != null)
		{
			return memberVO;
		}
		return null;
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
		MemberService memberService = new MemberService();
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
