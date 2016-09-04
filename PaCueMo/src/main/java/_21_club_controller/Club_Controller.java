package _21_club_controller;

import java.sql.Date;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import _21_club_service.Club_Service;
import _9_21_club_model.ClubVO;

@Controller
public class Club_Controller
{

	private Club_Service service;
	private Gson gson;

	@Autowired
	public void setService(Club_Service service)
	{
		this.service = service;
	}

	@Autowired
	public void setGson(Gson gson)
	{
		this.gson = gson;
	}

	@ResponseBody
	@RequestMapping(value = "/search", method = RequestMethod.GET, produces = "text/plain; charset=utf-8")
	public String club_By_Name(@RequestParam("name") String name)
	{
		return gson.toJson(service.searchClub(name));
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String showRegisterForm()
	{
		return "club/registerForm";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String registerClub(@Valid ClubVO clubVO, Errors errors, HttpServletRequest request)
	{
		System.out.println(clubVO.getClubName());
		clubVO.setClubDate(new Date(System.currentTimeMillis()));
		clubVO.setClubHead("A56404E2-04D9-427E-8D7E-06F44C2EC1CB");
		if (errors.hasErrors())
		{
			return "club/registerForm";
		}
		int success = service.registerClub(clubVO);
		if (success == 1)
		{
			request.getSession().setAttribute("MyClub", clubVO);
			return "club/success";
		}
		else
		{
			return "club/error";
		}
	}

	@RequestMapping(value = "/get", method = RequestMethod.GET, produces = "text/plain; charset=utf-8")
	public String get_Club_By_Id(@RequestParam("clubId") int clubId)
	{
		return gson.toJson(service.getClub(clubId));

	}

	@RequestMapping(value = "/login", method = RequestMethod.GET, produces = "text/plain; charset=utf-8")
	public String get_Club_By_member(@RequestParam("memberId") String memberId, HttpServletRequest request)
	{
		ClubVO clubVO;
		try
		{
			clubVO = service.getClub_byMemberId(memberId);
		}
		catch (SQLException e)
		{
			//此會員沒有社團
			return "error";
		}
		request.getSession().setAttribute("MyClub", clubVO);
		return "clubInfo";
	}
}
