package _21_club_controller;

import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
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
import _22_league_service.LeagueRecord_Service;
import _9_21_club_model.ClubVO;
import _9_27_clubApply_model.ClubApplyVO;
import _9_41_member_model.MemberVO;

@Controller
@RequestMapping(value = "/club")
public class Club_Controller
{
	@Autowired
	private LeagueRecord_Service leagueRecordService;
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
		System.out.println("-------------------------------------------------------");
		return "club/introduce";
	}

	//---------------------------登入--------------------------------
	@RequestMapping(value = "/joinClub", method = RequestMethod.GET)
	public String joinClub()
	{
		System.out.println("呼叫Club_Controller:/joinClub 新增社團或加入社團");
		System.out.println("轉入/club/joinClub.jsp 新增社團或加入社團頁面");
		System.out.println("-------------------------------------------------------");
		return "club/joinClub";
	}

	@RequestMapping(value = "/myClubA", method = RequestMethod.GET)
	public String myClubA()
	{
		System.out.println("轉入/club/MyClub.jsp 個人社團頁面");
		System.out.println("-------------------------------------------------------");
		return "club/myClub";
	}

	@RequestMapping(value = "/myClub", method = RequestMethod.GET)
	public String myClubB()
	{
		System.out.println("轉入/club/MyClub.jsp 個人社團頁面");
		System.out.println("-------------------------------------------------------");
		return "forward:/spring/club/login";
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

			session.setAttribute("ClubVOss", service.getAll());
			System.out.println("重導:/joinClub 您尚未有社團");
			return "redirect:/spring/club/joinClub";
		}
		Map<String, Integer> winCount = new HashMap<String, Integer>();
		int win = leagueRecordService.win_Count(clubVO.getClubID());
		int lose = clubVO.getLeagueRecordVOs().size() - win;
		winCount.put("win", win);
		winCount.put("lose", lose);
		session.setAttribute("MywinCount", winCount);
		session.setAttribute("MyClub", clubVO);
		System.out.println("重導:/myClub 展現個人社團主頁");
		System.out.println("-------------------------------------------------------");
		return "redirect:/spring/club/myClubA";
	}

//------------------------註冊----------------------------------

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String showRegisterForm()
	{
		System.out.println("呼叫Club_Controller:/register 新增社團");
		System.out.println("轉入/club/registerForm.jsp 註冊社團頁面");
		System.out.println("-------------------------------------------------------");
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
			return "club/joinClub";
		}
		int success = service.registerClub(clubVO);
		if (success == 1)
		{
			session.setAttribute("MyClub", clubVO);
			System.out.println("轉入/club/success.jsp 新增社團成功");
			System.out.println("-------------------------------------------------------");
			return "redirect:/spring/club/login";
		}
		else
		{
			System.out.println("轉入/club/error.jsp 新增社團失敗");
			System.out.println("-------------------------------------------------------");
			return "club/error";
		}
	}

//-----------------------退出社團-------------------------------
	@ResponseBody
	@RequestMapping(value = "deleteClubmember", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public String deleteClubmember(String memberId, String clubHeadId, int clubId, HttpServletRequest request, HttpSession session)
	{
		int success = service.delete_clubMember(memberId);
		System.out.println(memberId);
		System.out.println(clubHeadId);
		if (memberId.equals(clubHeadId))
		{
			System.out.println("---------------------------------------------");
			System.out.println("刪除社團");
			System.out.println("---------------------------------------------");
			service.deleteClub(clubId);

		}
		session.removeAttribute("MyClub");
		Map<String, Integer> message = new HashMap<String, Integer>();
		message.put("status", success);
		return gson.toJson(message);
	}

//-----------------------社團申請-------------------------------
	@ResponseBody
	@RequestMapping(value = "applyCheck", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public String applyChek(@RequestParam("clubId") int clubId)
	{

		List<ClubApplyVO> applyList = service.get_ClubApply(clubId);
		return gson.toJson(applyList);
	}

	@ResponseBody
	@RequestMapping(value = "applyClubInfo", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public String applyClubInfo(@RequestParam("memberId") String memberId)
	{

		List<ClubApplyVO> applyList = service.get_All_memberId(memberId);
		return gson.toJson(applyList);
	}

	@ResponseBody
	@RequestMapping(value = "agreeApply", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String agreeApply(@RequestParam("clubId") int clubId, @RequestParam("memberId") String memberId)
	{
		String msg = service.checkJoinClub(clubId, memberId);
		Map<String, String> message = new HashMap<String, String>();
		message.put("status", msg);
		return gson.toJson(message);
	}

	@ResponseBody
	@RequestMapping(value = "deleteApply", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String deleteApply(@RequestParam("clubId") int clubId, @RequestParam("memberId") String memberId)
	{
		String msg = service.deleteJoinClub(clubId, memberId);
		Map<String, String> message = new HashMap<String, String>();
		message.put("status", msg);
		return gson.toJson(message);
	}

	@ResponseBody
	@RequestMapping(value = "countChecked", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public String countChecked(@RequestParam("clubId") int clubId)
	{
		int msg = service.count_Checked(clubId);
		return gson.toJson(msg);
	}

	@ResponseBody
	@RequestMapping(value = "countChange", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public String countChange(@RequestParam("clubId") int clubId)
	{
		int msg = service.change_checked(clubId);
		return gson.toJson(msg);
	}

//-----------------------社團申請-------------------------------	
//------------------------查詢------------------------------------	
	@ResponseBody
	@RequestMapping(value = "/search", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public String club_By_Name(@RequestParam("name") String name)
	{
		System.out.println("呼叫Club_Controller:/search 查詢社團 傳入社團模糊名稱");
		System.out.println("回傳多筆社團資料 格式JSON");
		System.out.println("-------------------------------------------------------");
		return gson.toJson(service.searchClub(name));
	}

	@ResponseBody
	@RequestMapping(value = "/getById", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public String get_By_Id(@RequestParam("clubId") int clubId)
	{
		System.out.println("呼叫Club_Controller:/getById 查詢社團 傳入社團ID");
		System.out.println("回傳單筆社團資料 格式JSON");
		System.out.println("-------------------------------------------------------");
		return gson.toJson(service.getClub(clubId));
	}

	@RequestMapping(value = "/getClubById", method = RequestMethod.GET)
	public String get_Club_By_Id(@RequestParam("clubId") int clubId, HttpServletRequest request)
	{
		System.out.println("呼叫Club_Controller:/getClubById 查詢社團 傳入社團ID");
		ClubVO clubVO = service.getClub(clubId);
		Map<String, Integer> winCount = new HashMap<String, Integer>();
		int win = leagueRecordService.win_Count(clubId);
		int lose = clubVO.getLeagueRecordVOs().size() - win;
		winCount.put("win", win);
		winCount.put("lose", lose);
		request.setAttribute("ClubVO", clubVO);
		request.setAttribute("winCount", winCount);
		return "/club/clubIntro";
	}

	@ResponseBody
	@RequestMapping(value = "/searchName", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public String clubByName(@RequestParam("name") String name, HttpServletRequest request)
	{
		System.out.println("呼叫Club_Controller:/searchName 查詢社團 傳入社團模糊名稱");
		String club = gson.toJson(service.searchClub(name));
		System.out.println("回傳多筆社團資料 放入GSON");
		System.out.println("-------------------------------------------------------");
		return club;
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
			message.put("status", "success");
			message.put("statusMsg", "申請成功");
		}
		else if (outCome == "fail")
		{
			System.out.println("回傳申請失敗字串 格式GSON 物件MAP KEY=status");
			message.put("status", "fail");
			message.put("statusMsg", "申請失敗，請確認是否已有社團");
		}
		else if (outCome == "already")
		{
			System.out.println("回傳已經申請字串 格式GSON 物件MAP KEY=status");
			message.put("status", "already");
			message.put("statusMsg", "你已申請，請勿重複申請");
		}
		System.out.println("-------------------------------------------------------");
		return gson.toJson(message);
	}

}
