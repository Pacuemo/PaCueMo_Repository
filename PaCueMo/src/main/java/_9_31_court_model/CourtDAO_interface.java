package _9_31_court_model;

import java.util.List;

public interface CourtDAO_interface
{
	public void insert(CourtVO courtVO);

	public void update(CourtVO courtVO);

	public void delete(Integer courtId);

	public CourtVO findByPrimaryKey(Integer courtId);

	public List<CourtVO> findByName(String name);

	public List<CourtVO> getAll();
}
