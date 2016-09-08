package _10_team_controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import _11_teammember_service.TeamMemberService;

@Controller
@RequestMapping("/team")
public class TeamController_Spring
{
	@Autowired
	private TeamMemberService teamMemberService;

	@RequestMapping(value = "/joinTeam", method = RequestMethod.GET, produces = "text/plain ; charset=UTF-8")
	public void joinTeam(HttpServletRequest request)
	{
		System.out.println("呼叫 Team_Controller: joinTeam");

		System.out.println("Test End");
		System.out.println("-------------------------------------------------------");

	}

}
