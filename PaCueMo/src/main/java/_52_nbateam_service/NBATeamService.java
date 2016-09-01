package _52_nbateam_service;

import java.util.List;

import _9_52_nbateam_model.NBATeamDAO;
import _9_52_nbateam_model.NBATeamVO;

// @Service(value = "nbaTeamService")
public class NBATeamService
{
	private NBATeamDAO nbaTeamDAO;

	public NBATeamService()
	{
//		nbaTeamDAO = new NBATeamDAO();
	}

//	@Autowired
	public NBATeamService(NBATeamDAO nbaTeamDAO)
	{
		this.nbaTeamDAO = nbaTeamDAO;
	}

	public NBATeamVO getByTeamId(Integer teamID)
	{
		return nbaTeamDAO.findByTeamId(teamID);
	}

	public NBATeamVO getByTeamName(String teamName)
	{
		return nbaTeamDAO.findByTeamName(teamName);
	}

	public List<NBATeamVO> getAllTeam()
	{
		return nbaTeamDAO.getAll();
	}

	public static void main(String[] args)
	{
//		ApplicationContext context = new AnnotationConfigApplicationContext(RootConfig.class);
//		AbstractApplicationContext context = new AnnotationConfigApplicationContext("_52_nbateam_service");
//		NBATeamService svc = (NBATeamService) context.getBean("nbaTeamService");

		//-------------------------------------------------------begin 查無資料
//		NBATeamService svc = new NBATeamService();
//		svc.getByTeamName("123");
//		System.out.println(svc.getByTeamName("123"));
		//-------------------------------------------------------end 查無資料

//		NBATeamService svc = new NBATeamService();
//		NBATeamVO vo = svc.getByTeamName("黃蜂");
//		System.out.println(vo.getTeamName());
		//---------- 查全部 ---------------
//		List<NBATeamVO> list = svc.getAllTeam();
//		for (NBATeamVO vo : list)
//		{
//			System.out.println(vo.getTeamID() + "  " + vo.getTeamName());
//		}

		//---------- 查一筆 ---------------
//		NBATeamService svc = new NBATeamService();
//		NBATeamVO vo = svc.getByTeamId(3);
//		System.out.println(vo.getTeamName());
	}

}
