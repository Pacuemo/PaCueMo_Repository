package _44_playercard_service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import _9_41_member_model.MemberDAO_interface_Spring;
import _9_41_member_model.MemberVO;
import _9_42_playerCard_model.PlayerCardDAO_interface;
import _9_42_playerCard_model.PlayerCardVO;

@Component
public class PlayercardService
{
	@Autowired
	private PlayerCardDAO_interface dao;

	@Autowired
	private MemberDAO_interface_Spring mdao;

	@Transactional
	public int buildPlayercard(PlayerCardVO playerCardVO, MemberVO memberVO)
	{
		if (dao.insertPlayerCard(playerCardVO) == mdao.updatePlayercard(memberVO))
		{
			return 1;
		}
		return 0;
	}

	public PlayerCardVO getPlayercardByPK(String memberId)
	{
		return dao.getPlayerCardById(memberId);
	}

	public int updatePlayercard(PlayerCardVO playerCardVO)
	{
		return dao.updatePlayerCard(playerCardVO);
	}
}
