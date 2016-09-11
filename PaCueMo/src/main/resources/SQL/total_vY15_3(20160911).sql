USE MagicJack;

DROP TABLE fightRecord;
DROP TABLE leagueRecord;
DROP TABLE PlayerRecord;
DROP TABLE PlayerCard;
DROP TABLE FriendsList;
DROP TABLE report;
DROP TABLE teamMember;
DROP TABLE battleRecord;
DROP TABLE TeamApply;
DROP TABLE TeamInvite;
DROP TABLE team;
DROP TABLE goodsOrder;
DROP TABLE gambleOrder;
DROP TABLE battleSet;
-- DROP TABLE goods;
DROP TABLE LeagueClub;
DROP TABLE league;
DROP TABLE [Message];
DROP TABLE ClubApply;
DROP TABLE ClubInvite;
DROP TABLE ClubChat;
DROP TABLE clubMemberTable;
DROP TABLE club;
DROP TABLE NBATeam;
DROP TABLE court;
DROP TABLE MemberScratchCode;
DROP TABLE Member;


CREATE TABLE Member
    (
      memberId           /*會員編號*/              UNIQUEIDENTIFIER NOT NULL  DEFAULT newid() PRIMARY KEY NONCLUSTERED ,              
      memberFirstName    /*會員名字*/              NVARCHAR(10) NOT NULL ,
	  memberLastName     /*會員姓氏*/              NVARCHAR(10) NOT NULL ,
      memberPassword     /*會員密碼*/              VARCHAR(32) ,
      memberBirthday     /*會員生日(年齡)*/        DATE NOT NULL ,
      memberPhone        /*會員電話*/              VARCHAR(15) NOT NULL ,
      memberMail         /*會員e-mail*/            VARCHAR(64) UNIQUE NOT NULL ,                                               
      memberImgUrl       /*會員照片檔名*/          VARCHAR(50) ,
      memberPoint        /*會員點數*/              DECIMAL(10, 2) ,
      memberHaveCard     /*會員是否有球員卡*/      BIT ,
      memberFbId         /*會員臉書Id*/            VARCHAR(20),
      memberType         /*會員狀態*/              INT , -- (1)一般會員,(2)管理員,(3)黑名單...
      memberRgDateTime   /*會員註冊時間*/          DATETIME NOT NULL,
	  memberMailStatus   /*會員是否通過驗證*/      BIT ,          
	  memberOutDate      /*會員修改密碼過期時間*/  DATETIME ,
	  memberValidateCode /*會員驗證碼*/            CHAR(36),
	  memberSecretKey    /*會員金鑰*/              CHAR(36),
	  member2StepVerify  /*是否開啟兩階段驗證*/    BIT
    )

CREATE TABLE MemberScratchCode
(
    memberId     /*會員編號*/         UNIQUEIDENTIFIER FOREIGN KEY  REFERENCES member(memberId),
	scratchCode  /*會員備用碼*/       INT,
	isUsed       /*備用碼是否用過*/   BIT
	PRIMARY KEY(memberId,scratchCode)
);

--球場表格--
CREATE TABLE Court
(
	courtId			    /*編號*/		        INT				NOT NULL  PRIMARY KEY IDENTITY,
	name                /*球場名稱*/			nvarchar(50)    NOT NULL,
	courtaddress		/*地址*/		        NVARCHAR(50)	NOT NULL,
	imgUrl			    /*照片*/				VARCHAR(MAX)	NOT NULL,
	latitude            /*緯度*/                decimal(15,12)  NOT NULL,
	longitude           /*經度*/                decimal(15,12)  NOT NULL,
	webUrl              /*網路連結*/            varchar(100)     NOT NULL,
	phone			    /*聯絡電話*/			varchar(30)    NOT NULL,
); 
 

--回報問題--
CREATE TABLE Report
(
	reportId	    /*編號*/		INT				NOT NULL  PRIMARY KEY IDENTITY,
	reportMemberId	/*會員編號*/	UNIQUEIDENTIFIER             NOT NULL  FOREIGN KEY REFERENCES member(memberId),
	reportType		/*問題類型*/	INT				NOT NULL  ,
	reportContent	/*內容*/		NVARCHAR(500)	NOT NULL  ,
);

create table Team   --隊伍
(
    teamId       /*隊伍編號*/  INT           NOT NULL IDENTITY PRIMARY KEY,
	teamName     /*隊伍名稱*/  NVARCHAR(10)  NOT NULL,
	createDate   /*創立時間*/  DATE          NOT NULL DEFAULT GETDATE(),
	teamProp     /*隊伍性質*/  INT           NOT NULL, -- (0)公開,(1)需申請,(2)私密
	avgRank	     /*平均評分*/  decimal(2,1)  , -- 連到隊員評分 PlayerRank
	teamHead	 /*隊長編號*/  UNIQUEIDENTIFIER NOT NULL FOREIGN KEY REFERENCES member(memberId),
	content		 /*隊伍簡介*/  NVARCHAR(200) 
);   

create table BattleRecord   --約戰紀錄
(
    battleId       /*約戰編號*/   INT             IDENTITY PRIMARY KEY, 
	teamIdA        /*隊伍1*/      INT             NOT NULL FOREIGN KEY REFERENCES team(teamId), 
	teamIdB        /*隊伍2*/      INT             FOREIGN KEY REFERENCES team(teamId),
	battleStatus   /*同意狀態*/   INT			  , -- (-1)表示拒絕 (0)表示尚未決定 (1)表示接受
	courtId        /*場地*/       INT             NOT NULL FOREIGN KEY REFERENCES court(courtId),
	battleMode     /*模式*/       INT             NOT NULL, -- (3)表示3V3 (5)表示5V5
	battleBet      /*賭注*/       decimal(10, 2)  ,
	battleDateTime /*日期*/       datetime		  NOT NULL, 
	-- gender         /*限制性別*/   BIT          ,
	result         /*輸贏*/       INT,            --(0)未回報,(1)A贏,(2)B贏,(3)沒輸贏,(4)A缺席,(5)B缺席,(6)衝突
	reportA        /*隊伍1回報*/  INT,            --(0)未回報,(1)A贏,(2)B贏,(3)沒輸贏,(4)A缺席,(5)B缺席
	reportB		   /*隊伍2回報*/  INT,            --(0)未回報,(1)A贏,(2)B贏,(3)沒輸贏,(4)A缺席,(5)B缺席
);  

CREATE TABLE TeamMember -- 隊伍成員
(   teamId        /*隊伍編號*/   INT  NOT NULL  FOREIGN KEY REFERENCES team(teamId),
	teamMemberId  /*隊伍成員*/   UNIQUEIDENTIFIER  NOT NULL  FOREIGN KEY REFERENCES member(memberId),
	joinDate      /*加入日期*/   DATE NOT NULL DEFAULT GETDATE()
	PRIMARY KEY(teamId,teamMemberId) ,
)

CREATE TABLE TeamApply
(	teamId		/*隊伍編號*/  INT NOT NULL FOREIGN KEY REFERENCES Team(teamId),
	memberId	/*申請人*/	  UNIQUEIDENTIFIER NOT NULL FOREIGN KEY REFERENCES Member(memberId),
	applystatus /*申請狀態*/  INT DEFAULT 0, -- (1)表示接受 (0)表示尚未決定 (-1)表示拒絕
	applyDate   /*申請時間*/  DATE NOT NULL DEFAULT GETDATE()
	PRIMARY KEY(teamId,memberId)
)

CREATE TABLE TeamInvite 
(	teamId        /*隊伍編號*/  INT NOT NULL FOREIGN KEY REFERENCES Team(teamId),
	memberId	  /*被邀請人*/  UNIQUEIDENTIFIER NOT NULL FOREIGN KEY REFERENCES Member(memberId),
	teamMemberId  /*邀請人*/    UNIQUEIDENTIFIER NOT NULL FOREIGN KEY REFERENCES Member(memberId),
	invstatus     /*邀請狀態*/  INT DEFAULT 0,  -- (1)表示接受 (0)表示尚未決定 (-1)表示拒絕
	inviteDate	  /*邀請時間*/	DATE NOT NULL DEFAULT GETDATE()
	PRIMARY KEY(teamId,memberId)
);

/*
CREATE TABLE teamRank -- 隊伍評價
(   
    rankId          /*評價編號*/    INT          NOT NULL  IDENTITY primary key,
    teamId          /*隊伍編號*/    INT          NOT NULL  FOREIGN KEY REFERENCES team(teamId),
	rankDateTime    /*日期*/        datetime     NOT NULL,
	memberId        /*評價人Id*/    UNIQUEIDENTIFIER NOT NULL FOREIGN KEY REFERENCES Member(memberId),
	ranking         /*評分*/        decimal(2,1) not null
)
*/



--球團表格--
CREATE TABLE Club 
(
	clubId			/*球團編號*/	INT           NOT NULL PRIMARY KEY IDENTITY,
	clubName		/*球團名稱*/	NVARCHAR(20)  NOT NULL,
	clubImgUrl      /*圖片URL*/     VARCHAR(50),
	clubDate		/*創建日期*/	DATE          NOT NULL,
	clubHead		/*團長編號*/	UNIQUEIDENTIFIER NOT NULL FOREIGN KEY REFERENCES member(memberId),
    clubProp		/*球團性質*/	INT           NOT NULL,
);


--球團成員表格--
CREATE TABLE ClubMemberTable
(
	clubId			/*球團編號*/	INT			 NOT NULL FOREIGN KEY REFERENCES club(clubId),
    clubMemberId	/*團員編號*/	UNIQUEIDENTIFIER NOT NULL FOREIGN KEY REFERENCES member(memberId),
    joinDate		/*加入日期*/	DATE		 NOT NULL
	PRIMARY KEY(clubId,clubMemberId)
);

--球團聊天表--
CREATE TABLE ClubChat
(
chatId          /*聊天編號*/    INT          identity PRIMARY KEY,
clubId			/*球團編號*/	INT			 NOT NULL,
clubmemberId    /*留言人*/      UNIQUEIDENTIFIER NOT NULL,
title           /*聊天標題*/    nVARCHAR(30) NOT NULL,
content         /*聊天內容*/    nVARCHAR(200)NOT NULL,
chatDateTime    /*聊天時間*/    datetime     NOT NULL,
FOREIGN KEY (clubId,clubMemberId) REFERENCES ClubMemberTable (clubId,clubMemberId), 
)

--球團申請表--
CREATE TABLE ClubApply
(
clubId	    /*加入球團*/    INT              FOREIGN KEY REFERENCES club(clubId) NOT NULL ,
memberId    /*申請人編號*/  UNIQUEIDENTIFIER FOREIGN KEY REFERENCES Member(MemberId) NOT NULL ,
applyDate   /*申請時間*/    Date  NOT NULL ,
PRIMARY KEY(clubId,memberId)
);
--球團邀請表--
CREATE TABLE ClubInvite
(
clubId         /*邀請社團*/  INT              FOREIGN KEY REFERENCES club(clubId) NOT NULL ,
memberId       /*被邀請人*/  UNIQUEIDENTIFIER FOREIGN KEY REFERENCES Member(MemberId) NOT NULL ,
clubMemberId   /*邀請人*/	 UNIQUEIDENTIFIER FOREIGN KEY REFERENCES Member(MemberId) NOT NULL ,
inviteDay      /*邀請時間*/  Date  NOT NULL ,
PRIMARY KEY(clubId,memberId)
);

--球團聊天留言表--
CREATE TABLE [Ｍessage]
(
messageId       /*留言編號*/    INT          identity Primary Key,
chatId          /*聊天編號*/    INT          FOREIGN KEY REFERENCES ClubChat(chatId),
clubId			/*球團編號*/	INT			 NOT NULL,
clubmemberId    /*留言人*/      UNIQUEIDENTIFIER NOT NULL,
content         /*聊天內容*/    nVARCHAR(100)NOT NULL,
chatDateTime    /*聊天時間*/    datetime     NOT NULL,
FOREIGN KEY (clubId,clubMemberId) REFERENCES ClubMemberTable (clubId,clubMemberId), 
)


--聯賽主表格--
CREATE TABLE League
(
	leagueId		/*聯賽編號*/		 INT          NOT NULL	PRIMARY KEY IDENTITY,
    leagueName		/*聯賽名稱*/		 NVARCHAR(10) NOT NULL,
    clubAmount		/*參加球團數*/       INT		  NOT NULL,
    startDate		/*起始時間*/		 DATE         NOT NULL,
	endDate			/*結束時間*/		 DATE         NOT NULL,
    courtId			/*場地Id*/		     INT		  NOT NULL  FOREIGN KEY REFERENCES court(courtId),
);

--聯賽主表格--
CREATE TABLE LeagueClub
(
	leagueId		/*聯賽編號*/		 INT          NOT NULL	FOREIGN KEY REFERENCES League(LeagueId),
    clubId    		/*球團編號*/		 INT          FOREIGN KEY REFERENCES Club(ClubId),
    primary key (leagueId,clubId)
);



--單季聯賽表格--
CREATE TABLE LeagueRecord
(
	fightId			/*單場編號*/		  INT	     NOT NULL PRIMARY KEY IDENTITY,
	leagueId		/*聯賽編號*/		  INT	     NOT NULL FOREIGN KEY REFERENCES league(leagueId) ,
    clubIdA			/*對戰社團編號*/	  INT        NOT NULL FOREIGN KEY REFERENCES club(clubId),
	clubIdB			/*對戰社團編號*/	  INT        NOT NULL FOREIGN KEY REFERENCES club(clubId),
	fightDateTime   /*場次時間*/		  DATETIME   NOT NULL,
	rounds			/*比賽輪次*/		  INT,
	scoreA			/*比賽得分*/		  INT,
	scoreB			/*比賽得分*/		  INT,
	totalTime       /*比賽時間*/          varchar(10),
	foreign key (leagueId,clubIdA) REFERENCES LeagueClub(leagueId,clubId),
    foreign key (leagueId,clubIdB) REFERENCES LeagueClub(leagueId,clubId),
);

--單場聯賽表格--
CREATE TABLE FightRecord
(
	fightId			/*單場編號*/			INT		 NOT NULL FOREIGN KEY REFERENCES leagueRecord(fightId) ,
    clubId			/*社團編號*/			INT      NOT NULL ,
	clubMemberId	/*參與對戰成員*/		UNIQUEIDENTIFIER  NOT NULL ,
	gamePlayer      /*背號*/                INT,
	position        /*位置*/                varchar(10),
	gameStart       /*先發*/                bit,
	minPlay         /*上場時間*/            varchar(10),
	trePA			/*三分球出手*/		    INT      ,
	trePM   		/*三分球進球*/		    INT      ,
	trePP		    /*三分球%*/		        decimal(4,1)      ,
	twoPA			/*二分球出手*/		    INT		 ,
	twoPM		    /*二分球進球*/		    INT      ,
	twoPP		    /*二分球%*/		        decimal(4,1)      ,
	fta             /*罰球數*/              INT,
	ftm             /*罰進球數*/            INT,
	ftp             /*罰球%*/               decimal(4,1),
	ofRep           /*進攻籃板*/            INT,
	deRep           /*防守籃板*/            INT,
	totalRep        /*總籃板*/              INT,
	ass             /*助攻*/                INT,
	steal           /*抄截*/                INT,
	block           /*阻攻*/                INT,
	turnOver        /*失誤*/                INT,
	fouls           /*犯規*/                INT,
	score			/*成員得分*/		    INT      ,
	FOREIGN KEY (clubId,clubMemberId) REFERENCES ClubMemberTable(clubId,clubMemberId),
	PRIMARY KEY (fightId,clubMemberId)
);




CREATE TABLE FriendsList
    (
      memberId           /*會員編號*/              UNIQUEIDENTIFIER FOREIGN KEY REFERENCES Member ( memberId ) , 
      memberFriendId     /*會員好友的編號*/        UNIQUEIDENTIFIER FOREIGN KEY REFERENCES Member ( memberId ) , 
	  friendStatus    /*會員好友狀態*/          INT ,
	  PRIMARY KEY(memberId,memberFriendId)
    );

CREATE TABLE PlayerCard
    (
      memberId           /*會員編號*/              UNIQUEIDENTIFIER PRIMARY KEY FOREIGN KEY REFERENCES Member ( memberId ), 
      playerGender       /*球員卡性別*/            BIT NOT NULL ,  
      playerHeight       /*球員卡身高*/            DECIMAL(5, 2) NOT NULL , 
      playerWeight       /*球員卡體重*/            DECIMAL(5, 2) NOT NULL , 
      playerPosition     /*球員卡球位*/            NVARCHAR(3) NOT NULL ,
      playerHand         /*球員卡慣用手*/          BIT NOT NULL , 
      playerNote         /*球員卡備註(自我推薦)*/  NVARCHAR(100) NOT NULL , 
      playerLoation      /*球員卡地區*/            NVARCHAR(32) NOT NULL , 
      playerSTR          /*球員卡力量*/            INT NOT NULL ,
      playerCON          /*球員卡體質*/            INT NOT NULL , 
      playerDEX          /*球員卡敏捷*/            INT NOT NULL ,
      playerINT          /*球員卡智力*/            INT NOT NULL ,
      playerWIS          /*球員卡感知*/            INT NOT NULL ,
      playerCHA          /*球員卡魅力*/            INT NOT NULL 
    );



CREATE TABLE PlayerRecord
    (
	  recordId           /*編號*/                  INT IDENTITY PRIMARY KEY,
      memberId           /*會員編號*/              UNIQUEIDENTIFIER FOREIGN KEY REFERENCES Member ( memberId ) , 
      comtMemberId       /*評論者會員編號*/        UNIQUEIDENTIFIER FOREIGN KEY REFERENCES Member ( memberId ) , 
      recordDateTime     /*評論時間*/              DATETIME , 
      title              /*評論標題*/              NVARCHAR(20) , 
      comt               /*評論內容*/              NVARCHAR(200),
	  ranking            /*評分*/                  decimal(2,1)
    );


-----球隊Table-----
CREATE TABLE NBATeam
(
	  teamId			/*球隊編號*/				       int				IDENTITY	PRIMARY KEY,   
	  teamName		    /*球隊名*/				   varchar(64)		NOT NULL,
	  --filename		    /*隊徽名*/			       varchar(20)	NOT NULL,
	  teamLogoURL	    /*隊徽檔src在server*/		   varchar(50)	    NOT NULL			
);
-----對戰場次Table-----
CREATE TABLE BattleSet
(
	battleId				/*對戰組合編號*/				int				PRIMARY KEY IDENTITY,
    battleDateTime		/*對戰時間*/				dateTime		NOT NULL,
	homeId		        /*主場隊伍編號*/			int				NOT NULL	 FOREIGN KEY REFERENCES NBATeam(teamId),
	awayId		        /*客場隊伍編號*/			int				NOT NULL	 FOREIGN KEY REFERENCES NBATeam(teamId),
	homeScore	     	/*主場隊伍得分*/			int				NOT NULL,
	awayScore	    	/*客場隊伍得分*/			int				NOT NULL,
	homebet	            /*主場隊伍下注總額*/		decimal(10, 2),
	awaybet	            /*客場隊伍下注總額*/		decimal(10, 2)
);
-----賭博訂單交易紀錄Table-----
CREATE TABLE GambleOrder
(
    gambleId		/*下注編號*/				 int						IDENTITY		PRIMARY KEY,
	memberId		/*會員編號*/				 UNIQUEIDENTIFIER			FOREIGN KEY     REFERENCES member(memberId),
	battleId		/*對戰組合編號*/			 int						NOT NULL		FOREIGN KEY REFERENCES battleSet(battleId),
	betMoney		/*下注金額*/				 decimal(10, 2)			NOT NULL,
	betTeam		/*下注(主、客)隊*/		 int						CHECK(betTeam=0 OR betTeam=1) NOT NULL    -- (0)代表主隊, (1)代表客隊
); 

------代幣訂單Table-----
CREATE TABLE GoodsOrder 
(
	orderId			 /*訂單編號*/			    int			  IDENTITY		PRIMARY KEY, 
	memberId		     /*訂購會員編號*/			UNIQUEIDENTIFIER      FOREIGN KEY  REFERENCES member(memberId),   /*FOREIGN KEY REFERENCES*/
	cardNum           /*信用卡號*/			varchar(60)   NOT NULL,
	fullName          /*持卡人全名*/			nVarchar(15)  NOT NULL,
	expireYY          /*信用卡到期年*/			varchar(7)    NOT NULL,
	expireMM          /*信用卡到期月*/			varchar(7)    NOT NULL,
	cvc              /*信用卡背面3碼*/		varchar(10)    NOT NULL,
	ntdQty           /*台幣*/				    int           NOT NULL,
	coinQty		     /*訂購代幣數量*/			decimal(10,2)	  NOT NULL,
	orderDateTime	     /*下訂時間*/			    dateTime	      NOT NULL,
	isPay			 /*付款狀態*/				bit			CHECK(isPay=0 OR isPay=1) NOT NULL
)


------商品(代幣)Table-----
/*
CREATE TABLE Goods
(
	goodsId		/*商品編號*/		int				IDENTITY	PRIMARY KEY,
    goodsName	/*商品名稱*/		varchar(64)		NOT NULL,
	price		/*商品售價*/		decimal(9, 2)	CHECK(price>=0)	NOT NULL,
	cost		/*商品成本*/		decimal(9, 2)	CHECK(cost>=0) NOT NULL
)
*/
--SELECT * FROM goods





