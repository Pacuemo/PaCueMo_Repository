package _9_26_fightRecord_model;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component("FightRecordVO")
public class FightRecordVO implements Serializable
{

	private static final long serialVersionUID = 1L;

	private int fightId;
	private int clubId;
	private String clubMemberId;
	private int gamePlayer;
	private String position;
	private boolean gameStart;
	private String minPlay;
	private int trePA;
	private int trePM;
	private double trePP;
	private int twoPA;
	private int twoPM;
	private double twoPP;
	private int fta;
	private int ftm;
	private double ftp;
	private int ofRep;
	private int deRep;
	private int totalRep;
	private int ass;
	private int steal;
	private int block;
	private int turnOver;
	private int fouls;
	private int score;

	public FightRecordVO()
	{

	}

	public FightRecordVO(int fightId, int clubId, String clubMemberId, int gamePlayer, String position, boolean gameStart, String minPlay, int trePA, int trePM, int twoPA, int twoPM, int fta, int ftm, int ofRep, int deRep, int totalRep, int ass, int steal, int block, int turnOver, int fouls, int score)
	{
		super();
		this.fightId = fightId;
		this.clubId = clubId;
		this.clubMemberId = clubMemberId;
		this.gamePlayer = gamePlayer;
		this.position = position;
		this.gameStart = gameStart;
		this.minPlay = minPlay;
		this.trePA = trePA;
		this.trePM = trePM;
		this.trePP = (double) trePM * 100 / (double) trePA;
		this.twoPA = twoPA;
		this.twoPM = twoPM;
		this.twoPP = (double) twoPM * 100 / (double) twoPA;
		this.fta = fta;
		this.ftm = ftm;
		this.ftp = (double) ftm * 100 / (double) fta;
		this.ofRep = ofRep;
		this.deRep = deRep;
		this.totalRep = totalRep;
		this.ass = ass;
		this.steal = steal;
		this.block = block;
		this.turnOver = turnOver;
		this.fouls = fouls;
		this.score = score;
	}

	public FightRecordVO(int fightId, int clubId, String clubMemberId, int gamePlayer, String position, boolean gameStart, String minPlay, int trePA, int trePM, double trePP, int twoPA, int twoPM, double twoPP, int fta, int ftm, double ftp, int ofRep, int deRep, int totalRep, int ass, int steal, int block, int turnOver, int fouls, int score)
	{

		this.fightId = fightId;
		this.clubId = clubId;
		this.clubMemberId = clubMemberId;
		this.gamePlayer = gamePlayer;
		this.position = position;
		this.gameStart = gameStart;
		this.minPlay = minPlay;
		this.trePA = trePA;
		this.trePM = trePM;
		this.trePP = trePP;
		this.twoPA = twoPA;
		this.twoPM = twoPM;
		this.twoPP = twoPP;
		this.fta = fta;
		this.ftm = ftm;
		this.ftp = ftp;
		this.ofRep = ofRep;
		this.deRep = deRep;
		this.totalRep = totalRep;
		this.ass = ass;
		this.steal = steal;
		this.block = block;
		this.turnOver = turnOver;
		this.fouls = fouls;
		this.score = score;
	}

	public int getFightId()
	{
		return fightId;
	}

	public void setFightId(int fightId)
	{
		this.fightId = fightId;
	}

	public int getClubId()
	{
		return clubId;
	}

	public void setClubId(int clubId)
	{
		this.clubId = clubId;
	}

	public String getClubMemberId()
	{
		return clubMemberId;
	}

	public void setClubMemberId(String clubMemberId)
	{
		this.clubMemberId = clubMemberId;
	}

	public int getGamePlayer()
	{
		return gamePlayer;
	}

	public void setGamePlayer(int gamePlayer)
	{
		this.gamePlayer = gamePlayer;
	}

	public String getPosition()
	{
		return position;
	}

	public void setPosition(String position)
	{
		this.position = position;
	}

	public boolean isGameStart()
	{
		return gameStart;
	}

	public void setGameStart(boolean gameStart)
	{
		this.gameStart = gameStart;
	}

	public String getMinPlay()
	{
		return minPlay;
	}

	public void setMinPlay(String minPlay)
	{
		this.minPlay = minPlay;
	}

	public int getTrePA()
	{
		return trePA;
	}

	public void setTrePA(int trePA)
	{
		this.trePA = trePA;
	}

	public int getTrePM()
	{
		return trePM;
	}

	public void setTrePM(int trePM)
	{
		this.trePM = trePM;
	}

	public double getTrePP()
	{
		return trePP;
	}

	public void setTrePP(double trePP)
	{
		this.trePP = trePP;
	}

	public int getTwoPA()
	{
		return twoPA;
	}

	public void setTwoPA(int twoPA)
	{
		this.twoPA = twoPA;
	}

	public int getTwoPM()
	{
		return twoPM;
	}

	public void setTwoPM(int twoPM)
	{
		this.twoPM = twoPM;
	}

	public double getTwoPP()
	{
		return twoPP;
	}

	public void setTwoPP(double twoPP)
	{
		this.twoPP = twoPP;
	}

	public int getFta()
	{
		return fta;
	}

	public void setFta(int fta)
	{
		this.fta = fta;
	}

	public int getFtm()
	{
		return ftm;
	}

	public void setFtm(int ftm)
	{
		this.ftm = ftm;
	}

	public double getFtp()
	{
		return ftp;
	}

	public void setFtp(double ftp)
	{
		this.ftp = ftp;
	}

	public int getOfRep()
	{
		return ofRep;
	}

	public void setOfRep(int ofRep)
	{
		this.ofRep = ofRep;
	}

	public int getDeRep()
	{
		return deRep;
	}

	public void setDeRep(int deRep)
	{
		this.deRep = deRep;
	}

	public int getTotalRep()
	{
		return totalRep;
	}

	public void setTotalRep(int totalRep)
	{
		this.totalRep = totalRep;
	}

	public int getAss()
	{
		return ass;
	}

	public void setAss(int ass)
	{
		this.ass = ass;
	}

	public int getSteal()
	{
		return steal;
	}

	public void setSteal(int steal)
	{
		this.steal = steal;
	}

	public int getBlock()
	{
		return block;
	}

	public void setBlock(int block)
	{
		this.block = block;
	}

	public int getTurnOver()
	{
		return turnOver;
	}

	public void setTurnOver(int turnOver)
	{
		this.turnOver = turnOver;
	}

	public int getFouls()
	{
		return fouls;
	}

	public void setFouls(int fouls)
	{
		this.fouls = fouls;
	}

	public int getScore()
	{
		return score;
	}

	public void setScore(int score)
	{
		this.score = score;
	}

	public static long getSerialversionuid()
	{
		return serialVersionUID;
	}

}
