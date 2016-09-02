package _10_team_controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import _10_team_service.TeamService;
import _11_teammember_service.TeamMemberService;
import _9_10_team_model.TeamVO;
import _9_41_member_model.MemberVO;

@WebServlet("/TeamServlet")
public class TeamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public TeamServlet() {
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Here is Get");
		req.setCharacterEncoding("UTF-8");
		TeamVO teamVO = null;
		TeamService teamService = null;
		TeamMemberService teamMemberService = null;
		if (null != req.getAttribute("teamId")) {
			try {

				Integer teamId = Integer.valueOf(req.getParameter("teamId"));
				teamService = new TeamService();
				teamVO = teamService.getOne(teamId);
				req.setAttribute("teamVO", teamVO);
				teamMemberService.getOneTeam(teamId);

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			System.out.println("please pass teamId.");
			return;
		}

	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		ServletContext context = req.getServletContext();
		Boolean error = false;
		TeamService teamService = null;
		TeamVO teamVO = null;
		try {
			teamService = new TeamService();
			teamVO = new TeamVO();

			String teamName = req.getParameter("teamName");
			if (null != teamName && teamName.trim().length() != 0) {
				teamVO.setTeamName(teamName);
			} else {
				error = true; // 表示發生錯誤
			}

			String teamProp = req.getParameter("teamProp");
			teamVO.setTeamProp(Integer.valueOf(teamProp));

			MemberVO memberVO = (MemberVO) context.getAttribute("LoginOK");
			String teamMemberId = memberVO.getMemberId();
			if (null != teamMemberId && teamMemberId.length() != 0) {
				teamVO.setTeamHead(teamMemberId);
			} else {
				error = true;
			}
			if (!error) {
				teamService.createTeam(teamVO);
			} else {
				System.out.println("error!!!");
				return;
			}
		} catch (Exception e) {
			System.out.println("整合後取得memberVO，即可正常運作");
		}

	}

}
