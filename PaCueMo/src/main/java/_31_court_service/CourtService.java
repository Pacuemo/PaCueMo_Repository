package _31_court_service;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import _9_31_court_model.CourtDAO_interface;
import _9_31_court_model.CourtVO;

@Component
public class CourtService
{
	@Autowired
	private CourtDAO_interface dao;
	@Autowired
	private DataSource dataSource;

//	public CourtService()
//	{
//		dao = new CourtDAO();
//	}

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

	public CourtVO findOne(Integer courtId)
	{
		return dao.findByPrimaryKey(courtId);
	}

	//查詢全部場地
	public List<CourtVO> findAll()
	{
		return dao.getAll();
	}

	//查詢場地 By Name
	public List<CourtVO> findByCourtName(String keyword)
	{
		return dao.findByCourtName(keyword);
	}

	public List<CourtVO> findByAddress(String city, String name)
	{
		return dao.findByAddress(city, name);
	}
}
