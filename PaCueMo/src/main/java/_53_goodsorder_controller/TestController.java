package _53_goodsorder_controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/")
public class TestController
{
	@RequestMapping(value = "/gg/{motherName}", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public @ResponseBody String myTest(@PathVariable("motherName") String name)
	{
		System.out.println("Hello world" + name);
//		return "club/introduce";
		//return "redirect:/spring/club/myClub";
		return "hello " + name;
	}

	@RequestMapping(value = "/gg", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public @ResponseBody String myTest2(/* @RequestParam("fatherName") */ String name)
	{
		System.out.println("Hello world" + name);
//		return "club/introduce";
		//return "redirect:/spring/club/myClub";
		return "hello Father : " + name;
	}
}
