package _10_team_controller;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

import _00_config.RootConfig;
import _10_steven_facade.StevenFacade;
import _10_team_service.TeamService;
import _11_teammember_service.TeamMemberService;
import _12_battlerecord_service.BattleRecordService;
import _14_teamapply_service.TeamApplyService;
import _44_playercard_service.PlayercardService;
import _9_10_team_model.TeamVO;
import _9_14_teamapply_model.TeamApplyVO;
import _9_41_member_model.MemberVO;

@WebServlet("/TeamServlet")
public class TeamServlet extends HttpServlet
{

	private static final long serialVersionUID = 1L;
	private AnnotationConfigWebApplicationContext context;
	@Autowired
	private TeamService teamService;
	@Autowired
	private TeamMemberService teamMemberService;
	@Autowired
	private BattleRecordService battleRecordService;
	@Autowired
	private TeamApplyService teamApplyService;
	@Autowired
	private PlayercardService playercardService;
	@Autowired
	private StevenFacade stevenFacade;

	public TeamServlet()
	{
	}

	@Override
	public void init() throws ServletException
	{
		context = new AnnotationConfigWebApplicationContext();
//		context.scan("");
		context.register(RootConfig.class);
		context.refresh();
	}

	public void init(ServletConfig config) throws ServletException
	{
		super.init(config);
		SpringBeanAutowiringSupport.processInjectionBasedOnServletContext(this,
				config.getServletContext());
	}

	// 隊伍頁面
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		System.out.println("Go to TeamPage (GET)");
		req.setCharacterEncoding("UTF-8");

		TeamVO teamVO = null;
		MemberVO memberVO = null;
		HttpSession session = null;
		Integer teamId = null;

		try
		{
			teamId = Integer.valueOf(req.getParameter("teamId"));
			System.out.println("get teamId from parameter success");
		}
		catch (Exception e)
		{
			System.out.println("get teamId from parameter failed , try get attribute");
			teamId = (Integer) req.getAttribute("teamId");
			System.out.println("get teamId from attribute success");
		}

		if (null != req.getParameter("teamId") || null != req.getAttribute("teamId"))
		{
			try
			{
				session = req.getSession();
				memberVO = (MemberVO) session.getAttribute("LoginOK");

//				teamService = context.getBean(TeamService.class);
//				battleRecordService = context.getBean(BattleRecordService.class);
//				teamMemberService = context.getBean(TeamMemberService.class);
				Double attendancePercent = null;
				Double teamWPCT = null;
				String memberId = memberVO.getMemberId();
				try
				{
					attendancePercent = battleRecordService.getAttendancePercent(teamId);
				}
				catch (Exception e)
				{
					System.out.println("attendancePercent no data!");
					attendancePercent = 0.0;
				}
				try
				{
					teamWPCT = battleRecordService.getWPCT(teamId);
				}
				catch (Exception e)
				{
					System.out.println("teamWPCT no data!");
					teamWPCT = 0.0;
				}
				teamVO = stevenFacade.getTeamById(teamId);
				if (teamVO.getTeamId() == null)
				{
					System.out.println("隊伍不存在");
					resp.sendRedirect(req.getContextPath());
					return;
				}
				req.setAttribute("teamVO", teamVO); 							//setAtt
				req.setAttribute("attendancePercent", attendancePercent);		//setAtt
				req.setAttribute("teamWPCT", teamWPCT);							//setAtt

				Boolean flag = false;

				for (TeamVO list : teamService.getMyTeamList(memberId))
				{
					if (list.getTeamId() == teamId)
					{
						req.setAttribute("teamExsist", "Exsist");				//setAtt
						flag = true;
					}
				}

				for (Integer list : teamService.find_TeamId_With_TeamHead(memberId))
				{
					if (list == teamId)
					{
						req.setAttribute("teamExsist", "Mine");					//setAtt
						flag = true;
					}
				}

				for (TeamApplyVO list : teamApplyService.getByMemberId_Applying(memberId))
				{
					if (list.getTeamId() == teamId)
					{
						req.setAttribute("teamExsist", "Not_Exsist_applying");	//setAtt
						flag = true;
					}
				}

				if (!flag)
				{
					if (teamVO.getTeamProp() == 0)
					{
						req.setAttribute("teamExsist", "Not_Exsist_public");	//setAtt
					}
					else if (teamVO.getTeamProp() == 1)
					{
						req.setAttribute("teamExsist", "Not_Exsist_protect");	//setAtt
					}
				}

//				Need to get average rank
//				for (TeamMemberVO teamMemberVO : teamVO.getTeamMemberVOs())
//				{
//					
//				}

				req.setAttribute("pageForSideBar", "teampage");	 		//setAtt

				System.out.println("隊伍名稱是: " + teamVO.getTeamName());
				System.out.println("Servlet GET End");
				System.out.println("-------------------------------------------------------");
				req.getRequestDispatcher("/WEB-INF/team/teampage.jsp").forward(req, resp);
				return;
			}
			catch (Exception e)
			{
				e.printStackTrace();
			}
		}
		else
		{
			System.out.println("You don't have any Team");
			System.out.println("This code will never run");
			req.getRequestDispatcher("/WEB-INF/team/createteam.jsp").forward(req, resp);
			return;
		}
	}

	// 新增隊伍
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		System.out.println("這裡是 Post 新增隊伍");
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		Boolean error = false;
		TeamService teamService = null;
		TeamVO teamVO = null;
		try
		{
			teamService = context.getBean(TeamService.class);
			teamVO = new TeamVO();

			String teamName = req.getParameter("teamName");
			if (null != teamName && teamName.trim().length() != 0)
			{
				teamVO.setTeamName(teamName);
			}
			else
			{
				error = true; // 表示發生錯誤
			}

			String teamProp = req.getParameter("teamProp");
			teamVO.setTeamProp(Integer.valueOf(teamProp));
			String content = null;
			try
			{
				content = req.getParameter("content");
				if (content.equals(""))
				{
					System.out.println("未輸入隊伍簡介: 歡迎加入 (default)");
					content = "歡迎加入";
				}
			}
			catch (Exception e)
			{
				System.out.println("(ERROR) 隊伍簡介: 歡迎加入 (default)");
				content = "歡迎加入";
			}
			teamVO.setContent(content);

			MemberVO memberVO = (MemberVO) session.getAttribute("LoginOK");
			String teamMemberId = memberVO.getMemberId();
			if (null != teamMemberId && teamMemberId.length() != 0)
			{
				teamVO.setTeamHead(teamMemberId);
			}
			else
			{
				error = true;
			}
			if (!error)
			{
				teamService.createTeam(teamVO);
			}
			else
			{
				System.out.println("error!!!");
				return;
			}
			System.out.println("doPost OK");
			System.out.println("-------------------------------------------------------");
			req.getRequestDispatcher("/spring/team/createTeamPage").forward(req, resp);
			return;
		}
		catch (Exception e)
		{
			e.printStackTrace();
			System.out.println("整合後取得memberVO，即可正常運作");
		}

	}

}
