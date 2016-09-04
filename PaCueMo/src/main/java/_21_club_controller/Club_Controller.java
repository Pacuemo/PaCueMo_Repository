package _21_club_controller;

import java.sql.Date;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;
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

	//---------------------------登入--------------------------------
	@RequestMapping(value = "/login", method = RequestMethod.GET, produces = "text/plain; charset=utf-8")
	public String get_Club_By_member(@RequestParam("memberId") String memberId, HttpSession session)
	{
		ClubVO clubVO;
		try
		{
			clubVO = service.getClub_byMemberId(memberId);
		}
		catch (SQLException e)
		{
			//此會員沒有社團
			return "redirect:/_21_club/joinClub.jsp";
		}
		session.setAttribute("MyClub", clubVO);
		return "clubInfo";
	}

//------------------------註冊----------------------------------

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String showRegisterForm()
	{
		return "club/registerForm";
	}

	//Spring 驗證流程 當呼叫此方法時，Spring會先去後台比對驗證資料格式正確，才執行方法裡面的程式碼
	@RequestMapping(value = "/register", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String registerClub(@Valid ClubVO clubVO, Errors errors, HttpSession session)
	{
		clubVO.setClubDate(new Date(System.currentTimeMillis()));
		clubVO.setClubHead("EF29C07B-F126-44D1-A5BB-005018DC7358");
		if (errors.hasErrors())
		{
			return "club/registerForm";
		}
		int success = service.registerClub(clubVO);
		if (success == 1)
		{
			session.setAttribute("MyClub", clubVO);
			return "redirect:/_21_club/success.jsp";
		}
		else
		{
			return "club/error";
		}
	}

//------------------------查詢------------------------------------	
	@ResponseBody
	@RequestMapping(value = "/search", method = RequestMethod.GET, produces = "text/plain; charset=utf-8")
	public String club_By_Name(@RequestParam("name") String name)
	{
		return gson.toJson(service.searchClub(name));
	}

	@RequestMapping(value = "/get", method = RequestMethod.GET, produces = "text/plain; charset=utf-8")
	public String get_Club_By_Id(@RequestParam("clubId") int clubId)
	{
		return gson.toJson(service.getClub(clubId));

	}

}
