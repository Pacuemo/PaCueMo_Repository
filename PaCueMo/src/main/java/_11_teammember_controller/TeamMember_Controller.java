package _11_teammember_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import _11_teammember_service.TeamMemberService;

@Controller
@RequestMapping("/teamMember")
public class TeamMember_Controller
{
	@Autowired
	private TeamMemberService teamMemberService;

	@RequestMapping(value = "/addTeamMember", method = RequestMethod.POST)
	public String addTeamMember(Integer teamId, String teamMemberId)
	{
		System.out.println("TeamMember_Controller : addTeamMember");
		if (teamId == 0 || teamId == null)
		{
			System.out.println("teamId error");
			return "redirect:/";
		}
		if (teamMemberId == "" || teamMemberId == null)
		{
			System.out.println("teamMemberId error");
			return "redirect:/";
		}
		teamMemberService.add(teamId, teamMemberId);
		System.out.println("新增成功");
		System.out.println("-------------------------------------------------------");
		return "";
	}

}
