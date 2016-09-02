package _21_club_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import _9_21_club_model.ClubDAO_I;
import _9_21_club_model.ClubVO;

@Component
public class SearchClub_Service
{
	private ClubDAO_I dao;

	@Autowired
	public SearchClub_Service(ClubDAO_I dao)
	{
		this.dao = dao;
	}

	public List<ClubVO> searchClub(String name)
	{
		return dao.getAll_By_Name(name);
	}

}
