package _21_club_controller;

import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import _9_41_member_model.MemberVO;

@Controller
@RequestMapping(value = "/club")
public class Club_Controller
{
	@Autowired
	private Club_Service service;
	@Autowired
	private Gson gson;

	//---------------------------index--------------------------------
	@RequestMapping(value = "/introduce", method = RequestMethod.GET)
	public String introduceClub()
	{
		return "club/introduce";
	}

	//---------------------------登入--------------------------------
	@RequestMapping(value = "/joinClub", method = RequestMethod.GET)
	public String joinClub()
	{
		return "club/joinClub";
	}

	@RequestMapping(value = "/myClub", method = RequestMethod.GET)
	public String myClub()
	{
		return "club/myClub";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET, produces = "text/plain; charset=utf-8")
	public String get_Club_By_member(HttpSession session)
	{
		ClubVO clubVO;
		try
		{
			clubVO = service.getClub_byMemberId(((MemberVO) session.getAttribute("LoginOK")).getMemberId());
		}
		catch (RuntimeException e)
		{
			//此會員沒有社團
			return "redirect:/spring/club/joinClub";
		}
		session.setAttribute("MyClub", clubVO);
		return "redirect:/spring/club/myClub";
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
		clubVO.setClubHead(((MemberVO) session.getAttribute("LoginOK")).getMemberId());
		if (errors.hasErrors())
		{
			return "club/registerForm";
		}
		int success = service.registerClub(clubVO);
		if (success == 1)
		{
			session.setAttribute("MyClub", clubVO);
			return "/club/success";
		}
		else
		{
			return "club/error";
		}
	}

//------------------------查詢------------------------------------	
	@ResponseBody
	@RequestMapping(value = "/search", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public String club_By_Name(@RequestParam("name") String name)
	{
		return gson.toJson(service.searchClub(name));
	}

	@ResponseBody
	@RequestMapping(value = "/getById", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public String get_Club_By_Id(@RequestParam("clubId") int clubId)
	{
		return gson.toJson(service.getClub(clubId));
	}

	@RequestMapping(value = "/searchName", method = RequestMethod.GET)
	public String clubByName(@RequestParam("name") String name, HttpServletRequest request)
	{
		request.setAttribute("club", service.searchClub(name));
		return "/club/searchClub";
	}

//	-------------------申請加入社團---------------------------
	@ResponseBody
	@RequestMapping(value = "/apply", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public String applyClub(@RequestParam("club") int clubId, @RequestParam("memberId") String memberId) throws IOException
	{
		Map<String, String> message = new HashMap<String, String>();
		String outCome = service.applyClub(clubId, memberId);
		if (outCome == "success")
		{
			message.put("status", "申請成功");
		}
		else
		{
			message.put("status", "申請失敗，請確認是否已有社團");
		}
		return gson.toJson(message);
	}

}
