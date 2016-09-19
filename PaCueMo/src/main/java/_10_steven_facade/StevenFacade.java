package _10_steven_facade;

import java.util.List;

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
		System.out.println("\nStevenFacade : getTeamById");
		TeamVO teamVO = teamService.getTeamById(teamId);
		System.out.println(" : add TeamMemberVOs to teamVO");
		teamVO.setTeamMemberVOs(teamMemberService.getOneTeam(teamId));
		System.out.println("StevenFacade : End");
		System.out.println("-------------------------------------------------------");
		return teamVO;
	}

	public List<TeamVO> find_TeamVOs_With_TeamHead(String teamHead)
	{
		System.out.println("\nStevenFacade : find_TeamVOs_With_TeamHead");
		List<TeamVO> teamVOs = teamService.find_TeamVOs_With_TeamHead(teamHead);
		System.out.println(" : add TeamMemberVOs to teamVOs");
		for (TeamVO teamVO : teamVOs)
		{
			teamVO.setTeamMemberVOs(teamMemberService.getOneTeam(teamVO.getTeamId()));
		}
		System.out.println("StevenFacade : End");
		System.out.println("-------------------------------------------------------");
		return teamVOs;
	}
}
