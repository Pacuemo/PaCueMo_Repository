package _10_team_controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import _10_team_service.TeamService;
import _9_10_team_model.TeamVO;
import _9_41_member_model.MemberVO;

@WebServlet("/TeamServlet")
public class TeamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public TeamServlet() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
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
			Integer teamMemberId = Integer.valueOf(memberVO.getMemberId());
			if (null != teamMemberId && teamMemberId != 0) {
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

		}

	}

}
