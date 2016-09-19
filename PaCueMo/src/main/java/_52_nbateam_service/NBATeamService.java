package _52_nbateam_service;

import java.util.List;

import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;

import _9_52_nbateam_model.NBATeamDAO;
import _9_52_nbateam_model.NBATeamDAO_interface;
import _9_52_nbateam_model.NBATeamVO;

// @Service(value = "nbaTeamService")
@Path("/")
public class NBATeamService
{
	private NBATeamDAO_interface nbaTeamDAO;

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

	/*
	 * @Context
	 * HttpServletResponse response;
	 */
	@POST
	@Path("/nbaSvc/{searchName}")
	@Produces({ MediaType.APPLICATION_JSON })
	public NBATeamVO getByTeamNameREST(@PathParam("searchName") String teamName)
	{
//		response.setHeader("Access-Control-Allow-Origin", "*");
//		response.setHeader("Access-Control-Allow-Methods", "GET, POST, PUT");
//		response.setHeader("Access-Control-Allow-Headers", "Content-Type");
		ApplicationContext context = new AnnotationConfigApplicationContext(NbaTeamBeans_Config.class);
		NBATeamDAO_interface nbaTeamDAO = (NBATeamDAO) context.getBean("nbaTeamDAO");
		System.out.println("== 呼叫 NBATeamService 中的 getByTeamNameREST(隊名) ==   查詢隊名字串：" + teamName);
		NBATeamVO ans = nbaTeamDAO.findByTeamName(teamName);
		((ConfigurableApplicationContext) context).close();
		return ans;
	}

	public List<NBATeamVO> getByTeamNames(String teamName)
	{
		return nbaTeamDAO.findByTeamNames(teamName);
	}

	public List<NBATeamVO> getAllTeam()
	{
		return nbaTeamDAO.getAll();
	}

	public static void main(String[] args)
	{
//		ApplicationContext context = new AnnotationConfigApplicationContext(RootConfig.class);
		AbstractApplicationContext context = new AnnotationConfigApplicationContext("_52_nbateam_service");
		NBATeamService svc = (NBATeamService) context.getBean("nbaTeamService");

		//-------------------------------------------------------begin 查無資料 org.springframework.dao.EmptyResultDataAccessException
//		NBATeamService svc = new NBATeamService();
//		svc.getByTeamName("123");
//		System.out.println(svc.getByTeamName("123"));
		//-------------------------------------------------------end 查無資料

//		NBATeamService svc = new NBATeamService();
//		NBATeamVO vo = svc.getByTeamName("黃蜂");
//		System.out.println(String.format("%2s \t %-18s %-5s \t %-18s", vo.getTeamID(), vo.getTeamName(), vo.getTeamLogoURL(), vo.getStart5URL()));
		//---------- 查全部 ---------------
//		List<NBATeamVO> list = svc.getAllTeam();
//		for (NBATeamVO vo : list)
//		{
//			System.out.println(String.format("%2s \t %-18s %-5s \t\t %-18s", vo.getTeamID(), vo.getTeamName(), vo.getTeamLogoURL(), vo.getStart5URL()));
//		}

		//---------- 查一筆 ---------------
//		NBATeamService svc = new NBATeamService();
//		NBATeamVO vo = svc.getByTeamId(3);
//		System.out.println(vo.getTeamName());
		//-------------- 隊名模糊查詢得到多筆 -----------------
//		List<NBATeamVO> list = svc.getByTeamNames("人");
//		for (NBATeamVO vo : list)
//		{
//			System.out.println(vo.getTeamName());
//		}
	}

}
