USE MagicJack;

DROP TABLE fightRecord;
DROP TABLE leagueRecord;
DROP TABLE PlayerRecord;
DROP TABLE PlayerCard;
DROP TABLE FriendsList;
DROP TABLE report;
DROP TABLE teamMember;
DROP TABLE battleRecord;
DROP TABLE Invitation;
DROP TABLE team;
DROP TABLE goodsOrder;
DROP TABLE gambleOrder;
DROP TABLE battleSet;
-- DROP TABLE goods;
DROP TABLE LeagueClub;
DROP TABLE league;
DROP TABLE [Message];
DROP TABLE ClubChat;
DROP TABLE clubMemberTable;
DROP TABLE club;
DROP TABLE NBATeam;
DROP TABLE court;
DROP TABLE MemberScratchCode;
DROP TABLE Member;


CREATE TABLE Member
    (
      memberId           /*�|���s��*/              UNIQUEIDENTIFIER NOT NULL  DEFAULT newid() PRIMARY KEY NONCLUSTERED ,              
      memberFirstName    /*�|���W�r*/              NVARCHAR(10) NOT NULL ,
	  memberLastName     /*�|���m��*/              NVARCHAR(10) NOT NULL ,
      memberPassword     /*�|���K�X*/              VARCHAR(32) ,
      memberBirthday     /*�|���ͤ�(�~��)*/        DATE NOT NULL ,
      memberPhone        /*�|���q��*/              VARCHAR(15) NOT NULL ,
      memberMail         /*�|��e-mail*/            VARCHAR(64) UNIQUE NOT NULL ,                                               
      memberImgUrl       /*�|���Ӥ��ɦW*/          VARCHAR(50) ,
      memberPoint        /*�|���I��*/              DECIMAL(10, 2) ,
      memberHaveCard     /*�|���O�_���y���d*/      BIT ,
      memberFbId         /*�|���y��Id*/            VARCHAR(20),
      memberType         /*�|�����A*/              INT , -- (1)�@��|��,(2)�޲z��,(3)�¦W��...
      memberRgDateTime   /*�|�����U�ɶ�*/          DATETIME NOT NULL,
	  memberMailStatus   /*�|���O�_�q�L����*/      BIT ,          
	  memberOutDate      /*�|���ק�K�X�L���ɶ�*/  DATETIME ,
	  memberValidateCode /*�|�����ҽX*/            CHAR(36),
	  memberSecretKey    /*�|�����_*/              CHAR(36),
	  member2StepVerify  /*�O�_�}�Ҩⶥ�q����*/    BIT
    )

CREATE TABLE MemberScratchCode
(
    memberId     /*�|���s��*/         UNIQUEIDENTIFIER FOREIGN KEY  REFERENCES member(memberId),
	scratchCode  /*�|���ƥνX*/       INT,
	isUsed       /*�ƥνX�O�_�ιL*/   BIT
	PRIMARY KEY(memberId,scratchCode)
);

--�y�����--
CREATE TABLE Court
(
	courtId			    /*�s��*/		        INT				NOT NULL  PRIMARY KEY IDENTITY,
	name                /*�y���W��*/			nvarchar(50)    NOT NULL,
	courtaddress		/*�a�}*/		        NVARCHAR(50)	NOT NULL,
	imgUrl			    /*�Ӥ�*/				VARCHAR(MAX)	NOT NULL,
	latitude            /*�n��*/                decimal(15,12)  NOT NULL,
	longitude           /*�g��*/                decimal(15,12)  NOT NULL,
	webUrl              /*�����s��*/            varchar(100)     NOT NULL,
	phone			    /*�p���q��*/			varchar(30)    NOT NULL,
); 
 

--�^�����D--
CREATE TABLE Report
(
	reportId	    /*�s��*/		INT				NOT NULL  PRIMARY KEY IDENTITY,
	reportMemberId	/*�|���s��*/	UNIQUEIDENTIFIER             NOT NULL  FOREIGN KEY REFERENCES member(memberId),
	reportType		/*���D����*/	INT				NOT NULL  ,
	reportContent	/*���e*/		NVARCHAR(500)	NOT NULL  ,
);

create table Team   --����
(
    teamId       /*����s��*/  INT           NOT NULL IDENTITY PRIMARY KEY,
	teamName     /*����W��*/  NVARCHAR(10)  NOT NULL,
	createDate   /*�Х߮ɶ�*/  DATE          NOT NULL DEFAULT GETDATE(),
	teamProp     /*����ʽ�*/  INT           NOT NULL, -- (0)���},(1)�ݥӽ�,(2)�p�K
	avgRank	     /*��������*/  decimal(2,1)  , -- �s�춤������ PlayerRank
	teamHead	 /*�����s��*/  UNIQUEIDENTIFIER NOT NULL FOREIGN KEY REFERENCES member(memberId),
	content		 /*����²��*/  NVARCHAR(200) 
);   


create table BattleRecord   --���Ԭ���
(
    battleId       /*���Խs��*/   INT             IDENTITY PRIMARY KEY, 
	teamIdA        /*����1*/      INT             NOT NULL FOREIGN KEY REFERENCES team(teamId), 
	teamIdB        /*����2*/      INT             FOREIGN KEY REFERENCES team(teamId),
	battleStatus   /*�P�N���A*/   BIT			  ,
	courtId        /*���a*/       INT             NOT NULL FOREIGN KEY REFERENCES court(courtId),
	battleMode     /*�Ҧ�*/       INT             NOT NULL, -- (3)���3V3 (5)���5V5
	battleBet      /*��`*/       decimal(10, 2)  ,
	battleDateTime /*���*/       datetime		  NOT NULL, 
	-- gender         /*����ʧO*/   BIT          ,
	result         /*��Ĺ*/       INT             , -- (0)�N��AĹ, (1)�N��BĹ, (2)�N��S��Ĺ, (3)�N��Ĭ�
	reportA        /*����1�^��*/  INT             , -- (0)�N��AĹ, (1)�N��BĹ, (2)�N��S��Ĺ, (3)�N������
	reportB		   /*����2�^��*/  INT             , -- (0)�N��AĹ, (1)�N��BĹ, (2)�N��S��Ĺ, (3)�N������
);  


 


CREATE TABLE TeamMember -- �����
(   teamId        /*����s��*/   INT  NOT NULL  FOREIGN KEY REFERENCES team(teamId),
	teamMemberId  /*�����*/   UNIQUEIDENTIFIER  NOT NULL  FOREIGN KEY REFERENCES member(memberId),
	joinDate      /*�[�J���*/   DATE NOT NULL DEFAULT GETDATE()
	

	PRIMARY KEY(teamId,teamMemberId) ,
)




/*
CREATE TABLE teamRank -- �������
(   
    rankId          /*�����s��*/    INT          NOT NULL  IDENTITY primary key,
    teamId          /*����s��*/    INT          NOT NULL  FOREIGN KEY REFERENCES team(teamId),
	rankDateTime   /*���*/        datetime     NOT NULL,
	memberId        /*�����HId*/    INT          NOT NULL FOREIGN KEY REFERENCES member(memberId),
	ranking         /*����*/        decimal(2,1) not null
)
*/



--�y�Ϊ��--
CREATE TABLE Club 
(
	clubId			/*�y�νs��*/	INT           NOT NULL PRIMARY KEY IDENTITY,
	clubName		/*�y�ΦW��*/	NVARCHAR(20)  NOT NULL,
	clubImgUrl      /*�Ϥ�URL*/     VARCHAR(50),
	clubDate		/*�Ыؤ��*/	DATE          NOT NULL,
	clubHead		/*�Ϊ��s��*/	UNIQUEIDENTIFIER NOT NULL FOREIGN KEY REFERENCES member(memberId),
    clubProp		/*�y�Ωʽ�*/	INT           NOT NULL,
);


--�y�Φ������--
CREATE TABLE ClubMemberTable
(
	clubId			/*�y�νs��*/	INT			 NOT NULL FOREIGN KEY REFERENCES club(clubId),
    clubMemberId	/*�έ��s��*/	UNIQUEIDENTIFIER NOT NULL FOREIGN KEY REFERENCES member(memberId),
    joinDate		/*�[�J���*/	DATE		 NOT NULL

	PRIMARY KEY(clubId,clubMemberId)
);
--�y�ΥӽЪ�--
CREATE TABLE ClubApply
(
clubId	    /*�[�J�y��*/    INT              FOREIGN KEY REFERENCES club(clubId) NOT NULL ,
memberId    /*�ӽФH�s��*/  UNIQUEIDENTIFIER FOREIGN KEY REFERENCES Member(MemberId) NOT NULL ,
applyDate   /*�ӽЮɶ�*/    Date  NOT NULL ,
PRIMARY KEY(clubId,memberId)
);
--�y���ܽЪ�--
CREATE TABLE ClubInvite
(
clubId         /*�ܽЪ���*/  INT              FOREIGN KEY REFERENCES club(clubId) NOT NULL ,
memberId       /*�ܽФH*/    UNIQUEIDENTIFIER FOREIGN KEY REFERENCES Member(MemberId) NOT NULL ,
clubMemberId   /*�Q�ܽФH*/  UNIQUEIDENTIFIER FOREIGN KEY REFERENCES Member(MemberId) NOT NULL ,
inviteDay      /*�ܽЮɶ�*/  Date  NOT NULL ,
PRIMARY KEY(clubId,memberId)
);

--�y�β�Ѫ�--
CREATE TABLE ClubChat
(
chatId          /*��ѽs��*/    INT          identity PRIMARY KEY,
clubId			/*�y�νs��*/	INT			 NOT NULL,
clubmemberId    /*�d���H*/      UNIQUEIDENTIFIER NOT NULL,
title           /*��Ѽ��D*/    nVARCHAR(30) NOT NULL,
content         /*��Ѥ��e*/    nVARCHAR(200)NOT NULL,
chatDateTime    /*��Ѯɶ�*/    datetime     NOT NULL,
FOREIGN KEY (clubId,clubMemberId) REFERENCES ClubMemberTable (clubId,clubMemberId), 
)

CREATE TABLE Invitation 
(	invId		  /*�ܽнs��*/	INT	NOT NULL IDENTITY PRIMARY KEY,
	memberA		  /*�ܽФH*/    UNIQUEIDENTIFIER NOT NULL FOREIGN KEY REFERENCES Member(memberId),
	memberB		  /*�Q�ܽФH*/  UNIQUEIDENTIFIER NOT NULL FOREIGN KEY REFERENCES Member(memberId),
	teamId		  /*����s��*/  INT NOT NULL FOREIGN KEY REFERENCES Team(teamId),
	clubId		  /*�y�νs��*/  INT NOT NULL FOREIGN KEY REFERENCES Club(clubId),
	invstatus     /*�ܽЪ��A*/  INT -- (1)��ܱ��� (0)��ܩ|���M�w (-1)��ܩڵ�
);

--�y�β�ѯd����--
CREATE TABLE [��essage]
(
messageId       /*�d���s��*/    INT          identity Primary Key,
chatId          /*��ѽs��*/    INT          FOREIGN KEY REFERENCES ClubChat(chatId),
clubId			/*�y�νs��*/	INT			 NOT NULL,
clubmemberId    /*�d���H*/      UNIQUEIDENTIFIER NOT NULL,
content         /*��Ѥ��e*/    nVARCHAR(100)NOT NULL,
chatDateTime    /*��Ѯɶ�*/    datetime     NOT NULL,
FOREIGN KEY (clubId,clubMemberId) REFERENCES ClubMemberTable (clubId,clubMemberId), 
)


--�p�ɥD���--
CREATE TABLE League
(
	leagueId		/*�p�ɽs��*/		 INT          NOT NULL	PRIMARY KEY IDENTITY,
    leagueName		/*�p�ɦW��*/		 NVARCHAR(10) NOT NULL,
    clubAmount		/*�ѥ[�y�μ�*/       INT		  NOT NULL,
    startDate		/*�_�l�ɶ�*/		 DATE         NOT NULL,
	endDate			/*�����ɶ�*/		 DATE         NOT NULL,
    courtId			/*���aId*/		     INT		  NOT NULL  FOREIGN KEY REFERENCES court(courtId),
);

--�p�ɥD���--
CREATE TABLE LeagueClub
(
	leagueId		/*�p�ɽs��*/		 INT          NOT NULL	FOREIGN KEY REFERENCES League(LeagueId),
    clubId    		/*�y�νs��*/		 INT          FOREIGN KEY REFERENCES Club(ClubId),
    primary key (leagueId,clubId)
);



--��u�p�ɪ��--
CREATE TABLE LeagueRecord
(
	fightId			/*����s��*/		  INT	     NOT NULL PRIMARY KEY IDENTITY,
	leagueId		/*�p�ɽs��*/		  INT	     NOT NULL FOREIGN KEY REFERENCES league(leagueId) ,
    clubIdA			/*��Ԫ��νs��*/	  INT        NOT NULL FOREIGN KEY REFERENCES club(clubId),
	clubIdB			/*��Ԫ��νs��*/	  INT        NOT NULL FOREIGN KEY REFERENCES club(clubId),
	fightDateTime   /*�����ɶ�*/		  DATETIME   NOT NULL,
	rounds			/*���ɽ���*/		  INT,
	scoreA			/*���ɱo��*/		  INT,
	scoreB			/*���ɱo��*/		  INT,
	totalTime       /*���ɮɶ�*/          varchar(10),
	foreign key (leagueId,clubIdA) REFERENCES LeagueClub(leagueId,clubId),
    foreign key (leagueId,clubIdB) REFERENCES LeagueClub(leagueId,clubId),
);

--����p�ɪ��--
CREATE TABLE FightRecord
(
	fightId			/*����s��*/			INT		 NOT NULL FOREIGN KEY REFERENCES leagueRecord(fightId) ,
    clubId			/*���νs��*/			INT      NOT NULL ,
	clubMemberId	/*�ѻP��Ԧ���*/		UNIQUEIDENTIFIER  NOT NULL ,
	gamePlayer      /*�I��*/                INT,
	position        /*��m*/                varchar(10),
	gameStart       /*���o*/                bit,
	minPlay         /*�W���ɶ�*/            varchar(10),
	trePA			/*�T���y�X��*/		    INT      ,
	trePM   		/*�T���y�i�y*/		    INT      ,
	trePP		    /*�T���y%*/		        decimal(4,1)      ,
	twoPA			/*�G���y�X��*/		    INT		 ,
	twoPM		    /*�G���y�i�y*/		    INT      ,
	twoPP		    /*�G���y%*/		        decimal(4,1)      ,
	fta             /*�@�y��*/              INT,
	ftm             /*�@�i�y��*/            INT,
	ftp             /*�@�y%*/               decimal(4,1),
	ofRep           /*�i���x�O*/            INT,
	deRep           /*���u�x�O*/            INT,
	totalRep        /*�`�x�O*/              INT,
	ass             /*�U��*/                INT,
	steal           /*�ۺI*/                INT,
	block           /*����*/                INT,
	turnOver        /*���~*/                INT,
	fouls           /*�ǳW*/                INT,
	score			/*�����o��*/		    INT      ,
	FOREIGN KEY (clubId,clubMemberId) REFERENCES ClubMemberTable(clubId,clubMemberId),
	PRIMARY KEY (fightId,clubMemberId)
);




CREATE TABLE FriendsList
    (
      memberId           /*�|���s��*/              UNIQUEIDENTIFIER FOREIGN KEY REFERENCES Member ( memberId ) , 
      memberFriendId     /*�|���n�ͪ��s��*/        UNIQUEIDENTIFIER FOREIGN KEY REFERENCES Member ( memberId ) , 
	  memberBlackList    /*�|���¦W��*/            BIT ,
	  PRIMARY KEY(memberId,memberFriendId)
    );

CREATE TABLE PlayerCard
    (
      memberId           /*�|���s��*/              UNIQUEIDENTIFIER PRIMARY KEY FOREIGN KEY REFERENCES Member ( memberId ), 
      playerGender       /*�y���d�ʧO*/            BIT NOT NULL ,  
      playerHeight       /*�y���d����*/            DECIMAL(5, 2) NOT NULL , 
      playerWeight       /*�y���d�魫*/            DECIMAL(5, 2) NOT NULL , 
      playerPosition     /*�y���d�y��*/            NVARCHAR(3) NOT NULL ,
      playerHand         /*�y���d�D�Τ�*/          BIT NOT NULL , 
      playerNote         /*�y���d�Ƶ�(�ۧڱ���)*/  NVARCHAR(100) NOT NULL , 
      playerLoation      /*�y���d�a��*/            NVARCHAR(32) NOT NULL , 
      playerSTR          /*�y���d�O�q*/            INT NOT NULL ,
      playerCON          /*�y���d���*/            INT NOT NULL , 
      playerDEX          /*�y���d�ӱ�*/            INT NOT NULL ,
      playerINT          /*�y���d���O*/            INT NOT NULL ,
      playerWIS          /*�y���d�P��*/            INT NOT NULL ,
      playerCHA          /*�y���d�y�O*/            INT NOT NULL 
    );



CREATE TABLE PlayerRecord
    (
	  recordId           /*�s��*/                  INT IDENTITY PRIMARY KEY,
      memberId           /*�|���s��*/              UNIQUEIDENTIFIER FOREIGN KEY REFERENCES Member ( memberId ) , 
      comtMemberId       /*���ת̷|���s��*/        UNIQUEIDENTIFIER FOREIGN KEY REFERENCES Member ( memberId ) , 
      recordDateTime     /*���׮ɶ�*/              DATETIME , 
      title              /*���׼��D*/              NVARCHAR(20) , 
      comt               /*���פ��e*/              NVARCHAR(200),
	  ranking            /*����*/                  decimal(2,1)
    );


-----�y��Table-----
CREATE TABLE NBATeam
(
	  teamId			/*�y���s��*/				      int				IDENTITY	PRIMARY KEY,   
	  teamName		    /*�y���W*/					  VARCHAR(64)		NOT NULL,
	  --filename		    /*�����W*/					  varchar(20)	NOT NULL,
	  teamLogoURL	    /*������src�bserver*/		  VARCHAR(50)	    NOT NULL			
);
-----��Գ���Table-----
CREATE TABLE BattleSet
(
	battleId			/*��ԲզX�s��*/			int				PRIMARY KEY IDENTITY,
    battleDateTime		/*��Ԯɶ�*/				dateTime		NOT NULL,
	homeId		        /*�D������s��*/			int				NOT NULL	 FOREIGN KEY REFERENCES NBATeam(teamId),
	awayId		        /*�ȳ�����s��*/			int				NOT NULL	 FOREIGN KEY REFERENCES NBATeam(teamId),
	homeScore	     	/*�D������o��*/			int				NOT NULL,
	awayScore	    	/*�ȳ�����o��*/			int				NOT NULL,
	homebet	            /*�D������U�`�`�B*/		decimal(10, 2),
	awaybet	            /*�ȳ�����U�`�`�B*/		decimal(10, 2)
);
-----��խq��Table-----
CREATE TABLE GambleOrder
(
    gambleId		/*�U�`�s��*/			  int					IDENTITY		PRIMARY KEY,
	memberId		/*�|���s��*/			  UNIQUEIDENTIFIER      FOREIGN KEY     REFERENCES member(memberId),
	battleId		/*��ԲզX�s��*/		  int					NOT NULL		FOREIGN KEY REFERENCES battleSet(battleId),
	betMoney		/*�U�`���B*/           decimal(10, 2)		NOT NULL,
	betTeam			/*�U�`(�D�B��)��*/     bit					CHECK(betTeam=0 OR betTeam=1) NOT NULL    -- (0)�N��D��, (1)�N��ȶ�
); 

------�N���q��Table-----
CREATE TABLE GoodsOrder
(
	orderId			 /*�q��s��*/			int			  IDENTITY		PRIMARY KEY, 
	memberId		 /*�q�ʷ|���s��*/			UNIQUEIDENTIFIER      FOREIGN KEY  REFERENCES member(memberId),   /*FOREIGN KEY REFERENCES*/
	cardNum          /*�H�Υd��*/			varchar(50)   NOT NULL,
	fullName         /*���d�H���W*/			nVarchar(10)  NOT NULL,
	expire           /*�H�Υd�����*/			varchar(7)    NOT NULL,
	cvc              /*�H�Υd�I��3�X*/		int           NOT NULL,
	ntdQty           /*�x��*/				int           NOT NULL,
	coinQty		     /*�q�ʥN���ƶq*/			int			  NOT NULL,
	orderDateTime	 /*�U�q�ɶ�*/			dateTime	  NOT NULL,
	isPay			/*�I�ڪ��A*/				bit			CHECK(isPay=0 OR isPay=1) NOT NULL
)


------�ӫ~(�N��)Table-----
/*
CREATE TABLE Goods
(
	goodsId		/*�ӫ~�s��*/		int				IDENTITY	PRIMARY KEY,
    goodsName	/*�ӫ~�W��*/		varchar(64)		NOT NULL,
	price		/*�ӫ~���*/		decimal(9, 2)	CHECK(price>=0)	NOT NULL,
	cost		/*�ӫ~����*/		decimal(9, 2)	CHECK(cost>=0) NOT NULL
)
*/
--SELECT * FROM goods





