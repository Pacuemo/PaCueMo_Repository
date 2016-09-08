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
		System.out.println("呼叫Club_Controller:/introduce 社團介紹");
		System.out.println("轉入/club/introduce.jsp 介紹社團頁面");
		return "club/introduce";
	}

	//---------------------------登入--------------------------------
	@RequestMapping(value = "/joinClub", method = RequestMethod.GET)
	public String joinClub()
	{
		System.out.println("呼叫Club_Controller:/joinClub 新增社團或加入社團");
		System.out.println("轉入/club/joinClub.jsp 新增社團或加入社團頁面");
		return "club/joinClub";
	}

	@RequestMapping(value = "/myClub")
	public String myClub()
	{
		System.out.println("轉入/club/MyClub.jsp 個人社團頁面");
		return "club/myClub";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET, produces = "text/plain; charset=utf-8")
	public String get_Club_By_member(HttpSession session)
	{
		System.out.println("呼叫Club_Controller:/login 查詢我的社團");
		ClubVO clubVO;
		try
		{
			clubVO = service.getClub_byMemberId(((MemberVO) session.getAttribute("LoginOK")).getMemberId());
		}
		catch (RuntimeException e)
		{
			//此會員沒有社團
			System.out.println("重導:/joinClub 您尚未有社團");
			return "redirect:/spring/club/joinClub";
		}
		session.setAttribute("MyClub", clubVO);
		System.out.println("重導:/myClub 展現個人社團主頁");
		return "redirect:/spring/club/myClub";
	}

//------------------------註冊----------------------------------

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String showRegisterForm()
	{
		System.out.println("呼叫Club_Controller:/register 新增社團");
		System.out.println("轉入/club/registerForm.jsp 註冊社團頁面");
		return "club/registerForm";
	}

	//Spring 驗證流程 當呼叫此方法時，Spring會先去後台比對驗證資料格式正確，才執行方法裡面的程式碼
	@RequestMapping(value = "/register", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String registerClub(@Valid ClubVO clubVO, Errors errors, HttpSession session)
	{
		System.out.println("呼叫Club_Controller:/register 新增社團 POST 上傳資料");
		clubVO.setClubDate(new Date(System.currentTimeMillis()));
		clubVO.setClubHead(((MemberVO) session.getAttribute("LoginOK")).getMemberId());
		if (errors.hasErrors())
		{
			System.out.println("轉入/club/registerForm.jsp 輸入社團資料格式錯誤");
			return "club/registerForm";
		}
		int success = service.registerClub(clubVO);
		if (success == 1)
		{
			session.setAttribute("MyClub", clubVO);
			System.out.println("轉入/club/success.jsp 新增社團成功");
			return "/club/success";
		}
		else
		{
			System.out.println("轉入/club/error.jsp 新增社團失敗");
			return "club/error";
		}
	}

//------------------------查詢------------------------------------	
	@ResponseBody
	@RequestMapping(value = "/search", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public String club_By_Name(@RequestParam("name") String name)
	{
		System.out.println("呼叫Club_Controller:/search 查詢社團 傳入社團模糊名稱");
		System.out.println("回傳多筆社團資料 格式JSON");
		return gson.toJson(service.searchClub(name));
	}

	@ResponseBody
	@RequestMapping(value = "/getById", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public String get_Club_By_Id(@RequestParam("clubId") int clubId)
	{
		System.out.println("呼叫Club_Controller:/getById 查詢社團 傳入社團ID");
		System.out.println("回傳單筆社團資料 格式JSON");
		return gson.toJson(service.getClub(clubId));
	}

	@RequestMapping(value = "/searchName", method = RequestMethod.GET)
	public String clubByName(@RequestParam("name") String name, HttpServletRequest request)
	{
		System.out.println("呼叫Club_Controller:/searchName 查詢社團 傳入社團模糊名稱");
		request.setAttribute("club", service.searchClub(name));
		System.out.println("回傳多筆社團資料 放入Request物件中 Key=club");
		return "/club/searchClub";
	}

//	-------------------申請加入社團---------------------------
	@ResponseBody
	@RequestMapping(value = "/apply", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public String applyClub(@RequestParam("club") int clubId, @RequestParam("memberId") String memberId) throws IOException
	{
		System.out.println("呼叫Club_Controller:/apply 申請加入社團");
		Map<String, String> message = new HashMap<String, String>();
		String outCome = service.applyClub(clubId, memberId);
		if (outCome == "success")
		{
			System.out.println("回傳申請成功字串 格式GSON 物件MAP KEY=status");
			message.put("status", "申請成功");
		}
		else
		{
			System.out.println("回傳申請失敗字串 格式GSON 物件MAP KEY=status");
			message.put("status", "申請失敗，請確認是否已有社團");
		}
		return gson.toJson(message);
	}

}
