package _9_52_nbateam_model;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

import _52_nbateam_service.NbaTeamBeans_Config;

// @Repository("nbaTeamDAO")
public class NBATeamDAO implements NBATeamDAO_interface
{
//	String driver = GlobalService.DRIVER_NAME;
//	String url = GlobalService.DB_URL;
//	String userid = GlobalService.USERID;
//	String passwd = GlobalService.PASSWORD;

	JdbcTemplate jdbcTemplate;

	public NBATeamDAO()
	{
	}

//	@Autowired
	public NBATeamDAO(JdbcTemplate jdbcTemplate)
	{
		this.jdbcTemplate = jdbcTemplate;
	}

	private static final String GET_BY_ID_STMT = "SELECT teamId , teamName , teamLogoURL , start5URL FROM NBATeam" +
			"                                       WHERE teamId=?";
	private static final String GET_BY_NAME_STMT = "SELECT teamId , teamName , teamLogoURL , start5URL FROM NBATeam" +
			"                                         WHERE teamName like ? ";
	private static final String GET_ALL_STMT = "SELECT teamId , teamName , teamLogoURL , start5URL FROM NBATeam;";

	public static void main(String[] args)
	{
		ApplicationContext context = new AnnotationConfigApplicationContext(NbaTeamBeans_Config.class);
		NBATeamDAO dao = (NBATeamDAO) context.getBean("nbaTeamDAO");
//		NBATeamVO vo = dao.findByTeamId(17);
//		System.out.println(String.format("%2s \t %-18s %-5s \t %-18s", vo.getTeamID(), vo.getTeamName(), vo.getTeamLogoURL(), vo.getStart5URL()));

//		NBATeamDAO dao = new NBATeamDAO();
//		NBATeamVO vo = dao.findByTeamName("公鹿");
//		System.out.println(vo.getTeamName());

//		NBATeamDAO dao = new NBATeamDAO();
//		List<NBATeamVO> list = dao.getAll();
//		for (NBATeamVO vo : list)
//		{
//			System.out.println(String.format("%2s \t %-18s %-5s \t %-18s", vo.getTeamID(), vo.getTeamName(), vo.getTeamLogoURL(), vo.getStart5URL()));
//		}

//		NBATeamDAO dao = new NBATeamDAO();
//
//		System.out.println(dao.findByTeamId(1).getTeamName());
//		System.out.println(dao.findByTeamName("夏洛特黃蜂").getTeamLogoURL());

		//================= 根據隊名查多筆 =================
//		List<NBATeamVO> list = dao.findByTeamNames("");
//		for (NBATeamVO vo : list)
//		{
//			System.out.println(vo.getTeamName());
//		}
	}

	@Override
	public NBATeamVO findByTeamId(Integer teamID)
	{
		return jdbcTemplate.queryForObject(GET_BY_ID_STMT, new NBATeamRowMapper(), teamID);
	}

	@Override
	public NBATeamVO findByTeamName(String teamName)
	{
		return jdbcTemplate.queryForObject(GET_BY_NAME_STMT, new NBATeamRowMapper(), "%" + teamName + "%");
	}

	@Override
	public List<NBATeamVO> findByTeamNames(String teamName)
	{
		teamName = teamName.equals("") ? " " : teamName; // 避免模糊查詢 %_% → 兩個%中間為空字串查到全部的情況
		return jdbcTemplate.query(GET_BY_NAME_STMT, new NBATeamRowMapper(), "%" + teamName + "%");
	}

	@Override
	public List<NBATeamVO> getAll()
	{
		return jdbcTemplate.query(GET_ALL_STMT, new NBATeamRowMapper());
	}

}
