package _43_member_service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import _9_41_member_model.MemberDAO_interface_Spring;
import _9_41_member_model.MemberVO;
import _9_43_friendsList_model.FriendsListDAO_interface_Spring;
import _9_43_friendsList_model.FriendsListVO;

@Component
public class MemberService_Spring
{
	@Autowired
	private MemberDAO_interface_Spring dao;
	@Autowired
	private FriendsListDAO_interface_Spring fDao;

	public int activateTwoStepVerification(MemberVO memberVO)
	{
		return dao.updateTwoStepVerifyByPrimaryKey(memberVO);
	}

	public int connectFbAccount(MemberVO memberVO)
	{

		if (dao.findByUserFBID(memberVO.getMemberFBId()) == null)
		{
			return dao.updateFbIdByPrimaryKey(memberVO);
		}

		return 0;
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

	public HashMap<String, List<String>> showAllFriendsInviting(String memberId)
	{
		HashMap<String, List<String>> map = new HashMap<>();
		List<FriendsListVO> friends = fDao.getAllFriendsInviting(memberId);
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

	@Transactional
	public int deleteFriend(String memberId, String friendId)
	{
		FriendsListVO member = new FriendsListVO();
		member.setMemberId(memberId);
		member.setMemberFriendId(friendId);
		FriendsListVO friend = new FriendsListVO();
		friend.setMemberId(friendId);
		friend.setMemberFriendId(memberId);

		if (fDao.deleteFriend(member) == fDao.deleteFriend(friend))
		{
			return 1;
		}
		return 0;

	}

	public int updateImg(MemberVO memberVO)
	{
		if (dao.updateMemberImg(memberVO) == 1)
		{
			return 1;
		}
		return 0;
	}

	public FriendsListVO getFriend(FriendsListVO friendsListVO)
	{
		return fDao.getFriend(friendsListVO);
	}

	public List<MemberVO> searchMember(String keyword)
	{
		return dao.searchMember(keyword);
	}

}
