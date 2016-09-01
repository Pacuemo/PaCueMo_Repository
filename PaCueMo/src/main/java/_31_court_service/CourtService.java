package _31_court_service;

import java.util.List;

import _9_31_court_model.CourtDAO;
import _9_31_court_model.CourtDAO_interface;
import _9_31_court_model.CourtVO;

public class CourtService
{
	private CourtDAO_interface dao;

	public CourtService()
	{
		dao = new CourtDAO();
	}

	public void insert(Integer courtId, String name, String courtaddress, String imgUrl, Double latitue, Double longitue, String webUrl, String phone)
	{
		CourtVO courtVO = new CourtVO();
		courtVO.setCourtId(courtId);
		courtVO.setName(name);
		courtVO.setCourtaddress(courtaddress);
		courtVO.setImgUrl(imgUrl);
		courtVO.setLatitue(latitue);
		courtVO.setLongitue(longitue);
		courtVO.setWebUrl(webUrl);
		courtVO.setPhone(phone);

		dao.insert(courtVO);
	}

	public void insert(CourtVO courtVO)
	{
		dao.insert(courtVO);
	}

	public void update(Integer courtId, String name, String courtaddress, String imgUrl, Double latitue, Double longitue, String webUrl, String phone)
	{
		CourtVO courtVO = new CourtVO();
		courtVO.setCourtId(courtId);
		courtVO.setName(name);
		courtVO.setCourtaddress(courtaddress);
		courtVO.setImgUrl(imgUrl);
		courtVO.setLatitue(latitue);
		courtVO.setLongitue(longitue);
		courtVO.setWebUrl(webUrl);
		courtVO.setPhone(phone);

		dao.update(courtVO);
	}

	public void update(CourtVO courtVO)
	{
		dao.update(courtVO);
	}

	public void delete(Integer courtId)
	{
		dao.delete(courtId);
	}

//各種查詢
	//查詢單一場地
	public CourtVO findOne(Integer courtId)
	{
		return dao.findByPrimaryKey(courtId);
	}

	//查詢縣市場地(building...)
	public List<CourtVO> findCountyAll()
	{
		return dao.getAll();
	}

	//查詢行政區場地(building...)
	public List<CourtVO> findCityandTownship()
	{
		return dao.getAll();
	}
}
