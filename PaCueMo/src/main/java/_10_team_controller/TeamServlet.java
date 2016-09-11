package _10_team_controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;

import _00_config.RootConfig;
import _10_team_service.TeamService;
import _11_teammember_service.TeamMemberService;
import _12_battlerecord_service.BattleRecordService;
import _9_10_team_model.TeamVO;
import _9_11_teammember_model.TeamMemberVO;
import _9_41_member_model.MemberVO;
import _9_42_playerCard_model.PlayerCardVO;

@WebServlet("/TeamServlet")
public class TeamServlet extends HttpServlet
{

	private static final long serialVersionUID = 1L;
	private AnnotationConfigWebApplicationContext context;

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

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		System.out.println("Go to TeamPage (GET)");	// 隊伍頁面
		req.setCharacterEncoding("UTF-8");
		TeamService teamService = null;
		TeamMemberService teamMemberService = null;
		BattleRecordService battleRecordService = null;
		TeamVO teamVO = null;
		MemberVO memberVO = null;
		PlayerCardVO playerCardVO = null;
		HttpSession session = null;
		List<TeamMemberVO> teamMemberList = null;
		List<TeamVO> myTeamList = null;
		Integer teamId = null;

		//測試!!! TEST TEST TEST
		if (req.getParameter("teamId") == null)
		{
			teamId = 4;
			System.out.println("Can't get teamId");
		}
		else
		{
			teamId = Integer.valueOf(req.getParameter("teamId"));
		}//測試!!! TEST TEST TEST

		if (null != req.getParameter("teamId")) //測試!!! TEST TEST TEST
		{
			try
			{
				session = req.getSession();
				memberVO = (MemberVO) session.getAttribute("LoginOK");
				teamId = Integer.valueOf(req.getParameter("teamId"));
				teamService = context.getBean(TeamService.class);
				battleRecordService = context.getBean(BattleRecordService.class);
				teamMemberService = context.getBean(TeamMemberService.class);
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
				teamVO = teamService.getOne(teamId);
				req.setAttribute("teamVO", teamVO); 							//setAtt
				req.setAttribute("attendancePercent", attendancePercent);		//setAtt
				req.setAttribute("teamWPCT", teamWPCT);							//setAtt
				teamMemberList = teamMemberService.getOneTeam(teamId);

				myTeamList = teamService.getMyTeamList(memberId);
				for (TeamVO list : myTeamList)
				{
					if (list.getTeamId() == teamId)
					{
						req.setAttribute("teamExsist", "Exsist");				//setAtt
					}
				}
//				Need to get average rank
//				playerCardVO = new PlayerCardVO();
//				for (TeamMemberVO list : teamMemberList)
//				{
//
//				}

				System.out.println("隊伍名稱是: " + teamVO.getTeamName());
				System.out.println("Servlet GET End");
				System.out.println("-------------------------------------------------------");
				req.getRequestDispatcher("/WEB-INF/team/teampage.jsp").forward(req, resp);
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
			System.out.println("doPost OK , now  doGET");
			System.out.println("-------------------------------------------------------");
			doGet(req, resp);
		}
		catch (Exception e)
		{
			e.printStackTrace();
			System.out.println("整合後取得memberVO，即可正常運作");
		}

	}

}
