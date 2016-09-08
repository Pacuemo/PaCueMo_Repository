package _9_22_clubMember_model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

@Component
public class ClubMemberDAO implements ClubMemberDAO_I
{
	@Autowired
	private JdbcOperations jdbc;
	private static final String insert_state = "insert into clubMemberTable values (?,?,?)";
	private static final String delete_state = "delete from clubMemberTable where clubMemberId=?";
	private static final String get_one_state = "select clubId,clubMemberId,joinDate from clubMemberTable where clubMemberId=? ";
	private static final String get_all = "select clubId,clubMemberId,joinDate from clubMemberTable ";
	private static final String get_club_all = "select clubId,clubMemberId,joinDate from clubMemberTable where clubId=? ";

	private static final class ClubMemberRowMapper implements RowMapper<ClubMemberVO>
	{

		@Override
		public ClubMemberVO mapRow(ResultSet rs, int rowNum) throws SQLException
		{

			return new ClubMemberVO(rs.getInt("clubId"),
					rs.getString("clubMemberId"),
					rs.getDate("joinDate"));
		}

	}

	@Override
	public int insert(ClubMemberVO clubMemberVO)
	{
		return jdbc.update(insert_state,
				clubMemberVO.getClubId(),
				clubMemberVO.getClubMemberId(),
				clubMemberVO.getJoinDate());
	}

	@Override
	public int delete(String clubMemberID)
	{
		return jdbc.update(delete_state, clubMemberID);
	}

	@Override
	public ClubMemberVO findByPK(String clubMemberID)
	{
		return jdbc.queryForObject(get_one_state, new ClubMemberRowMapper(), clubMemberID);
	}

	@Override
	public List<ClubMemberVO> getAll()
	{
		return jdbc.query(get_all, new ClubMemberRowMapper());
	}

	@Override
	public List<ClubMemberVO> getClubAll(int clubId)
	{
		return jdbc.query(get_club_all, new ClubMemberRowMapper(), clubId);
	}

	public static void main(String[] args)
	{
		ClubMemberDAO_I dao = new ClubMemberDAO();
		ClubMemberVO vo = new ClubMemberVO();
//        
//        vo.setClubId(13);
//        vo.setClubMemberId(165);
//        vo.setJoinDate(new Date(System.currentTimeMillis()));
//        
//        dao.insert(vo);
//		dao.delete(165);
//		vo=dao.findByPK(145);
//		System.out.println(vo.getClubId());
//		System.out.println(vo.getJoinDate());
//		
		List<ClubMemberVO> members = dao.getAll();
		for (ClubMemberVO member : members)
		{
			System.out.print(member.getClubId() + "   ");
			System.out.print(member.getClubMemberId() + "   ");
			System.out.print(member.getJoinDate() + "   ");
			System.out.println();
		}

	}

}
