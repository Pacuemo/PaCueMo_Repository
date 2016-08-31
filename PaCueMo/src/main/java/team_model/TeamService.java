package team_model;

import java.sql.Date;
import java.util.List;


public class TeamService {
	private TeamDAO_interface dao;
	
	TeamService(){
		dao = new TeamDAO();
	}
	public void add(Integer teamId,String teamName,Date createDate,Integer teamProp) {
		TeamVO teamVO = new TeamVO();
		teamVO.setTeamId(teamId);
		teamVO.setTeamName(teamName);
		teamVO.setCreateDate(createDate);
		teamVO.setTeamProp(teamProp);
		
		dao.insert(teamVO);
	}
	public void add(TeamVO teamVO) {
		dao.insert(teamVO);
	}
	
	public void update(Integer teamId,String teamName,Date createDate,Integer teamProp,Double avgRank) {
		TeamVO teamVO = new TeamVO();
		teamVO.setTeamId(teamId);
		teamVO.setTeamName(teamName);
		teamVO.setCreateDate(createDate);
		teamVO.setTeamProp(teamProp);
		teamVO.setAvgRank(avgRank);
		
		dao.update(teamVO);
	}
	public void update(TeamVO teamVO) {
		dao.update(teamVO);
	}
	
	public void delete(Integer teamId) {
		dao.delete(teamId);
	}
	
	public TeamVO getOne(Integer teamId) {	 
		return dao.findByPrimaryKey(teamId);
	}
	
	public List<TeamVO> getAll() {
		return dao.getAll();
	}
}
