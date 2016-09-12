package _9_42_playerCard_model;

public interface PlayerCardDAO_interface
{
	public int insertPlayerCard(PlayerCardVO playerCardVO);

	public PlayerCardVO getPlayerCardById(String memberId);
}
