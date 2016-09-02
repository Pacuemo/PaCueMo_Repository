package _21_club_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import _21_club_service.SearchClub_Service;

@Controller
@RequestMapping("/search")
public class SearchClub_Controller
{

	private SearchClub_Service service;
	private Gson gson;

	@Autowired
	public void setService(SearchClub_Service service)
	{
		this.service = service;
	}

	@Autowired
	public void setGson(Gson gson)
	{
		this.gson = gson;
	}

	@ResponseBody
	@RequestMapping(method = RequestMethod.GET, produces = "text/plain; charset=utf-8")
	public String Club_By_Name(@RequestParam("name") String name)
	{
		return gson.toJson(service.searchClub(name));
	}

}
