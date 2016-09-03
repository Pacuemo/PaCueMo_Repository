package _21_club_controller;

import java.sql.Date;

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
	public String registerClub(@Valid ClubVO clubVO, Errors errors)
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
			return "club/success";
		}
		else
		{
			return "club/error";
		}
	}

}
