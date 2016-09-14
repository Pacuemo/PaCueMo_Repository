package _10_steven_facade;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import _10_team_service.TeamService;
import _11_teammember_service.TeamMemberService;
import _9_10_team_model.TeamVO;

@Component
public class StevenFacade
{
	@Autowired
	private TeamService teamService;
	@Autowired
	private TeamMemberService teamMemberService;

	public TeamVO getTeamById(Integer teamId)  // Use: TeamServlet(GET),
	{
		System.out.println("StevenFacade : getTeamById");
		TeamVO teamVO = teamService.getTeamById(teamId);
		System.out.println("add TeamMemberVOs to teamVO");
		teamVO.setTeamMemberVOs(teamMemberService.getOneTeam(teamId));
		System.out.println("-------------------------------------------------------");
		return teamVO;
	}
}
