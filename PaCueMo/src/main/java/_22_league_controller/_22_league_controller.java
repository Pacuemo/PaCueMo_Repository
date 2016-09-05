package _22_league_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;

import _22_league_service._22_league_service;

@Controller
@RequestMapping("/league")
public class _22_league_controller
{
	@Autowired
	private _22_league_service service;
	@Autowired
	private Gson gson;

}
