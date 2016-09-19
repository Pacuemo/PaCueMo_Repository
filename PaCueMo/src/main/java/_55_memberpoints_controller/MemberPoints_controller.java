package _55_memberpoints_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import _9_41_member_model.MemberDAO_Spring;

@Controller
@RequestMapping(value = "/gambleSVC")
public class MemberPoints_controller
{
	@Autowired
	private MemberDAO_Spring mbDAO;
//	@Autowired
//	private Gson gson;

	@ResponseBody
	@RequestMapping(value = "/getPoints", method = RequestMethod.POST, produces = "text/plain; charset=utf-8")
	public String getMbPoints(@RequestParam("mbId") String memberId)// DB查詢member目前點數
	{
		return String.valueOf(mbDAO.findByPrimaryKey(memberId).getMemberPoint());
	}
}
