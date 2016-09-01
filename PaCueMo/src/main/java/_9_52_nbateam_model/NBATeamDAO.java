package _9_52_nbateam_model;

import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;

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

	private static final String GET_BY_ID_STMT = "SELECT teamId , teamName , teamLogoURL FROM NBATeam" +
			"                                       WHERE teamId=?";
	private static final String GET_BY_NAME_STMT = "SELECT teamId , teamName , teamLogoURL FROM NBATeam" +
			"                                         WHERE teamName like ? ";
	private static final String GET_ALL_STMT = "SELECT teamId , teamName , teamLogoURL FROM NBATeam;";

	public static void main(String[] args)
	{
//		ApplicationContext context = new AnnotationConfigApplicationContext(NbaTeamBeans_Config.class);
//		NBATeamDAO dao = (NBATeamDAO) context.getBean("nbaTeamDAO");
//		NBATeamVO vo = dao.findByTeamId(17);
//		System.out.println(vo.getTeamName());

//		NBATeamDAO dao = new NBATeamDAO();
//		NBATeamVO vo = dao.findByTeamName("公鹿");
//		System.out.println(vo.getTeamName());

//		NBATeamDAO dao = new NBATeamDAO();
//		List<NBATeamVO> list = dao.getAll();
//		for (NBATeamVO vo : list)
//		{
//			System.out.println(vo.getTeamID() + "  " + vo.getTeamName());
//		}

//		NBATeamDAO dao = new NBATeamDAO();
//
//		System.out.println(dao.findByTeamId(1).getTeamName());
//		System.out.println(dao.findByTeamName("夏洛特黃蜂").getTeamLogoURL());
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
	public List<NBATeamVO> getAll()
	{
		return jdbcTemplate.query(GET_ALL_STMT, new NBATeamRowMapper());
	}

}
