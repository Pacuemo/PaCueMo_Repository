package _9_42_playerCard_model;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository("PlayerCardDAO")
public class PlayerCardDAO implements PlayerCardDAO_interface
{
	JdbcOperations jdbc;

	private final String INSERT_STMT = "  INSERT dbo.PlayerCard( memberId ,playerGender ,playerHeight ,playerWeight ,playerPosition ,playerHand ,playerNote ,"
			+ "playerLoation ,playerSTR ,playerCON ,playerDEX ,playerINT ,playerWIS ,playerCHA) "
			+ "VALUES  (?,?,?,?,?,?,?,?,?,?,?,?,?,? )";
	private final String GET_ONE_STMT = "SELECT * FROM PlayerCard WHERE memberId = ?";

	public PlayerCardDAO(JdbcOperations jdbc)
	{
		this.jdbc = jdbc;
	}

	@Override
	public int insertPlayerCard(PlayerCardVO playerCardVO)
	{
		return jdbc.update(INSERT_STMT,
				playerCardVO.getMemberId(),
				playerCardVO.getPlayerGender(),
				playerCardVO.getPlayerHeight(),
				playerCardVO.getPlayerWeight(),
				playerCardVO.getPlayerPosition(),
				playerCardVO.getPlayerHand(),
				playerCardVO.getPlayerNote(),
				playerCardVO.getPlayerLocation(),
				playerCardVO.getPlayerSTR(),
				playerCardVO.getPlayerCON(),
				playerCardVO.getPlayerDEX(),
				playerCardVO.getPlayerINT(),
				playerCardVO.getPlayerWIS(),
				playerCardVO.getPlayerCHA());
	}

	@Override
	public PlayerCardVO getPlayerCardById(String memberId)
	{
		try
		{
			return jdbc.queryForObject(GET_ONE_STMT, new PlayerCardRowMapper(), memberId);
		}
		catch (EmptyResultDataAccessException e)
		{

			return null;
		}
	}

	private static final class PlayerCardRowMapper implements RowMapper<PlayerCardVO>
	{

		public PlayerCardVO mapRow(ResultSet rs, int rowNum) throws SQLException
		{
			return new PlayerCardVO(
					rs.getString("memberId"),
					rs.getBoolean("playerGender"),
					rs.getDouble("playerHeight"),
					rs.getDouble("playerWeight"),
					rs.getString("playerPosition"),
					rs.getBoolean("playerHand"),
					rs.getString("playerNote"),
					rs.getString("playerLoation"),
					rs.getInt("playerSTR"),
					rs.getInt("playerCON"),
					rs.getInt("playerDEX"),
					rs.getInt("playerINT"),
					rs.getInt("playerWIS"),
					rs.getInt("playerCHA"));

		}
	}
}
