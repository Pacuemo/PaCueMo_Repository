﻿--聯賽主表格--
use magicJack;

DROP TABLE FightRecord;
DROP TABLE LeagueRecord;
DROP TABLE LeagueClub;
DROP TABLE League;


--聯賽表格--
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
	groups          /*組別*/              INT,
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
	winner          /*勝力隊伍ID*/        INT,
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

--建立台北市場地資料--
insert into Court values ('松山高中活動中心','臺北市信義區基隆路一段156號','http://az804957.vo.msecnd.net/photogym/20140620140540_DSCN1826.JPG','25.0437170025906','121.565426588058','http://www.sssh.tp.edu.tw','(02)27535968');
insert into Court values ('民生國小操場','臺北市松山區敦化北路199巷18號','http://az804957.vo.msecnd.net/photogym/20140730152034_DSC05322.jpg','25.056120666621','121.552723646164','http://www.msps.tp.edu.tw','(02)27122452*821');
insert into Court values ('文山特殊教育學校體育館','[116]臺北市文山區秀明路一段169號','http://az804957.vo.msecnd.net/photogym/20140730152515_P7307487.JPG','24.9919121696647','121.567148566246','http://www.wsses.tp.edu.tw/','(02)86615183#302');
insert into Court values ('陽明大學活動中心','臺北市北投區立農街二段155號','http://az804957.vo.msecnd.net/photogym/20140620141950_CIMG0740.JPG','25.1216217021507','121.51424869895','http://pe.web.ym.edu.tw/front/bin/home.phtml','(02)28267000#2209');
insert into Court values ('國防醫學院活動中心','臺北市內湖區民權東路六段161號 ','http://az804957.vo.msecnd.net/photogym/20140708150401_0023.jpg','25.0720951414727','121.597173213959','http://www.ndmctsgh.edu.tw/','(02)87923144');
insert into Court values ('臺北市立大學體育館（天母校區）','臺北市士林區忠誠路二段101號','http://az804957.vo.msecnd.net/photogym/20140604162334_th.jpg','25.1161156937892','121.534881591797','http://www.uTaipei.edu.tw','02-28718288#7314');
insert into Court values ('靜心小學運動中心','臺北市文山區興福里興隆路2段46號','http://az804957.vo.msecnd.net/photogym/20140702172907_運動中心1.JPG','24.9988098269339','121.546772360671','http://www.chjhs.tp.edu.tw','02-29323118#165');
insert into Court values ('中山區華山公園籃球場','臺北市中山區市民大道二段','http://az804957.vo.msecnd.net/photogym/20140825140911_照片 050.jpg','25.0479847287031','121.52468919754','http://pkl.taipei.gov.tw','(02)25850192');
insert into Court values ('臺北教育大學籃球場','臺北市大安區和平東路二段134號','http://az804957.vo.msecnd.net/photogym/20140604164009_籃球場1.jpg','25.0234147575176','121.544709205627','http://www.ntue.edu.tw/','(02)27321104');
insert into Court values ('國防醫學院田徑場','臺北市內湖區民權東路六段161號 ','http://az804957.vo.msecnd.net/photogym/20140708152207_DSCN4424_compressed.jpg','25.0717324682919','121.59875035286','http://www.ndmctsgh.edu.tw/','(02)87923144');
insert into Court values ('內湖區石潭公園籃球場','臺北市內湖區成功路二段(安康路25巷內)','http://az804957.vo.msecnd.net/photogym/20140826114654_DSCN3695.JPG','25.063694121315816','121.59265100955986','http://pkl.taipei.gov.tw','(02)25850192');
insert into Court values ('金華國中活動中心','臺北市大安區福住里新生南路2段32號','http://az804957.vo.msecnd.net/photogym/20140731090627_體育館全景.jpg','25.0314106560562','121.532907485962','http://www.chwjh.tp.edu.tw','(02)33931799');
insert into Court values ('內湖高中活動中心','臺北市內湖區紫陽里文德路218號','http://az804957.vo.msecnd.net/photogym/20140529114640_C:%5CUsers%5Cuser%5CDesktop%5C體育場所%5CIMG_2573.JPG','25.0782333086234','121.586991548538','http://www.nhsh.tp.edu.tw','(02)27977035');
insert into Court values ('中山運動中心','104臺北市中山區中山北路二段44巷2號','http://az804957.vo.msecnd.net/photogym/20140625182321_DSCN9818.JPG','25.054826648079764','121.52141153812408','http://cssc.cyc.org.tw','02-25702330#6430');
insert into Court values ('武功國小活動中心','臺北市文山區萬祥里興隆路1段68號','http://az804957.vo.msecnd.net/photogym/20140826143810_IMGP0001.JPG','25.0038140968739','121.540149450302','http://www.wkps.tp.edu.tw','02-29314360#32');
insert into Court values ('大同運動中心','103臺北市大同區大龍街51號','http://az804957.vo.msecnd.net/photogym/20140625184629_大同外觀.JPG','25.065269574212163','121.51634752750397','http://www.taipeidt.com/','02-25702330#6430');
insert into Court values ('陽明高中台元館','臺北市士林區後港里中正路510號','http://az804957.vo.msecnd.net/photogym/20140722145525_台元館照片 - 複製.jpg','25.0931425783851','121.516716331244','http://www.ymsh.tp.edu.tw','(02)28316675');
insert into Court values ('臺北市南港運動中心','臺北市南港區玉成街69號','http://az804957.vo.msecnd.net/photogym/20140625222852_normal_49cfa61b59a6b.jpg','25.04895059235578','121.58185310661793','https://ngsc.cyc.org.tw/','02-25702330#6427');
insert into Court values ('陽明高中新大樓體育館','臺北市士林區後港里中正路510號','http://az804957.vo.msecnd.net/photogym/20140722145745_新大樓球場-2 - 複製.jpg','25.0921776301157','121.51662312448','http://www.ymsh.tp.edu.tw','(02)28316675');
insert into Court values ('石牌國中學生活動中心籃球場','臺北市北投區吉利里石牌路1段139號','http://az804957.vo.msecnd.net/photogym/20140731093619_IMAG0164.jpg','25.1156979730719','121.514078378677','http://www.spjh.tp.edu.tw','02-28224682#253');
insert into Court values ('臺北醫學大學綜合球場','臺北市信義區吳興街250號','http://az804957.vo.msecnd.net/photogym/20140609114740_圖片2.jpg','25.0260298868326','121.561376452446','http://pe.tmu.edu.tw','(02)27361661');
insert into Court values ('大同高中綜合球場','臺北市中山區聚英里中山北路3段40號','http://az804957.vo.msecnd.net/photogym/20140619104117_相片6538.jpg','25.0675172523512','121.520342958429','http://www.tsh.ttu.edu.tw','02-25925252#3656#603');
insert into Court values ('大同區建成公園籃球場','臺北市大同區承德路二段35號旁','http://az804957.vo.msecnd.net/photogym/20140827140207_20140827140207_IMG_0906.JPG','25.0546943847068','121.5187561512','http://pkl.taipei.gov.tw','(02)25850192');
insert into Court values ('百齡高中活動中心','臺北市士林區義信里承德路4段177號','http://az804957.vo.msecnd.net/photogym/20140529142146_百齡高中活動中心.jpg','25.0864539762441','121.523551940918','http://www.blsh.tp.edu.tw','(02)28831568');
insert into Court values ('政大附中體育館','臺北市文山區政大一街353號','http://az804957.vo.msecnd.net/photogym/20140529142512_D:%5CMy Documents%5C總務處%5C空間配置圖%5C1030616體育館照片%5CDSCN0477.jpg','24.9878765323598','121.584818959236','http://www.ahs.nccu.edu.tw','(02)82377500轉9441');
insert into Court values ('成功中學運動中心','臺北市中正區幸福里濟南路1段71號','http://az804957.vo.msecnd.net/photogym/20140609115648_picmain.jpg','25.0430122885876','121.523015499115','http://www.cksh.tp.edu.tw','(02)23216256#276');
insert into Court values ('健康國小活動中心','臺北市松山區延壽街168號','http://az804957.vo.msecnd.net/photogym/20140722152908_IMAG1612.jpg','25.0565809663607','121.563184261322','http://www.jkes.tp.edu.tw','02-25282814#136');
insert into Court values ('百齡高中籃球場','臺北市士林區義信里承德路4段177號','http://az804957.vo.msecnd.net/photogym/20140529151331_籃球場.jpg','25.086502560109','121.523938179016','http://www.blsh.tp.edu.tw','(02)28831568');
insert into Court values ('臺北市信義運動中心','臺北市信義區松勤街100號','http://az804957.vo.msecnd.net/photogym/20140617171939_DSC_2049.jpg','25.031848106597433','121.56655311584473','https://xysc.cyc.org.tw/IISystem/Portal/xysc/','02-25702330#6428');
insert into Court values ('懷生國中籃球場','臺北市大安區忠孝東路三段248巷30號','http://az804957.vo.msecnd.net/photogym/20140731112005_DSC09904.JPG','25.039911498864452','121.54112577438354','http://www.hsjh.tp.edu.tw','(02)27215078');
insert into Court values ('金華國小運動場','臺北市大安區永康里愛國東路79巷11號','http://az804957.vo.msecnd.net/photogym/20140731112221_DSC08360.JPG','25.032599059723','121.528546214104','http://www.cups.tp.edu.tw/./','(02)23917402-831');
insert into Court values ('祐德中學籃球場','臺北市信義區忠孝東路5段790巷27號','http://az804957.vo.msecnd.net/photogym/20140711140654_IMAG1.jpg','25.0417683612888','121.584057211876','http://www.ytsh.tp.edu.tw','(02)27278280');
insert into Court values ('大安高工田徑場','臺北市大安區龍圖里復興南路2段52號','http://az804957.vo.msecnd.net/photogym/20140731113532_操場.jpg','25.03207447448988','121.54117003083229','http://www.taivs.tp.edu.tw','02-27091630#123');
insert into Court values ('建國中學活動中心','臺北市中正區龍光里南海路56號','http://az804957.vo.msecnd.net/photogym/20140605085653_活動中心.jpg','25.0295393222459','121.512608528137','http://www.ck.tp.edu.tw','(02)23034381');
insert into Court values ('大安高工學生活動中心','臺北市大安區龍圖里復興南路2段52號','http://az804957.vo.msecnd.net/photogym/20140731115219_活動中心1.jpg','25.0319594131788','121.541662216187','http://www.taivs.tp.edu.tw','(02)27091630#123');
insert into Court values ('關渡國小活動中心','臺北市北投區一德里中央北路4段581號','http://az804957.vo.msecnd.net/photogym/20140731121328_DSC028030000.jpg','25.1266092440274','121.466261297464','http://www.kdps.tp.edu.tw','(02)28912847');
insert into Court values ('建國中學籃球場','臺北市中正區龍光里南海路56號','http://az804957.vo.msecnd.net/photogym/20140605091005_室外籃球場.jpg','25.0297288872297','121.513134241104','http://www.ck.tp.edu.tw','(02)23034381');
insert into Court values ('興德國小','臺北市文山區興隆路二段235號','http://az804957.vo.msecnd.net/photogym/20160506083107_DSCN7036.JPG','25.0017964902071','121.551027596011','http://www.hdps.tp.edu.tw','02-29329431#27');
insert into Court values ('光仁小學籃球場','臺北市萬華區壽德里萬大路423巷15號','http://az804957.vo.msecnd.net/photogym/20140717094624_SAM_1968.JPG','25.0214571816811','121.49972319603','http://www.kjes.tp.edu.tw','(02)23032874');
insert into Court values ('強恕中學體育館','臺北市中正區板溪里汀州路二段143號','http://az804957.vo.msecnd.net/photogym/20140708195510_C:%5CDocuments and Settings%5Cto%5C桌面%5CIMG_5403.jpg','25.0259035063999','121.515043973923','http://www.qshs.tp.edu.tw','(02)23656571');
insert into Court values ('南港高中活動中心','臺北市南港區西新里向陽路21號','http://az804957.vo.msecnd.net/photogym/20160506112915_13170797_1322964737720679_1637846276_o.jpg','25.0522874587259','121.594281792641','http://www.nksh.tp.edu.tw','02-27837863#245');
insert into Court values ('西園國小活動中心','臺北市萬華區東園街73巷65號','http://az804957.vo.msecnd.net/photogym/20140731135729_DSC_1496.jpg','25.026672626439726','121.49907238414016','http://www.hups.tp.edu.tw','(02)23030257');
insert into Court values ('金甌女中籃球場','臺北市大安區光明里杭州南路2段1號','http://az804957.vo.msecnd.net/photogym/20140711143004_籃球場全景.jpg','25.0347814152091','121.524538993835','http://www.cogsh.tp.edu.tw','(02)23214765#206');
insert into Court values ('成德國中活動中心','臺北市南港區成福里東新街108巷23號','http://az804957.vo.msecnd.net/photogym/20140731142748_DSC05806.JPG','25.044844536571624','121.58757090568542','http://www.cdjh.tp.edu.tw','(02)26515636');
insert into Court values ('政治大學體育館','臺北市文山區指南路二段64號','http://az804957.vo.msecnd.net/photogym/20140529165724_體育館外觀2.jpg','24.985002883359','121.573655605316','http://sports.nccu.edu.tw/','02-29393091#62964');
insert into Court values ('石牌國小田徑場','臺北市北投區吉利里致遠二路80號','http://az804957.vo.msecnd.net/photogym/20140722164905_DSC09291.JPG','25.114726524022895','121.51266753673553','http://web.spps.tp.edu.tw','(02)28227484');
insert into Court values ('石牌國小活動中心','臺北市北投區吉利里致遠二路80號','http://az804957.vo.msecnd.net/photogym/20140722171537_DSC_0067.JPG','25.116266267186116','121.51223301887512','http://web.spps.tp.edu.tw','(02)28227484');
insert into Court values ('東吳大學城中校區室外籃球場','臺北市中正區貴陽街一段56號','http://az804957.vo.msecnd.net/photogym/20140616160419_城中綠地-1.jpg','25.0379734654765','121.509817689657','http://www.scu.edu.tw/physical/','02-28819471#5606');
insert into Court values ('協和工商籃球場','臺北市信義區忠孝東路5段790巷27號','http://az804957.vo.msecnd.net/photogym/20140711150249_IMAG1.jpg','25.0417905722158','121.583700478077','http://www.hhvs.tp.edu.tw','(02)27265775-239');
insert into Court values ('景文高中籃球場','臺北市文山區木新里保儀路127號','http://az804957.vo.msecnd.net/photogym/20140709094025_IMG_6719.JPG','24.9850017163824','121.568599641323','http://www.jwsh.tp.edu.tw','(02)29390310');
insert into Court values ('實踐大學體育館(臺北校區)','臺北市中山區大直街70號','http://az804957.vo.msecnd.net/photogym/20140617182508_體育館日.JPG','25.0845711907292','121.545625770013','http://www.sportnew.usc.edu.tw/','(02)25381111分機3811');
insert into Court values ('景美國中五育館','臺北市文山區景華里景中街27號','http://az804957.vo.msecnd.net/photogym/20140902155850_照片4.JPG','24.9934218529405','121.54268682003','http://www.cmjh.tp.edu.tw','(02)89353130*501.502');
insert into Court values ('雨聲國小籃球場','臺北市士林區岩山里至誠路1段62巷70號','http://az804957.vo.msecnd.net/photogym/20140723094640_籃球場2.JPG','25.1030005250703','121.535485088825','http://www.yses.tp.edu.tw','(02)28311004');
insert into Court values ('陽明大學山下球場','臺北市北投區立農街二段155號','http://az804957.vo.msecnd.net/photogym/20140620161711_CIMG0744.JPG','25.11978394893','121.513720303774','http://pe.web.ym.edu.tw/front/bin/home.phtml','(02)28267000#2209');
insert into Court values ('臺北科技大學東校區運動園區（籃球比賽場）','臺北市大安區忠孝東路三段1號','http://az804957.vo.msecnd.net/photogym/20140617213757_DSC07780.JPG','25.0431872524421','121.537558436394','http://www.ntut.edu.tw','02-27712171#3332');
insert into Court values ('臺北科技大學東校區運動園區（籃球練習場）','臺北市大安區忠孝東路三段1號','http://az804957.vo.msecnd.net/photogym/20140617214204_DSC07778.JPG','25.0432358534685','121.537874937058','http://www.ntut.edu.tw','02-27712171#3332');
insert into Court values ('陽明大學山頂操場','臺北市北投區立農街二段155號','http://az804957.vo.msecnd.net/photogym/20140620163000_CIMG0734.JPG','25.1251865839461','121.514883041382','http://pe.web.ym.edu.tw/front/bin/home.phtml','(02)28267000#2209');
insert into Court values ('政治大學綜合球類練習區','臺北市文山區指南路二段64號','http://az804957.vo.msecnd.net/photogym/20140530102849_綜合球類練習區1.jpg','24.9845895780627','121.574111580849','http://sports.nccu.edu.tw','(02)29393091分機62964');
insert into Court values ('信義國小田徑場','臺北市信義區松勤街60號','http://az804957.vo.msecnd.net/photogym/20140723153220_IMAG3381.jpg','25.03152244912069','121.56329154968262','http://www.syes.tp.edu.tw','(02)27204005');
insert into Court values ('臺北科技大學14.中正館5F綜合球場','臺北市大安區忠孝東路三段1號','http://az804957.vo.msecnd.net/photogym/20140618005054_mutiplecor2t.jpg','25.0434156770987','121.53582572937','http://www.ntut.edu.tw','02-27712171#3332');
insert into Court values ('東新國小運動場','臺北市南港區東新里興南街62號','http://az804957.vo.msecnd.net/photogym/20140801102605_P_20131015_083122.jpg','25.056036693015784','121.6024249792099','http://www.thes.tp.edu.tw','(02)27837577分機22');
insert into Court values ('靜修女中體育館','臺北市大同區雙連里寧夏路72號','http://az804957.vo.msecnd.net/photogym/20140530105405_CIMG2570.JPG','25.0578264681449','121.515189886486','http://www.bish.tp.edu.tw','02-25574345#304');
insert into Court values ('吳興國小三樓活動中心','臺北市信義區松仁路226號','http://az804957.vo.msecnd.net/photogym/20140724090054_2013-02-20-1031.jpg','25.0251549427069','121.567722558975','http://www.wsps.tp.edu.tw/front/bin/home.phtml','(02)27200226#31');
insert into Court values ('萬興國小運動中心','臺北市文山區萬興里秀明路2段114號','http://az804957.vo.msecnd.net/photogym/20140801152750_mobile7c67db8a-fa50-47a9-b962-81c32157e228.jpg','24.989403283016546','121.57647728919983','http://www.wxes.tp.edu.tw','(02)29381721');
insert into Court values ('興福國中活動中心','臺北市文山區興旺里福興路80號','http://az804957.vo.msecnd.net/photogym/20140904124554_DSC_5978.jpg','25.0049274126343','121.550497412682','http://www.hfjh.tp.edu.tw','02-29322024#340');
insert into Court values ('馬偕醫護管理專科學校體育館','臺北市北投區聖景路92號','http://az804957.vo.msecnd.net/photogym/20140627101620_C:%5CDocuments and Settings%5Cuser%5C桌面%5C運動地圖%5C運動地圖-雙校區場地照片%5C關渡%5C體育館%5CDSC_0006-1-1-1.JPG','25.1228431321469','121.46441636658','http://www.mkc.edu.tw','(02)28584180#3146');
insert into Court values ('活動中心','臺北市松山區介壽里延壽街401號','http://az804957.vo.msecnd.net/photogym/20160510100845_2-1-1.JPG','25.0564157407794','121.555835008621','http://www.csjh.tp.edu.tw','02-27674496#501');
insert into Court values ('建安國小田徑場','臺北市大安區龍雲里大安路2段99號','http://az804957.vo.msecnd.net/photogym/20160510104702_555jpg.jpg','25.0293157324905','121.546481609312','http://www.jnps.tp.edu.tw','02-27077119#123');
insert into Court values ('永吉國中活動中心4樓籃球場','臺北市信義區四育里8鄰松隆路161號','http://az804957.vo.msecnd.net/photogym/20140724100024_DSC02603.JPG','25.047736225035056','121.5730333328247','http://www.yjjh.tp.edu.tw','(02)27649066-188');
insert into Court values ('政治大學六期運動園區','臺北市文山區指南路二段64號','http://az804957.vo.msecnd.net/photogym/20140530120036_六期全區圖.jpg','24.9812101473456','121.577941775322','http://sports.nccu.edu.tw/','(02)29393091分機62964');
insert into Court values ('吳興國小田徑場','臺北市信義區松仁路226號','http://az804957.vo.msecnd.net/photogym/20140724100407_操場 (4).jpg','25.0253906921547','121.567333638668','http://www.wsps.tp.edu.tw/front/bin/home.phtml','(02)27200226#31');
insert into Court values ('胡適國小活動中心','臺北市南港區中研里舊莊街1段1號','http://az804957.vo.msecnd.net/photogym/20160510110301_圖片3.jpg','25.0423707523186','121.617659926414','http://www.hsps.tp.edu.tw','02-27824949#922');
insert into Court values ('北一女中活動中心','臺北市中正區黎明里重慶南路1段165號','http://az804957.vo.msecnd.net/photogym/20140724102633_1.jpg','25.037909066349215','121.51294112205505','http://www.fg.tp.edu.tw','(02)23820484');
insert into Court values ('臺北醫學大學籃球場','臺北市信義區吳興街250號','http://az804957.vo.msecnd.net/photogym/20140609150051_籃球場.jpg','25.0260444691818','121.561403274536','http://pe.tmu.edu.tw','(02)27361661');
insert into Court values ('三民國中活動中心','臺北市內湖區湖興里民權東路6段45號','http://az804957.vo.msecnd.net/photogym/20140804111548_活動中心.JPG','25.0690840088574','121.586042046547','http://www.smjh.tp.edu.tw','(02)27924772');
insert into Court values ('大同高中籃球場','臺北市中山區中央里長春路167號','http://az804957.vo.msecnd.net/photogym/20140605140232_20140326_114045.jpg','25.0558714667007','121.536244153976','http://www.ttsh.tp.edu.tw/releaseRedirect.do?unitID=183&pageID=3042','(02)25054269');
insert into Court values ('南湖高中運動中心','臺北市內湖區康寧路三段220號','http://az804957.vo.msecnd.net/photogym/20140621142951_10458524_10204354110359585_1277845401404937502_n.jpg','25.0669314189394','121.6106915473938','http://www.nhush.tp.edu.tw','(02)26308889');
insert into Court values ('臺灣科技大學體育館','臺北市大安區基隆路四段43號','http://az804957.vo.msecnd.net/photogym/20140609151824_DSC04711.JPG','25.0146356817825','121.543233990669','http://www.ntust.edu.tw','(02)27376503');
insert into Court values ('松山國小活動中心','臺北市松山區八德路四段746號','http://az804957.vo.msecnd.net/photogym/20140724112218_IMAG0655 (2).jpg','25.0508047423248','121.579274296728','http://web.ssps.tp.edu.tw','(02)27672907-627');
insert into Court values ('泰北高中體育館','臺北市士林區福林里福林路240號','http://az804957.vo.msecnd.net/photogym/20140605141636_PA261947.JPG','25.0972051153816','121.535359025002','http://www.tpsh.tp.edu.tw','(02)28825560');
insert into Court values ('東山高中多功能複合式運動場','臺北市文山區老泉里老泉街26巷3號','http://az804957.vo.msecnd.net/photogym/20140717153657_76201.jpg','24.9730261915436','121.561644673347','http://www.tshs.tp.edu.tw','(02)29395826');
insert into Court values ('興華國小運動場','臺北市文山區興光里興隆路3段125巷6號','http://az804957.vo.msecnd.net/photogym/20140724113350_1840.jpg','24.999214877680725','121.55912071466446','http://www.hhps.tp.edu.tw','(02)22393070');
insert into Court values ('南港高工活動中心','臺北市南港區南港里興中路29號','http://az804957.vo.msecnd.net/photogym/20140530163736_IMAG2479.jpg','25.0553563479356','121.608127355576','http://www.nkhs.tp.edu.tw','(02)27825432#1209');
insert into Court values ('龍山國中田徑場','臺北市萬華區富裕里南寧路46號','http://az804957.vo.msecnd.net/photogym/20160511131238_IMG_9690.JPG','25.0356733021595','121.505281806058','http://www.lsjh.tp.edu.tw','02-23362789#303');
insert into Court values ('中正高中籃球場','臺北市北投區文林北路77號','http://az804957.vo.msecnd.net/photogym/20140616181735_CIMG9217.JPG','25.1040012134418','121.51496887207','http://www.ccsh.tp.edu.tw','(02)28234811-330');
insert into Court values ('西湖國中運動場','臺北市內湖區西湖里環山路1段27號','http://az804957.vo.msecnd.net/photogym/20140724115530_操場.jpg','25.0860434418155','121.56619638204575','http://www.xhjhs.tp.edu.tw','(02)27991817#215');
insert into Court values ('龍山國小田徑場','臺北市萬華區青山里和平西路三段235號','http://az804957.vo.msecnd.net/photogym/20140805112004_照片 012.jpg','25.0360329712733','121.496311426163','http://www.lses.tp.edu.tw','02-23082977');
insert into Court values ('松山工農田徑場','臺北市信義區忠孝東路5段236巷15號','http://az804957.vo.msecnd.net/photogym/20140619150012_IMG_20140116_103418.jpg','25.0396296050021','121.573001146317','http://www.saihs.edu.tw','02-27226616#351');
insert into Court values ('興福國中內操場','臺北市文山區興旺里福興路80號','http://az804957.vo.msecnd.net/photogym/20160511155540_內操場全景照片.jpg','25.0050197833577','121.550288200378','http://www.hfjh.tp.edu.tw','02-29322024#340');
insert into Court values ('南港高工籃球場','臺北市南港區南港里興中路29號','http://az804957.vo.msecnd.net/photogym/20140603094426_IMAG2487.jpg','25.0559735182746','121.608508229256','http://www.nkhs.tp.edu.tw','(02)27825432#1209');
insert into Court values ('建成國中體育館','臺北市大同區長安西路37之1號','http://az804957.vo.msecnd.net/photogym/20140724130523_照片 273_S.JPG','25.05188652928269','121.51886478066444','http://www.jcjh.tp.edu.tw','(02)25587042*651');
insert into Court values ('民族國中體育館','臺北市大安區羅斯福路4段113巷13號','http://az804957.vo.msecnd.net/photogym/20140806113300_-1.jpg','25.0111762570062','121.538864672184','http://www.mtjh.tp.edu.tw','(02)27322935');
insert into Court values ('滬江高中體育館','臺北市文山區景美里羅斯福路6段336號','http://az804957.vo.msecnd.net/photogym/20140630093525_.JPG','24.9890642876553','121.539237499237','http://www.hchs.tp.edu.tw','(02)86631122');
insert into Court values ('三玉國小室內綜合球場','臺北市士林區三玉里天母東路116號','http://az804957.vo.msecnd.net/photogym/20140724143135_DSC05749.JPG','25.1177768480957','121.537284851074','http://www.syups.tp.edu.tw','(02)28751369');
insert into Court values ('民族國中田徑場','臺北市大安區羅斯福路4段113巷13號','http://az804957.vo.msecnd.net/photogym/20140808100914_2.JPG','25.0104598102895','121.538652777672','http://www.mtjh.tp.edu.tw','(02)27322935');
insert into Court values ('武揚館','臺北市北投區一德里中央北路4段48號','http://az804957.vo.msecnd.net/photogym/20160512133346_DSC_0530.JPG','25.1347610977931','121.477416604757','http://www.ttcjh.ntpc.edu.tw','02-28929633#243');
insert into Court values ('松山家商活動中心','臺北市信義區松山路655號','http://az804957.vo.msecnd.net/photogym/20140619152957_全景照片.jpg','25.0357219061041','121.58047914505','http://www.ssvs.tp.edu.tw','(02)27261118#330');
insert into Court values ('臺灣師範大學體育館','臺北市文山區汀州路四段88號','http://az804957.vo.msecnd.net/photogym/20140619154317_體育館.JPG','25.0087060477633','121.535306721926','http://www.ntnu.edu.tw','(02)77343176');
insert into Court values ('大誠高中籃球場','臺北市文山區萬興里秀明路2段175號','http://az804957.vo.msecnd.net/photogym/20140619154428_C:%5CDocuments and Settings%5CPEHT%5C桌面%5C體育組%5C102學年度%5C公文附件%5C建構全國運動場館資訊網計畫相關資料%5CDSC09658.JPG','24.9906723192909','121.578397750854','http://www.tcsh.tp.edu.tw','(02)22348989 #32');
insert into Court values ('大直國小活動中心','臺北市中山區大直里大直街2號','http://az804957.vo.msecnd.net/photogym/20140724155653_DSCF9523.JPG','25.0804634379172','121.546179056168','http://www.tzes.tp.edu.tw','(02)25333953');
insert into Court values ('胡適國小戶外籃球場','臺北市南港區中研里舊莊街1段1號','http://az804957.vo.msecnd.net/photogym/20160512165930_1-1-1.jpg','25.042307570541','121.617491841262','http://www.hsps.tp.edu.tw','02-27824949#930');
insert into Court values ('民族國小操場','臺北市松山區民生東路4段97巷7號','http://az804957.vo.msecnd.net/photogym/20140812103641_2014_01_10_EOS 5D Mark III_8581_1 (複製).JPG','25.05955012927832','121.55130207538605','http://enable.mces.tp.edu.tw/front/bin/home.phtml','(02)27124872');
insert into Court values ('南門國小籃球場、綜合球場','臺北市中正區南門里廣州街6號','http://az804957.vo.msecnd.net/photogym/20140812103655_IMG_0999.JPG','25.0350025648793','121.508703231812','http://www.nmes.tp.edu.tw','(02)23715052');
insert into Court values ('臺北藝術大學籃球場','臺北市北投區學園路1號','http://az804957.vo.msecnd.net/photogym/20140609190108_泳池全景.jpg','25.1372038768211','121.473437547684','http://www.tnua.edu.tw','02-28961000#5663');
insert into Court values ('溪山國小運動場','臺北市士林區溪山里至善路3段199號','http://az804957.vo.msecnd.net/photogym/20140812120347_IMG_0515.JPG','25.1198751159997','121.579958796501','http://www.hops.tp.edu.tw','(02)28411010');
insert into Court values ('松山工農學生活動中心','臺北市信義區忠孝東路5段236巷15號','http://az804957.vo.msecnd.net/photogym/20140611140822_DSC_0847.jpg','25.0391217083908','121.572199165821','http://www.saihs.edu.tw','(02)27226616');
insert into Court values ('三興國民小學活動中心','臺北市信義區景聯里基隆路2段99號','http://az804957.vo.msecnd.net/photogym/20140724170647_DSCN2337-1.jpg','25.0294158618467','121.55833160874','http://www.shps.tp.edu.tw','(02)27385488分機51');
insert into Court values ('大同高中活動中心','臺北市中山區中央里長春路167號','http://az804957.vo.msecnd.net/photogym/20140605163553_20140326_114934.jpg','25.0568531021267','121.535723805428','http://www.ttsh.tp.edu.tw/releaseRedirect.do?unitID=183&pageID=3042','(02)25054269');
insert into Court values ('芳和國中籃球場','臺北市大安區芳和里臥龍街170號','http://az804957.vo.msecnd.net/photogym/20140813104930_QA1A8036.jpg','25.0182475259394','121.550068259239','http://www.fhjhs.tp.edu.tw','(02)27321961');
insert into Court values ('育成高中活動中心','臺北市南港區重陽路366號','http://az804957.vo.msecnd.net/photogym/20140611143603_C:%5CDocuments and Settings%5Cuser%5C桌面%5C6F籃球場.jpg','25.0582623669619','121.609618663788','http://www.yucsh.tp.edu.tw','(02)26530475');
insert into Court values ('中國科技大學體育館','臺北市文山區興隆路三段56號','http://az804957.vo.msecnd.net/photogym/20140603141742_3.JPG','24.998796758308','121.555588245392','http://www.cute.edu.tw/','(02)29313416轉2149');
insert into Court values ('臺北護理健康大學體育館','臺北市北投區明德路365號','http://az804957.vo.msecnd.net/photogym/20140714122228_S__4046900.jpg','25.118417989333','121.518627405167','http://www.ntunhs.edu.tw/bin/home.php','02-28227101#2901');
insert into Court values ('興雅國中活動中心','臺北市信義區松德路168巷15號','http://az804957.vo.msecnd.net/photogym/20140725090723_mobilea75831e5-1707-474b-ae7f-708c4214a6c6.jpg','25.0363075828374','121.571788787842','http://www.syajh.tp.edu.tw','02-27232771#330');
insert into Court values ('內湖國小活動中心','臺北市內湖區港富里內湖路二段41號','http://az804957.vo.msecnd.net/photogym/20140725091359_123-2.jpg','25.07996461809317','121.57991409296301','http://www.nhes.tp.edu.tw','(02)27998085');
insert into Court values ('中國科技大學環形/直線慢跑道(非田徑場型)','臺北市文山區興隆路三段56號','http://az804957.vo.msecnd.net/photogym/20140603144005_IMG_0034.JPG','24.9972992958595','121.554826498032','http://www.cute.edu.tw/','(02)29313416轉2149');
insert into Court values ('臺灣戲曲學院籃球場','臺北市內湖區內湖路二段177號','http://az804957.vo.msecnd.net/photogym/20140603145513_securedownload.jpg','25.0821613213862','121.586263489226','http://www.tcpa.edu.tw/bin/home.php','(02)27962666');
insert into Court values ('松山工農籃球場','臺北市信義區忠孝東路5段236巷15號','http://az804957.vo.msecnd.net/photogym/20140619164022_IMG_5393.JPG','25.0401545102948','121.573601961136','http://www.saihs.edu.tw','(02)27226616');
insert into Court values ('碧湖國小操場','臺北市內湖區內湖里金龍路100號','http://az804957.vo.msecnd.net/photogym/20140725103333_IMG_2871.jpg','25.08421909761','121.591433286667','http://www.bhps.tp.edu.tw','(02)27907161');
insert into Court values ('舊莊國小後山操場','臺北市南港區舊莊里舊莊街1段100號','http://az804957.vo.msecnd.net/photogym/20140725103703_調整大小IMG_3368.JPG','25.0389977715778','121.619247794151','http://www.zzes.tp.edu.tw','(02)27821418#121');
insert into Court values ('社子國小後操場','臺北市士林區永倫里延平北路六段308號','http://az804957.vo.msecnd.net/photogym/20140725104638_DSC02529-1.jpg','25.091258827113656','121.50250732898712','http://www.stps.tp.edu.tw','(02)28126195#821');
insert into Court values ('南門國中體育館','臺北市中正區南門里廣州街6號','http://az804957.vo.msecnd.net/photogym/20140725105049_室內籃球場.JPG','25.035255306871402','121.51033401489258','http://www.nmjh.tp.edu.tw','(02)23142775#67');
insert into Court values ('舊莊國小前庭操場','臺北市南港區舊莊里舊莊街1段100號','http://az804957.vo.msecnd.net/photogym/20140725105441_調整大小IMG_3366.JPG','25.0399358000292','121.619338989258','http://www.zzes.tp.edu.tw','(02)27821418#121');
insert into Court values ('東吳大學體育館','臺北市士林區臨溪路70號','http://az804957.vo.msecnd.net/photogym/20140616095059_雙溪體育館-2.jpg','25.0941567071309','121.546365469694','http://www.scu.edu.tw/physical/','(02)28819471#5606');
insert into Court values ('師大附中體育館','臺北市大安區和安里信義路3段143號','http://az804957.vo.msecnd.net/photogym/20140619170845_未命名.jpg','25.0340833579222','121.539847754175','http://www.hs.ntnu.edu.tw','(02)27075215');
insert into Court values ('螢橋國小活動中心','臺北市中正區螢雪里詔安街29號','http://az804957.vo.msecnd.net/photogym/20140725112531_未命名.gif','25.025461173860453','121.51517271995544','http://www.yces.tp.edu.tw','(02)23054620');
insert into Court values ('內湖運動中心','臺北市內湖區洲子街12號','http://az804957.vo.msecnd.net/photogym/20140718171821_1406884770741.jpg','25.078291613174382','121.57520055770874','http://www.nhsports.com.tw/nh/','02-25702330#6426');
insert into Court values ('古亭國中體育館','臺北市中正區中華路2段465號','http://az804957.vo.msecnd.net/photogym/20140725113741_DSCF6802.JPG','25.02390449090013','121.51001751422882','http://www.ktjh.tp.edu.tw','(02)23090986-315.316');
insert into Court values ('大直高中活動中心','臺北市中山區劍潭里北安路420號','http://az804957.vo.msecnd.net/photogym/20140603155148_20140605_142240.jpg','25.0792633516027','121.54296040535','http://www.dcsh.tp.edu.tw','(02)25334017');
insert into Court values ('薇閣小學田徑場','臺北市北投區長安里育仁路106號','http://az804957.vo.msecnd.net/photogym/20140714151244_操場照片.jpg','25.1361257577076','121.500881910324','http://www.wgps.tp.edu.tw','(02)28912668');
insert into Court values ('長安國小體育館','臺北市中山區興亞里吉林路15號','http://az804957.vo.msecnd.net/photogym/20140814175027_IMG_0030.JPG','25.0502536394591','121.531040668488','http://www.caps.tp.edu.tw','(02)25617600分機123');
insert into Court values ('大安森林公園籃球場','臺北市大安新生南路2段1號','http://az804957.vo.msecnd.net/photogym/20140814184741_大安森林公園-場館1.jpg','25.0300205250944','121.536045670509','http://pkl.taipei.gov.tw','(02)27003830');
insert into Court values ('古亭國中田徑場','臺北市中正區中華路2段465號','http://az804957.vo.msecnd.net/photogym/20140725122024_102-11-07-100公尺競賽.JPG','25.02404181033154','121.5103930234909','http://www.ktjh.tp.edu.tw','(02)23090986-315.316');
insert into Court values ('明德國小活動中心','臺北市北投區榮華里明德路190號','http://az804957.vo.msecnd.net/photogym/20140725131500_IMAG2309_BURST001.jpg','25.1122832955383','121.522269845009','http://www.mdes.tp.edu.tw','(02)28229651');
insert into Court values ('蓬萊國小綜合體育館','臺北市大同區星明里寧夏路35號','http://az804957.vo.msecnd.net/photogym/20140725141744_DSC00499.JPG','25.056206778695742','121.51563942432404','http://enable.plps.tp.edu.tw/modules/tadnews/','(02)25569835');
insert into Court values ('明德國小籃球場','臺北市北投區榮華里明德路190號','http://az804957.vo.msecnd.net/photogym/20140725144348_籃球場.jpg','25.1116032630183','121.522530019283','http://www.mdes.tp.edu.tw','(02)28229651');
insert into Court values ('士東國小籃球場','臺北市士林區蘭雅里中山北路6段392號','http://az804957.vo.msecnd.net/photogym/20140725145253_DSCN1196.JPG','25.1128127468097','121.527510881424','http://www.stes.tp.edu.tw','(02)28710064');
insert into Court values ('銘傳大學室外籃球場','臺北市士林區中山北路五段250號','http://az804957.vo.msecnd.net/photogym/20140610103319_室外籃球場地設~1.JPG','25.0870078311609','121.527628898621','http://www.mcu.edu.tw','(02)28824564分機2326');
insert into Court values ('東吳大學籃球場','臺北市士林區臨溪路70號','http://az804957.vo.msecnd.net/photogym/20140616101648_雙溪籃球場-1.jpg','25.095502388345','121.544685065746','http://www.scu.edu.tw/physical/','(02)28819471#5606');
insert into Court values ('復興高中田徑場','臺北市北投區復興四路70號','http://az804957.vo.msecnd.net/photogym/20140618133957_DSC000651.jpg','25.1427400142077','121.50200843811','http://www.fhsh.tp.edu.tw','(02)28914131#330');
insert into Court values ('台北海洋技術學院體育館','臺北市士林區延平北路九段212號','http://az804957.vo.msecnd.net/photogym/20140613090511_台北海院士林體育館.JPG','25.1089729587673','121.47069901228','http://www.tcmt.edu.tw','(02)28102292-2246');
insert into Court values ('復興國小活動中心','臺北市大安區仁愛里敦化南路1段262號','http://az804957.vo.msecnd.net/photogym/20140714173535_DSC_8212.JPG','25.0392347094934','121.548419237006','http://www.fhjh.tp.edu.tw','(02)27715859');
insert into Court values ('中山區花博公園新生園區游泳池(館)','臺北市中山區新生北路三段105號','http://az804957.vo.msecnd.net/photogym/20140815143040_IMG_2674.JPG','25.0686359201364','121.531475186348','http://pkl.taipei.gov.tw','(02)25850192');
insert into Court values ('萬福國小籃球場','臺北市文山區羅斯福5段170巷32號','http://az804957.vo.msecnd.net/photogym/20140725175758_IMG_5804.JPG','25.005159797735978','121.53691685196463','http://www.wfps.tp.edu.tw','(02)29353123');
insert into Court values ('達人女中籃球場','臺北市內湖區內湖路二段314號','http://az804957.vo.msecnd.net/photogym/20140610105853_操場.JPG','25.0812481033775','121.587710380554','http://www.trgsh.tp.edu.tw','(02)27956899#401');
insert into Court values ('龍門國中體育館','臺北市大安區建國南路二段269號','http://az804957.vo.msecnd.net/photogym/20140721100133_全景01.JPG','25.0236222362049','121.538370609251','http://www.lmjh.tp.edu.tw','02-27330299');
insert into Court values ('中正國小活動中心','臺北市中山區力行里龍江路62號','','25.0502026113016','121.539253592491','http://web.jjes.tp.edu.tw','(02)25070932');
insert into Court values ('復興實驗高中大禮堂(體育館)','臺北市大安區敦化南路1段262 號','http://az804957.vo.msecnd.net/photogym/20140708100641_DSC_8213.JPG','25.0393525707476','121.5479578964','http://www.fhjh.tp.edu.tw','(02)27715859#171');
insert into Court values ('桃源國中籃球場','臺北市北投區一德里中央北路4段48號','http://az804957.vo.msecnd.net/photogym/20140728091544_12.JPG','25.134595977765603','121.47705852985382','http://www.ttcjh.ntpc.edu.tw','(02)2892-9633');
insert into Court values ('臺北市立大學附設實驗國民小學活動中心','臺北市中正區黎明里公園路29號','http://az804957.vo.msecnd.net/photogym/20140721101715_IMG_0841_resized.jpg','25.0361909337525','121.515365839005','http://new.estmue.tp.edu.tw/index.php','(02)23110395');
insert into Court values ('開南商工田徑場','臺北市中正區東門里濟南路1段6號','http://az804957.vo.msecnd.net/photogym/20140618142306_11.jpg','25.0417292126936','121.521674394608','http://www.knvs.tp.edu.tw','(02)23212666');
insert into Court values ('芝山國小芝星廣場','臺北市士林區芝山里德行東路285號','http://az804957.vo.msecnd.net/photogym/20140728102230_mobile5262e80c-1e1c-40bf-806d-7305ed5b8966.jpg','25.1100572','121.5358076','http://www.zsps.tp.edu.tw','(02)28316115');
insert into Court values ('華興中學體育館','臺北市士林區芝山里仰德大道1段101號','http://az804957.vo.msecnd.net/photogym/20140715091103_IMG_20140715_090236.jpg','25.1060633826945','121.537917852402','http://www.hhhs.tp.edu.tw','02-28316834#235');
insert into Court values ('德明財經科技大學體育館','臺北市內湖區環山路一段56號','http://az804957.vo.msecnd.net/photogym/20140618143234_mobile6f5d00c2-bd45-46c4-be33-c5d988f76526.jpg','25.0867508233132','121.565238833427','http://www.takming.edu.tw','(02)26585801ex5268');
insert into Court values ('士林國小籃球場','臺北市士林區福德里大東路165號','http://az804957.vo.msecnd.net/photogym/20140728114555_DSC04422.jpg','25.0946935239746','121.524522900581','http://www.slps.tp.edu.tw','(02)28812231*222');
insert into Court values ('臺北市立大學附設實驗國民小學田徑場','臺北市中正區黎明里公園路29號','http://az804957.vo.msecnd.net/photogym/20140721111507_IMG_0862_resized.jpg','25.035901740751232','121.5157949924469','http://new.estmue.tp.edu.tw/index.php','(02)23110395');
insert into Court values ('木柵國中籃球場','臺北市文山區木柵路3段102巷12號','http://az804957.vo.msecnd.net/photogym/20140721111728_IMAG4551.jpg','24.9875361713485','121.567239761353','http://www.mcjhs.tp.edu.tw','02-29393031');
insert into Court values ('長安國中籃球場','臺北市中山區興亞里松江路70巷11號','http://az804957.vo.msecnd.net/photogym/20140728124342_7006.jpg','25.0494469061023','121.531652212143','http://www.cajh.tp.edu.tw','(02)25112382');
insert into Court values ('中山區榮星花園公園籃球場','臺北市中山區民權東路三段1號','http://az804957.vo.msecnd.net/photogym/20140818162614_IMG_2695.JPG','25.0633459528306','121.539586186409','http://pkl.taipei.gov.tw','(02)25850192');
insert into Court values ('文林國小活動中心','臺北市北投區建民里文林北路155號','http://az804957.vo.msecnd.net/photogym/20140728130509_IMG_2478.jpg','25.1060025656195','121.514164209366','http://www.wles.tp.edu.tw','(02)28234212');
insert into Court values ('臺北市士林運動中心','臺北市士林區士商路1號','http://az804957.vo.msecnd.net/photogym/20140624094002_士林運動中心全景外觀.jpg','25.0896799029981','121.521416902542','http://www.slsc-taipei.org/big5/','02-25702330#6428');
insert into Court values ('文林國小田徑場','臺北市北投區建民里文林北路155號','http://az804957.vo.msecnd.net/photogym/20140728132519_IMG_0562.jpg','25.1056746764262','121.513949632645','http://www.wles.tp.edu.tw','02-28234212#303');
insert into Court values ('桃源國小田徑場　','臺北市北投區中央北路3段40巷45號','http://az804957.vo.msecnd.net/photogym/20140728132629_DSC02706_調整大小.JPG','25.13965146325538','121.48336172103882','http://www.tyues.tp.edu.tw','(02)28941208');
insert into Court values ('修德國小操場','臺北市南港區東新街118巷86號','http://az804957.vo.msecnd.net/photogym/20140721115752_IMG_3700.JPG','25.0446695750817','121.588971018791','http://www.sdps.tp.edu.tw','(02)27880500');
insert into Court values ('誠正國中活動中心','臺北市南港區新富里富康街1巷24號','http://az804957.vo.msecnd.net/photogym/20140721115932_P1020405.JPG','25.0541530998638','121.619589507563','http://163.21.132.5','02-27828094#1510');
insert into Court values ('景美國小活動中心','臺北市文山區景行里景文街108號','http://az804957.vo.msecnd.net/photogym/20140728152035_DSC05794_1.jpg','24.9890491902515','121.539997458731','http://www.cmes.tp.edu.tw','(02)29322151*123');
insert into Court values ('景美國小籃球場','臺北市文山區景行里景文街108號','http://az804957.vo.msecnd.net/photogym/20140728152613_DSC05793_1.jpg','24.9893179102734','121.540456227979','http://www.cmes.tp.edu.tw','(02)29322151*123');
insert into Court values ('臺北市北投運動中心','臺北市北投區石牌路一段39巷100號','http://az804957.vo.msecnd.net/photogym/20140618145326_P1050700.JPG','25.1168977019917','121.509695649147','http://www.tms.taipei.gov.tw','02-25702330#6428');
insert into Court values ('萬芳高中學生活動中心','臺北市文山區興隆路3段115巷1號','http://az804957.vo.msecnd.net/photogym/20140728152804_P_20140728_150636_HDR11.jpg','25.0008581702678','121.55842602253','http://www.wfsh.tp.edu.tw','(02)22309585轉350');
insert into Court values ('博嘉國小運動場','臺北市文山區木柵路4段159巷14號之1','http://az804957.vo.msecnd.net/photogym/20140728154057_P1100164.JPG','25.0020152684298','121.575479507446','http://www.bjps.tp.edu.tw','(02)22302585');
insert into Court values ('萬芳高中田徑場','臺北市文山區興隆路3段115巷1號','http://az804957.vo.msecnd.net/photogym/20140728154117_田徑場全場01.JPG','25.00203471536461','121.55931651592255','http://www.wfsh.tp.edu.tw','(02)22309585轉350');
insert into Court values ('西松高中活動中心','臺北市松山區鵬程里健康路325巷7號西南側','http://az804957.vo.msecnd.net/photogym/20140728154331_球場.jpg','25.055005401749','121.566140055656','http://www.hssh.tp.edu.tw','(02)25286618');
insert into Court values ('信義國中田徑場','臺北市信義區松仁路158巷1號','http://az804957.vo.msecnd.net/photogym/20140728155005_SANY0272.JPG','25.02961223188975','121.56788885593414','http://www.syijh.tp.edu.tw','(02)27236771');
insert into Court values ('北安國中綜合大樓','臺北市中山區劍潭里明水路325號','http://az804957.vo.msecnd.net/photogym/20140728161220_P1070485.JPG','25.0785637007118','121.54227912426','http://www.pajh.tp.edu.tw','(02)25333888');
insert into Court values ('臺北商業大學活動中心','臺北市中正區濟南路一段321號','http://az804957.vo.msecnd.net/photogym/20140604110420_P7168495.JPG','25.0423027103963','121.526073217392','http://www.ntcb.edu.tw','(02)23226185');
insert into Court values ('瑠公國中活動中心','臺北市信義區福德街221巷15號','http://az804957.vo.msecnd.net/photogym/20140728170759_DSC06556.JPG','25.037423034109395','121.58550560474396','http://www.lkjh.tp.edu.tw','(02)27261481');
insert into Court values ('桃源國小籃球場　','臺北市北投區中央北路3段40巷45號','http://az804957.vo.msecnd.net/photogym/20140728171430_DSC02714_調整大小.JPG','25.13928481404687','121.48363932967186','http://www.tyues.tp.edu.tw','(02)28941208');
insert into Court values ('臺北商業大學籃球場','臺北市中正區濟南路一段321號','http://az804957.vo.msecnd.net/photogym/20140604111122_P7168485.JPG','25.0421277452798','121.525236368179','http://www.ntcb.edu.tw','(02)23226185');
insert into Court values ('大安國中活動中心','臺北市大安區大安路2段63號','http://az804957.vo.msecnd.net/photogym/20140729085418_IMGP5227 (3).JPG','25.0297624286306','121.546485803394','http://www.tajh.tp.edu.tw','02-27557131#132');
insert into Court values ('臺北市萬華區青年公園籃球場','臺北市萬華區水源路199號','http://az804957.vo.msecnd.net/photogym/20141002110953_IMG_20140924_111744.jpg','25.0224522981293','121.507383584976','http://www.tms.taipei.gov.tw','02-25702330#6520');
insert into Court values ('內湖國中戶外籃球場','臺北市內湖區紫陽里陽光街1號','http://az804957.vo.msecnd.net/photogym/20140729100624_籃球場1-1.jpg','25.0759812740953','121.589526236057','http://www.nhjh.tp.edu.tw','(02)27900843');
insert into Court values ('西湖國小活動中心','臺北市內湖區西湖里環山路1段25號','http://az804957.vo.msecnd.net/photogym/20140729102402_IMG_7530.JPG','25.0832765496042','121.566547751427','http://www.hhups.tp.edu.tw','(02)27971267#142');
insert into Court values ('明德國中田徑場','臺北市北投區建民里明德路50號','http://az804957.vo.msecnd.net/photogym/20140729102602_DSC01735.JPG','25.1079941699779','121.518697142601','http://www.mdjh.tp.edu.tw','02-28232539#605');
insert into Court values ('臺灣師範大學體育館','臺北市大安區和平東路一段162號','http://az804957.vo.msecnd.net/photogym/20140618152733_IMG_4028.jpg','25.0261453303833','121.527375429869','http://www.ntnu.edu.tw','02-77343176');
insert into Court values ('中山女中籃球場','臺北市中山區力行里長安東路2段141號','http://az804957.vo.msecnd.net/photogym/20140604113216_DSC09774.JPG','25.048602503303','121.538424789906','http://www.csghs.tp.edu.tw','(02)25073148');
insert into Court values ('至善國中籃球場','臺北市士林區臨溪里至善路2段360號','http://az804957.vo.msecnd.net/photogym/20140729105830_P1310665.JPG','25.1038166210572','121.556903868914','http://www.jsjh.tp.edu.tw','(02)28411350#32');
insert into Court values ('衛理女中室內球場','臺北市士林區翠山里至善路2段321號','http://az804957.vo.msecnd.net/photogym/20140704105111_室內球場1.JPG','25.1028110734373','121.552922129631','http://www.wlgsh.tp.edu.tw','(02)28411487');
insert into Court values ('萬華國中活動中心','臺北市萬華區日善里西藏路201號','http://az804957.vo.msecnd.net/photogym/20140729110257_IMG_20140729_112617.jpg','25.028761616683173','121.49847865104675','http://www.whjhs.tp.edu.tw','(02)23394567-133');
insert into Court values ('衛理女中室外球場','臺北市士林區翠山里至善路2段321號','http://az804957.vo.msecnd.net/photogym/20140704110006_室外球場1.JPG','25.1019415352547','121.551039218903','http://www.wlgsh.tp.edu.tw','(02)28411487');
insert into Court values ('東方工商籃球場','臺北市大安區信義路四段186巷8號','http://az804957.vo.msecnd.net/photogym/20140821093729_P1010186.JPG','25.032191406992563','121.55123593202006','http://www.tfvs.tp.edu.tw','(02)27554616#199');
insert into Court values ('臺北市中正運動中心','臺北市中正區信義路1段1號','http://az804957.vo.msecnd.net/photogym/20140620111105_1.jpg','25.0382031149193','121.519306004047','http://www.tpejjsports.com.tw/','02-25702330#6427');
insert into Court values ('惇敘工商籃球場','臺北市北投區泉源路221號','http://az804957.vo.msecnd.net/photogym/20140708114152_7.JPG','25.1453119988725','121.526157545886','http://www.thvs.tp.edu.tw','(02)28912630');
insert into Court values ('明德國中體育館','臺北市北投區建民里明德路50號','http://az804957.vo.msecnd.net/photogym/20140729115629_2.JPG','25.1080257439321','121.518745422363','http://www.mdjh.tp.edu.tw','02-28232539#605');
insert into Court values ('永安國小籃球場','臺北市中山區明水路397巷19弄1號','http://az804957.vo.msecnd.net/photogym/20140729120243_DSCN1249.JPG','25.07930222097945','121.54984831809998','http://web.yaes.tp.edu.tw/front/bin/home.phtml','(02)25335672');
insert into Court values ('師大附中籃球場','臺北市大安區和安里信義路3段143號','http://az804957.vo.msecnd.net/photogym/20140620111649_IMG_1502.JPG','25.0337291261519','121.539714932442','http://www.hs.ntnu.edu.tw','(02)27075215');
insert into Court values ('信義國中活動中心','臺北市信義區松仁路158巷1號','http://az804957.vo.msecnd.net/photogym/20140721185213_DSC08877-1.JPG','25.0288296661167','121.567915678024','http://www.syijh.tp.edu.tw','(02)27236771');
insert into Court values ('新民國中活動中心','臺北市北投區林泉里新民路10號','http://az804957.vo.msecnd.net/photogym/20140729121822_室內運動場 - 複製.jpg','25.1383402623387','121.506428718567','http://www.hmjh.tp.edu.tw','(02)28979001');
insert into Court values ('世新大學體育館','臺北市文山區木柵路一段17巷1號','http://az804957.vo.msecnd.net/photogym/20140604122953_室外球場s.jpg','24.9898603320731','121.545411944389','http://www.shu.edu.tw','02-22368225#3065');
insert into Court values ('臺北市萬華運動中心','臺北市萬華區西寧南路6之1號','http://az804957.vo.msecnd.net/photogym/20140618160453_IMAG6907.jpg','25.0475175282915','121.506750583649','https://whsc.cyc.org.tw/IISystem/Portal/whsc/','02-25702330#6428');
insert into Court values ('松山區民權公園籃球場','臺北市松山區富錦街359巷2弄','http://az804957.vo.msecnd.net/photogym/20140821134809_IMG_20140819_095910.jpg','25.061789264609878','121.55937820672955','http://pkl.taipei.gov.tw','(02)25850192');
insert into Court values ('興雅國中籃球場','臺北市信義區松德路168巷15號','http://az804957.vo.msecnd.net/photogym/20140729123955_mobiled90bfa96-96b8-43ab-9d4b-abde1d64b407.jpg','25.0349855533804','121.572456657887','http://www.syajh.tp.edu.tw','02-27232771#330');
insert into Court values ('新民國中室外綜合運動場','臺北市北投區林泉里新民路10號','http://az804957.vo.msecnd.net/photogym/20140729124520_室外運動場1 - 複製.jpg','25.138175147151','121.506434082985','http://www.hmjh.tp.edu.tw','(02)28979001');
insert into Court values ('臺灣警察專科學校籃球場','臺北市文山區興隆路三段 153 號','http://az804957.vo.msecnd.net/photogym/20140710163942_IMAG0962.jpg','24.9989144150612','121.560916900935','http://www.tpa.edu.tw/','(02)22308512-4');
insert into Court values ('麗湖國小活動中心','臺北市內湖區金湖路363巷8號','http://az804957.vo.msecnd.net/photogym/20140729124756_活動中心1.JPG','25.072859453307792','121.6016149520874','http://enable.lhes.tp.edu.tw/index.phtml','(02)26343888#130');
insert into Court values ('城市大學大成館','臺北市北投區學園路2號','http://az804957.vo.msecnd.net/photogym/20141022102431_大成館.jpg','25.1355002011539','121.469392776489','http://www.tpcu.edu.tw','(02)289-27154#2501');
insert into Court values ('麗湖國小操場','臺北市內湖區金湖路363巷8號','http://az804957.vo.msecnd.net/photogym/20140729130054_操場1.JPG','25.072451302761976','121.6010570526123','http://enable.lhes.tp.edu.tw/index.phtml','(02)26343888#130');
insert into Court values ('延平中學環形/直線慢跑道(非田徑場型)','臺北市大安區和安里建國南路1段275號','http://az804957.vo.msecnd.net/photogym/20140612093520_操場全景.jpg','25.0364233083288','121.538622334583','http://www.yphs.tp.edu.tw','(02)27071478');
insert into Court values ('臺灣警察專科學校體育館','臺北市文山區興隆路三段 153 號','http://az804957.vo.msecnd.net/photogym/20140710165107_IMAG0969.jpg','25.000522058695','121.560494899531','http://www.tpa.edu.tw/','(02)22308512-4');
insert into Court values ('麗山國小活動中心','臺北市內湖區港都里港華街100號','http://az804957.vo.msecnd.net/photogym/20140729135249_DSC_0465.JPG','25.0824505995088','121.572604179382','http://www.lnps.tp.edu.tw','(02)26574158轉325');
insert into Court values ('籃球場','臺北市北投區學園路2號','http://az804957.vo.msecnd.net/photogym/20141022123521_籃球場.jpg','25.1341045743984','121.469304263592','http://www.tpcu.edu.tw','(02)289-27154#2501');
insert into Court values ('康寧醫護暨管理專科學校野聲館','臺北市內湖區康寧路三段75巷137號','http://az804957.vo.msecnd.net/photogym/20140708122549_4.jpg','25.0764452889126','121.610466241837','http://www.knjc.edu.tw','(02)26321181-450');
insert into Court values ('北投區回饋設施洲美運動公園','臺北市北投區洲美街271號','http://az804957.vo.msecnd.net/photogym/20140729135729_mobile432bbacf-75bc-4279-ad69-7234b2091852.jpg','25.1096457197189','121.49972319603','http://www.ptrip.gov.tw/','02-28360050#131');
insert into Court values ('景美女中籃球場','臺北市文山區樟新里木新路3段312號','http://az804957.vo.msecnd.net/photogym/20140822094515_照片 2-1.jpg','24.9828099182112','121.555498838316','http://www.cmgsh.tp.edu.tw','(02)29368847');
insert into Court values ('舊莊國小學生活動中心','臺北市南港區舊莊里舊莊街1段100號','http://az804957.vo.msecnd.net/photogym/20140729142227_調整大小IMG_3398.JPG','25.0399260795639','121.619945168495','http://www.zzes.tp.edu.tw','(02)27821418#121');
insert into Court values ('信義國小活動中心','臺北市信義區松勤街60號','http://az804957.vo.msecnd.net/photogym/20140722093250_IMG_1294.JPG','25.03123081482577','121.56308770179749','http://www.syes.tp.edu.tw','(02)27204005');
insert into Court values ('木柵國中田徑場','臺北市文山區木柵路3段102巷12號','http://az804957.vo.msecnd.net/photogym/20140722094540_IMAG4551.jpg','24.9874486497933','121.567304134369','http://www.mcjhs.tp.edu.tw','02-29393031');
insert into Court values ('台北海洋技術學院田徑場','臺北市士林區延平北路九段212號','http://az804957.vo.msecnd.net/photogym/20140613114150_士林田徑場全景壓縮.JPG','25.1087227976137','121.471055746078','http://www.tcmt.edu.tw','(02)28102292-2246');
insert into Court values ('雙園國中體育館','臺北市萬華區和德里興義街2號','http://az804957.vo.msecnd.net/photogym/20140722094539_IMG_0630(001).jpg','25.0274249237312','121.491322517395','http://www.syjhs.tp.edu.tw','(02)23037605#137');
insert into Court values ('臺灣科技大學籃球場','臺北市大安區基隆路四段43號','http://az804957.vo.msecnd.net/photogym/20140610145546_DSC04705.JPG','25.0146356817825','121.543239355087','http://www.ntust.edu.tw','(02)27376503');
insert into Court values ('永春高中活動中心','臺北市信義區松隆里松山路654號','http://az804957.vo.msecnd.net/photogym/20140722095944_IMG_9146.JPG','25.0321834842895','121.578440666199','http://www.ycsh.tp.edu.tw','(02)27272983');
insert into Court values ('志清國小籃球場','臺北市文山區景仁里景福街21巷5號','http://az804957.vo.msecnd.net/photogym/20140722100243_IMG_2150.JPG','24.9982959855591','121.538937091827','http://www.jcps.tp.edu.tw','(02)29323875');
insert into Court values ('臺北護理健康大學室外籃球場','臺北市北投區明德路365號','http://az804957.vo.msecnd.net/photogym/20140729161849_S__4046895.jpg','25.1173032757039','121.519818305969','http://www.ntunhs.edu.tw/bin/home.php','02-28227101#2901');
insert into Court values ('十信高中籃球場','臺北市北投區北投路二段55號','http://az804957.vo.msecnd.net/photogym/20140613114932_IMG_5027.jpg','25.1330273263699','121.496574282646','http://www.shvs.tp.edu.tw','(02)28921166');
insert into Court values ('雙園國中田徑場','臺北市萬華區和德里興義街2號','http://az804957.vo.msecnd.net/photogym/20140722100427_IMG_9500(001).jpg','25.0274297844591','121.491451263428','http://www.syjhs.tp.edu.tw','(02)23037605#137');
insert into Court values ('稻江護家籃球場','臺北市中山區新生北路三段55號','http://az804957.vo.msecnd.net/photogym/20140704153313_學校全景.jpg','25.0655416906818','121.529066562653','http://www.tcnvs.tp.edu.tw','(02)25955161');
insert into Court values ('大同區迪化污水處理廠附設休閒運動公園','臺北市大同區酒泉街235號','http://az804957.vo.msecnd.net/photogym/20140729172010_IMGP2742_2.jpg','25.0737146214691','121.510264277458','http://www.sso.taipei.gov.tw/ct.asp?xItem=996002&ctNode=19804&mp=106041','02-25973183*863');
insert into Court values ('逸仙國小活動中心','臺北市北投區中心里新民路2號','http://az804957.vo.msecnd.net/photogym/20140722101210_活動中心-1.jpg','25.1379711810225','121.504926681519','http://www.ysps.tp.edu.tw','(02)28914537＃25');
insert into Court values ('內湖高工綜合球場','臺北市內湖區港墘里內湖路1段520號','http://az804957.vo.msecnd.net/photogym/20140604142835_mobile6db763e6-7966-4e68-a8e7-33e690b40aae.jpg','25.0799824330742','121.574310064316','http://www.nihs.tp.edu.tw','02-26574874#205');
insert into Court values ('富安國小操場','臺北市士林區富洲里延平北路8段135號','http://az804957.vo.msecnd.net/photogym/20140729174657_DSCN4888(003).jpg','25.1059733286316','121.481901664065','http://www.fuanps.tp.edu.tw','(02)28103192');
insert into Court values ('忠義國小籃球場','臺北市中正區中華路二段307巷17號','http://az804957.vo.msecnd.net/photogym/20160707162507_P5290490.JPG','25.0298990094017','121.505843997002','http://www.cips.tp.edu.tw','02-23038752#231');
insert into Court values ('德明財經科技大學田徑場','臺北市內湖區環山路一段56號','http://az804957.vo.msecnd.net/photogym/20140620122301_mobilefb4b27d2-400e-4b11-a062-ecf8b8def118.jpg','25.0871933233784','121.567239761353','http://www.takming.edu.tw','(02)26585801ex2672');
insert into Court values ('臺北市文山運動中心','臺北市文山區興隆路3段222號','http://az804957.vo.msecnd.net/photogym/20140620123524_167903574_m.jpg','24.99700879575491','121.5596866607666','https://wssc.cyc.org.tw/','02-25702330#6427');
insert into Court values ('東園國小籃球場','臺北市萬華區全德里東園街195號','http://az804957.vo.msecnd.net/photogym/20140722103514_藍 (1).JPG','25.0227828405883','121.49863421917','http://www.tyes.tp.edu.tw','(02)23034803');
insert into Court values ('內湖高中籃球場','臺北市內湖區紫陽里文德路218號','http://az804957.vo.msecnd.net/photogym/20140604145425_C:%5CUsers%5Cuser%5CDesktop%5C體育場所%5CIMG_2566.JPG','25.0771838219583','121.587624549866','http://www.nhsh.tp.edu.tw','(02)27977035');
insert into Court values ('大安運動中心','臺北市大安區','http://az804957.vo.msecnd.net/photogym/20140715192917_267-郭映圻-金碧輝煌.JPG','25.020533432964115','121.54577873647213','https://dasc.cyc.org.tw/IISystem/Portal/dasc/','02-25702330#6430');
insert into Court values ('民生國中活動中心','臺北市松山區新東里新東街30巷1號','http://az804957.vo.msecnd.net/photogym/20140722104631_P_20140722_084755.jpg','25.0599534633717','121.567293405533','http://newweb.msjh.tp.edu.tw/','(02)27653433');
insert into Court values ('臺北市立啟智學校田徑場(主要設施)、籃球場(次要設施)','臺北市士林區忠誠路二段207巷3號','http://az804957.vo.msecnd.net/photogym/20140716082920_IMG_1707.JPG','25.1168952734025','121.535857915878','http://www.tpmr.tp.edu.tw/releaseRedirect.do?unitID=183&pageID=3037','02-28749117#1302');
insert into Court values ('蘭雅國中活動中心','臺北市士林區三玉里忠誠路2段51號','http://az804957.vo.msecnd.net/photogym/20140722104735_DSC_8482.JPG','25.1105492051365','121.531963348389','http://163.21.26.20/enable01/','02-28329377#230');
insert into Court values ('再興中學體育館','臺北市文山區明義里興隆路4段2號','http://az804957.vo.msecnd.net/photogym/20140730122241_B.jpg','24.99045352086792','121.55897855758667','http://www.thsh.tp.edu.tw','(02)29366803分機123');
insert into Court values ('銘傳大學體育館','臺北市士林區中山北路五段250號','http://az804957.vo.msecnd.net/photogym/20140609104547_逸仙堂.jpg','25.0855988970648','121.533508300781','http://www.mcu.edu.tw','(02)28824564分機2326');
insert into Court values ('大同大學籃球場','臺北市中山區中山北路三段40號','http://az804957.vo.msecnd.net/photogym/20140620134805_DSC_7404.JPG','25.0682701107964','121.520158946514','http://www.ttu.edu.tw','(02)21822928#7519');
insert into Court values ('東湖國中活動中心','臺北市內湖區樂康里康樂街131號','http://az804957.vo.msecnd.net/photogym/20140730143017_DSC00084.jpg','25.0726699550093','121.619853973389','http://www.dhjh.tp.edu.tw','(02)26330373#634');
insert into Court values ('永建國小籃球場','臺北市文山區華興里試院路2號','http://az804957.vo.msecnd.net/photogym/20140722121529_DSC00434-1.jpg','24.987607890354276','121.54999852180481','http://www.yjps.tp.edu.tw','(02)22363855');
insert into Court values ('松山高中活動中心','臺北市信義區基隆路一段156號','http://az804957.vo.msecnd.net/photogym/20140620140540_DSCN1826.JPG','25.0437170025906','121.565426588058','http://www.sssh.tp.edu.tw','(02)27535968');
insert into Court values ('民生國小操場','臺北市松山區敦化北路199巷18號','http://az804957.vo.msecnd.net/photogym/20140730152034_DSC05322.jpg','25.056120666621','121.552723646164','http://www.msps.tp.edu.tw','(02)27122452*821');
insert into Court values ('文山特殊教育學校體育館','[116]臺北市文山區秀明路一段169號','http://az804957.vo.msecnd.net/photogym/20140730152515_P7307487.JPG','24.9919121696647','121.567148566246','http://www.wsses.tp.edu.tw/','(02)86615183#302');
insert into Court values ('陽明大學活動中心','臺北市北投區立農街二段155號','http://az804957.vo.msecnd.net/photogym/20140620141950_CIMG0740.JPG','25.1216217021507','121.51424869895','http://pe.web.ym.edu.tw/front/bin/home.phtml','(02)28267000#2209');
insert into Court values ('國防醫學院活動中心','臺北市內湖區民權東路六段161號 ','http://az804957.vo.msecnd.net/photogym/20140708150401_0023.jpg','25.0720951414727','121.597173213959','http://www.ndmctsgh.edu.tw/','(02)87923144');
insert into Court values ('臺北市立大學體育館（天母校區）','臺北市士林區忠誠路二段101號','http://az804957.vo.msecnd.net/photogym/20140604162334_th.jpg','25.1161156937892','121.534881591797','http://www.uTaipei.edu.tw','02-28718288#7314');
insert into Court values ('靜心小學運動中心','臺北市文山區興福里興隆路2段46號','http://az804957.vo.msecnd.net/photogym/20140702172907_運動中心1.JPG','24.9988098269339','121.546772360671','http://www.chjhs.tp.edu.tw','02-29323118#165');
insert into Court values ('中山區華山公園籃球場','臺北市中山區市民大道二段','http://az804957.vo.msecnd.net/photogym/20140825140911_照片 050.jpg','25.0479847287031','121.52468919754','http://pkl.taipei.gov.tw','(02)25850192');
insert into Court values ('臺北教育大學籃球場','臺北市大安區和平東路二段134號','http://az804957.vo.msecnd.net/photogym/20140604164009_籃球場1.jpg','25.0234147575176','121.544709205627','http://www.ntue.edu.tw/','(02)27321104');
insert into Court values ('國防醫學院田徑場','臺北市內湖區民權東路六段161號 ','http://az804957.vo.msecnd.net/photogym/20140708152207_DSCN4424_compressed.jpg','25.0717324682919','121.59875035286','http://www.ndmctsgh.edu.tw/','(02)87923144');
insert into Court values ('內湖區石潭公園籃球場','臺北市內湖區成功路二段(安康路25巷內)','http://az804957.vo.msecnd.net/photogym/20140826114654_DSCN3695.JPG','25.063694121315816','121.59265100955986','http://pkl.taipei.gov.tw','(02)25850192');
insert into Court values ('金華國中活動中心','臺北市大安區福住里新生南路2段32號','http://az804957.vo.msecnd.net/photogym/20140731090627_體育館全景.jpg','25.0314106560562','121.532907485962','http://www.chwjh.tp.edu.tw','(02)33931799');
insert into Court values ('內湖高中活動中心','臺北市內湖區紫陽里文德路218號','http://az804957.vo.msecnd.net/photogym/20140529114640_C:%5CUsers%5Cuser%5CDesktop%5C體育場所%5CIMG_2573.JPG','25.0782333086234','121.586991548538','http://www.nhsh.tp.edu.tw','(02)27977035');
insert into Court values ('中山運動中心','104臺北市中山區中山北路二段44巷2號','http://az804957.vo.msecnd.net/photogym/20140625182321_DSCN9818.JPG','25.054826648079764','121.52141153812408','http://cssc.cyc.org.tw','02-25702330#6430');
insert into Court values ('武功國小活動中心','臺北市文山區萬祥里興隆路1段68號','http://az804957.vo.msecnd.net/photogym/20140826143810_IMGP0001.JPG','25.0038140968739','121.540149450302','http://www.wkps.tp.edu.tw','02-29314360#32');
insert into Court values ('大同運動中心','103臺北市大同區大龍街51號','http://az804957.vo.msecnd.net/photogym/20140625184629_大同外觀.JPG','25.065269574212163','121.51634752750397','http://www.taipeidt.com/','02-25702330#6430');
insert into Court values ('陽明高中台元館','臺北市士林區後港里中正路510號','http://az804957.vo.msecnd.net/photogym/20140722145525_台元館照片 - 複製.jpg','25.0931425783851','121.516716331244','http://www.ymsh.tp.edu.tw','(02)28316675');
insert into Court values ('臺北市南港運動中心','臺北市南港區玉成街69號','http://az804957.vo.msecnd.net/photogym/20140625222852_normal_49cfa61b59a6b.jpg','25.04895059235578','121.58185310661793','https://ngsc.cyc.org.tw/','02-25702330#6427');
insert into Court values ('陽明高中新大樓體育館','臺北市士林區後港里中正路510號','http://az804957.vo.msecnd.net/photogym/20140722145745_新大樓球場-2 - 複製.jpg','25.0921776301157','121.51662312448','http://www.ymsh.tp.edu.tw','(02)28316675');
insert into Court values ('石牌國中學生活動中心籃球場','臺北市北投區吉利里石牌路1段139號','http://az804957.vo.msecnd.net/photogym/20140731093619_IMAG0164.jpg','25.1156979730719','121.514078378677','http://www.spjh.tp.edu.tw','02-28224682#253');
insert into Court values ('臺北醫學大學綜合球場','臺北市信義區吳興街250號','http://az804957.vo.msecnd.net/photogym/20140609114740_圖片2.jpg','25.0260298868326','121.561376452446','http://pe.tmu.edu.tw','(02)27361661');
insert into Court values ('大同高中綜合球場','臺北市中山區聚英里中山北路3段40號','http://az804957.vo.msecnd.net/photogym/20140619104117_相片6538.jpg','25.0675172523512','121.520342958429','http://www.tsh.ttu.edu.tw','02-25925252#3656#603');
insert into Court values ('大同區建成公園籃球場','臺北市大同區承德路二段35號旁','http://az804957.vo.msecnd.net/photogym/20140827140207_20140827140207_IMG_0906.JPG','25.0546943847068','121.5187561512','http://pkl.taipei.gov.tw','(02)25850192');
insert into Court values ('百齡高中活動中心','臺北市士林區義信里承德路4段177號','http://az804957.vo.msecnd.net/photogym/20140529142146_百齡高中活動中心.jpg','25.0864539762441','121.523551940918','http://www.blsh.tp.edu.tw','(02)28831568');
insert into Court values ('政大附中體育館','臺北市文山區政大一街353號','http://az804957.vo.msecnd.net/photogym/20140529142512_D:%5CMy Documents%5C總務處%5C空間配置圖%5C1030616體育館照片%5CDSCN0477.jpg','24.9878765323598','121.584818959236','http://www.ahs.nccu.edu.tw','(02)82377500轉9441');
insert into Court values ('成功中學運動中心','臺北市中正區幸福里濟南路1段71號','http://az804957.vo.msecnd.net/photogym/20140609115648_picmain.jpg','25.0430122885876','121.523015499115','http://www.cksh.tp.edu.tw','(02)23216256#276');
insert into Court values ('健康國小活動中心','臺北市松山區延壽街168號','http://az804957.vo.msecnd.net/photogym/20140722152908_IMAG1612.jpg','25.0565809663607','121.563184261322','http://www.jkes.tp.edu.tw','02-25282814#136');
insert into Court values ('百齡高中籃球場','臺北市士林區義信里承德路4段177號','http://az804957.vo.msecnd.net/photogym/20140529151331_籃球場.jpg','25.086502560109','121.523938179016','http://www.blsh.tp.edu.tw','(02)28831568');
insert into Court values ('臺北市信義運動中心','臺北市信義區松勤街100號','http://az804957.vo.msecnd.net/photogym/20140617171939_DSC_2049.jpg','25.031848106597433','121.56655311584473','https://xysc.cyc.org.tw/IISystem/Portal/xysc/','02-25702330#6428');
insert into Court values ('懷生國中籃球場','臺北市大安區忠孝東路三段248巷30號','http://az804957.vo.msecnd.net/photogym/20140731112005_DSC09904.JPG','25.039911498864452','121.54112577438354','http://www.hsjh.tp.edu.tw','(02)27215078');
insert into Court values ('金華國小運動場','臺北市大安區永康里愛國東路79巷11號','http://az804957.vo.msecnd.net/photogym/20140731112221_DSC08360.JPG','25.032599059723','121.528546214104','http://www.cups.tp.edu.tw/./','(02)23917402-831');
insert into Court values ('祐德中學籃球場','臺北市信義區忠孝東路5段790巷27號','http://az804957.vo.msecnd.net/photogym/20140711140654_IMAG1.jpg','25.0417683612888','121.584057211876','http://www.ytsh.tp.edu.tw','(02)27278280');
insert into Court values ('大安高工田徑場','臺北市大安區龍圖里復興南路2段52號','http://az804957.vo.msecnd.net/photogym/20140731113532_操場.jpg','25.03207447448988','121.54117003083229','http://www.taivs.tp.edu.tw','02-27091630#123');
insert into Court values ('建國中學活動中心','臺北市中正區龍光里南海路56號','http://az804957.vo.msecnd.net/photogym/20140605085653_活動中心.jpg','25.0295393222459','121.512608528137','http://www.ck.tp.edu.tw','(02)23034381');
insert into Court values ('大安高工學生活動中心','臺北市大安區龍圖里復興南路2段52號','http://az804957.vo.msecnd.net/photogym/20140731115219_活動中心1.jpg','25.0319594131788','121.541662216187','http://www.taivs.tp.edu.tw','(02)27091630#123');
insert into Court values ('關渡國小活動中心','臺北市北投區一德里中央北路4段581號','http://az804957.vo.msecnd.net/photogym/20140731121328_DSC028030000.jpg','25.1266092440274','121.466261297464','http://www.kdps.tp.edu.tw','(02)28912847');
insert into Court values ('建國中學籃球場','臺北市中正區龍光里南海路56號','http://az804957.vo.msecnd.net/photogym/20140605091005_室外籃球場.jpg','25.0297288872297','121.513134241104','http://www.ck.tp.edu.tw','(02)23034381');
insert into Court values ('興德國小','臺北市文山區興隆路二段235號','http://az804957.vo.msecnd.net/photogym/20160506083107_DSCN7036.JPG','25.0017964902071','121.551027596011','http://www.hdps.tp.edu.tw','02-29329431#27');
insert into Court values ('光仁小學籃球場','臺北市萬華區壽德里萬大路423巷15號','http://az804957.vo.msecnd.net/photogym/20140717094624_SAM_1968.JPG','25.0214571816811','121.49972319603','http://www.kjes.tp.edu.tw','(02)23032874');
insert into Court values ('強恕中學體育館','臺北市中正區板溪里汀州路二段143號','http://az804957.vo.msecnd.net/photogym/20140708195510_C:%5CDocuments and Settings%5Cto%5C桌面%5CIMG_5403.jpg','25.0259035063999','121.515043973923','http://www.qshs.tp.edu.tw','(02)23656571');
insert into Court values ('南港高中活動中心','臺北市南港區西新里向陽路21號','http://az804957.vo.msecnd.net/photogym/20160506112915_13170797_1322964737720679_1637846276_o.jpg','25.0522874587259','121.594281792641','http://www.nksh.tp.edu.tw','02-27837863#245');
insert into Court values ('西園國小活動中心','臺北市萬華區東園街73巷65號','http://az804957.vo.msecnd.net/photogym/20140731135729_DSC_1496.jpg','25.026672626439726','121.49907238414016','http://www.hups.tp.edu.tw','(02)23030257');
insert into Court values ('金甌女中籃球場','臺北市大安區光明里杭州南路2段1號','http://az804957.vo.msecnd.net/photogym/20140711143004_籃球場全景.jpg','25.0347814152091','121.524538993835','http://www.cogsh.tp.edu.tw','(02)23214765#206');
insert into Court values ('成德國中活動中心','臺北市南港區成福里東新街108巷23號','http://az804957.vo.msecnd.net/photogym/20140731142748_DSC05806.JPG','25.044844536571624','121.58757090568542','http://www.cdjh.tp.edu.tw','(02)26515636');
insert into Court values ('政治大學體育館','臺北市文山區指南路二段64號','http://az804957.vo.msecnd.net/photogym/20140529165724_體育館外觀2.jpg','24.985002883359','121.573655605316','http://sports.nccu.edu.tw/','02-29393091#62964');
insert into Court values ('石牌國小田徑場','臺北市北投區吉利里致遠二路80號','http://az804957.vo.msecnd.net/photogym/20140722164905_DSC09291.JPG','25.114726524022895','121.51266753673553','http://web.spps.tp.edu.tw','(02)28227484');
insert into Court values ('石牌國小活動中心','臺北市北投區吉利里致遠二路80號','http://az804957.vo.msecnd.net/photogym/20140722171537_DSC_0067.JPG','25.116266267186116','121.51223301887512','http://web.spps.tp.edu.tw','(02)28227484');
insert into Court values ('東吳大學城中校區室外籃球場','臺北市中正區貴陽街一段56號','http://az804957.vo.msecnd.net/photogym/20140616160419_城中綠地-1.jpg','25.0379734654765','121.509817689657','http://www.scu.edu.tw/physical/','02-28819471#5606');
insert into Court values ('協和工商籃球場','臺北市信義區忠孝東路5段790巷27號','http://az804957.vo.msecnd.net/photogym/20140711150249_IMAG1.jpg','25.0417905722158','121.583700478077','http://www.hhvs.tp.edu.tw','(02)27265775-239');
insert into Court values ('景文高中籃球場','臺北市文山區木新里保儀路127號','http://az804957.vo.msecnd.net/photogym/20140709094025_IMG_6719.JPG','24.9850017163824','121.568599641323','http://www.jwsh.tp.edu.tw','(02)29390310');
insert into Court values ('實踐大學體育館(臺北校區)','臺北市中山區大直街70號','http://az804957.vo.msecnd.net/photogym/20140617182508_體育館日.JPG','25.0845711907292','121.545625770013','http://www.sportnew.usc.edu.tw/','(02)25381111分機3811');
insert into Court values ('景美國中五育館','臺北市文山區景華里景中街27號','http://az804957.vo.msecnd.net/photogym/20140902155850_照片4.JPG','24.9934218529405','121.54268682003','http://www.cmjh.tp.edu.tw','(02)89353130*501.502');
insert into Court values ('雨聲國小籃球場','臺北市士林區岩山里至誠路1段62巷70號','http://az804957.vo.msecnd.net/photogym/20140723094640_籃球場2.JPG','25.1030005250703','121.535485088825','http://www.yses.tp.edu.tw','(02)28311004');
insert into Court values ('陽明大學山下球場','臺北市北投區立農街二段155號','http://az804957.vo.msecnd.net/photogym/20140620161711_CIMG0744.JPG','25.11978394893','121.513720303774','http://pe.web.ym.edu.tw/front/bin/home.phtml','(02)28267000#2209');
insert into Court values ('臺北科技大學東校區運動園區（籃球比賽場）','臺北市大安區忠孝東路三段1號','http://az804957.vo.msecnd.net/photogym/20140617213757_DSC07780.JPG','25.0431872524421','121.537558436394','http://www.ntut.edu.tw','02-27712171#3332');
insert into Court values ('臺北科技大學東校區運動園區（籃球練習場）','臺北市大安區忠孝東路三段1號','http://az804957.vo.msecnd.net/photogym/20140617214204_DSC07778.JPG','25.0432358534685','121.537874937058','http://www.ntut.edu.tw','02-27712171#3332');
insert into Court values ('陽明大學山頂操場','臺北市北投區立農街二段155號','http://az804957.vo.msecnd.net/photogym/20140620163000_CIMG0734.JPG','25.1251865839461','121.514883041382','http://pe.web.ym.edu.tw/front/bin/home.phtml','(02)28267000#2209');
insert into Court values ('政治大學綜合球類練習區','臺北市文山區指南路二段64號','http://az804957.vo.msecnd.net/photogym/20140530102849_綜合球類練習區1.jpg','24.9845895780627','121.574111580849','http://sports.nccu.edu.tw','(02)29393091分機62964');
insert into Court values ('信義國小田徑場','臺北市信義區松勤街60號','http://az804957.vo.msecnd.net/photogym/20140723153220_IMAG3381.jpg','25.03152244912069','121.56329154968262','http://www.syes.tp.edu.tw','(02)27204005');
insert into Court values ('臺北科技大學14.中正館5F綜合球場','臺北市大安區忠孝東路三段1號','http://az804957.vo.msecnd.net/photogym/20140618005054_mutiplecor2t.jpg','25.0434156770987','121.53582572937','http://www.ntut.edu.tw','02-27712171#3332');
insert into Court values ('東新國小運動場','臺北市南港區東新里興南街62號','http://az804957.vo.msecnd.net/photogym/20140801102605_P_20131015_083122.jpg','25.056036693015784','121.6024249792099','http://www.thes.tp.edu.tw','(02)27837577分機22');
insert into Court values ('靜修女中體育館','臺北市大同區雙連里寧夏路72號','http://az804957.vo.msecnd.net/photogym/20140530105405_CIMG2570.JPG','25.0578264681449','121.515189886486','http://www.bish.tp.edu.tw','02-25574345#304');
insert into Court values ('吳興國小三樓活動中心','臺北市信義區松仁路226號','http://az804957.vo.msecnd.net/photogym/20140724090054_2013-02-20-1031.jpg','25.0251549427069','121.567722558975','http://www.wsps.tp.edu.tw/front/bin/home.phtml','(02)27200226#31');
insert into Court values ('萬興國小運動中心','臺北市文山區萬興里秀明路2段114號','http://az804957.vo.msecnd.net/photogym/20140801152750_mobile7c67db8a-fa50-47a9-b962-81c32157e228.jpg','24.989403283016546','121.57647728919983','http://www.wxes.tp.edu.tw','(02)29381721');
insert into Court values ('興福國中活動中心','臺北市文山區興旺里福興路80號','http://az804957.vo.msecnd.net/photogym/20140904124554_DSC_5978.jpg','25.0049274126343','121.550497412682','http://www.hfjh.tp.edu.tw','02-29322024#340');
insert into Court values ('馬偕醫護管理專科學校體育館','臺北市北投區聖景路92號','http://az804957.vo.msecnd.net/photogym/20140627101620_C:%5CDocuments and Settings%5Cuser%5C桌面%5C運動地圖%5C運動地圖-雙校區場地照片%5C關渡%5C體育館%5CDSC_0006-1-1-1.JPG','25.1228431321469','121.46441636658','http://www.mkc.edu.tw','(02)28584180#3146');
insert into Court values ('活動中心','臺北市松山區介壽里延壽街401號','http://az804957.vo.msecnd.net/photogym/20160510100845_2-1-1.JPG','25.0564157407794','121.555835008621','http://www.csjh.tp.edu.tw','02-27674496#501');
insert into Court values ('建安國小田徑場','臺北市大安區龍雲里大安路2段99號','http://az804957.vo.msecnd.net/photogym/20160510104702_555jpg.jpg','25.0293157324905','121.546481609312','http://www.jnps.tp.edu.tw','02-27077119#123');
insert into Court values ('永吉國中活動中心4樓籃球場','臺北市信義區四育里8鄰松隆路161號','http://az804957.vo.msecnd.net/photogym/20140724100024_DSC02603.JPG','25.047736225035056','121.5730333328247','http://www.yjjh.tp.edu.tw','(02)27649066-188');
insert into Court values ('政治大學六期運動園區','臺北市文山區指南路二段64號','http://az804957.vo.msecnd.net/photogym/20140530120036_六期全區圖.jpg','24.9812101473456','121.577941775322','http://sports.nccu.edu.tw/','(02)29393091分機62964');
insert into Court values ('吳興國小田徑場','臺北市信義區松仁路226號','http://az804957.vo.msecnd.net/photogym/20140724100407_操場 (4).jpg','25.0253906921547','121.567333638668','http://www.wsps.tp.edu.tw/front/bin/home.phtml','(02)27200226#31');
insert into Court values ('胡適國小活動中心','臺北市南港區中研里舊莊街1段1號','http://az804957.vo.msecnd.net/photogym/20160510110301_圖片3.jpg','25.0423707523186','121.617659926414','http://www.hsps.tp.edu.tw','02-27824949#922');
insert into Court values ('北一女中活動中心','臺北市中正區黎明里重慶南路1段165號','http://az804957.vo.msecnd.net/photogym/20140724102633_1.jpg','25.037909066349215','121.51294112205505','http://www.fg.tp.edu.tw','(02)23820484');
insert into Court values ('臺北醫學大學籃球場','臺北市信義區吳興街250號','http://az804957.vo.msecnd.net/photogym/20140609150051_籃球場.jpg','25.0260444691818','121.561403274536','http://pe.tmu.edu.tw','(02)27361661');
insert into Court values ('三民國中活動中心','臺北市內湖區湖興里民權東路6段45號','http://az804957.vo.msecnd.net/photogym/20140804111548_活動中心.JPG','25.0690840088574','121.586042046547','http://www.smjh.tp.edu.tw','(02)27924772');
insert into Court values ('大同高中籃球場','臺北市中山區中央里長春路167號','http://az804957.vo.msecnd.net/photogym/20140605140232_20140326_114045.jpg','25.0558714667007','121.536244153976','http://www.ttsh.tp.edu.tw/releaseRedirect.do?unitID=183&pageID=3042','(02)25054269');
insert into Court values ('南湖高中運動中心','臺北市內湖區康寧路三段220號','http://az804957.vo.msecnd.net/photogym/20140621142951_10458524_10204354110359585_1277845401404937502_n.jpg','25.0669314189394','121.6106915473938','http://www.nhush.tp.edu.tw','(02)26308889');
insert into Court values ('臺灣科技大學體育館','臺北市大安區基隆路四段43號','http://az804957.vo.msecnd.net/photogym/20140609151824_DSC04711.JPG','25.0146356817825','121.543233990669','http://www.ntust.edu.tw','(02)27376503');
insert into Court values ('松山國小活動中心','臺北市松山區八德路四段746號','http://az804957.vo.msecnd.net/photogym/20140724112218_IMAG0655 (2).jpg','25.0508047423248','121.579274296728','http://web.ssps.tp.edu.tw','(02)27672907-627');
insert into Court values ('泰北高中體育館','臺北市士林區福林里福林路240號','http://az804957.vo.msecnd.net/photogym/20140605141636_PA261947.JPG','25.0972051153816','121.535359025002','http://www.tpsh.tp.edu.tw','(02)28825560');
insert into Court values ('東山高中多功能複合式運動場','臺北市文山區老泉里老泉街26巷3號','http://az804957.vo.msecnd.net/photogym/20140717153657_76201.jpg','24.9730261915436','121.561644673347','http://www.tshs.tp.edu.tw','(02)29395826');
insert into Court values ('興華國小運動場','臺北市文山區興光里興隆路3段125巷6號','http://az804957.vo.msecnd.net/photogym/20140724113350_1840.jpg','24.999214877680725','121.55912071466446','http://www.hhps.tp.edu.tw','(02)22393070');
insert into Court values ('南港高工活動中心','臺北市南港區南港里興中路29號','http://az804957.vo.msecnd.net/photogym/20140530163736_IMAG2479.jpg','25.0553563479356','121.608127355576','http://www.nkhs.tp.edu.tw','(02)27825432#1209');
insert into Court values ('龍山國中田徑場','臺北市萬華區富裕里南寧路46號','http://az804957.vo.msecnd.net/photogym/20160511131238_IMG_9690.JPG','25.0356733021595','121.505281806058','http://www.lsjh.tp.edu.tw','02-23362789#303');
insert into Court values ('中正高中籃球場','臺北市北投區文林北路77號','http://az804957.vo.msecnd.net/photogym/20140616181735_CIMG9217.JPG','25.1040012134418','121.51496887207','http://www.ccsh.tp.edu.tw','(02)28234811-330');
insert into Court values ('西湖國中運動場','臺北市內湖區西湖里環山路1段27號','http://az804957.vo.msecnd.net/photogym/20140724115530_操場.jpg','25.0860434418155','121.56619638204575','http://www.xhjhs.tp.edu.tw','(02)27991817#215');
insert into Court values ('龍山國小田徑場','臺北市萬華區青山里和平西路三段235號','http://az804957.vo.msecnd.net/photogym/20140805112004_照片 012.jpg','25.0360329712733','121.496311426163','http://www.lses.tp.edu.tw','02-23082977');
insert into Court values ('松山工農田徑場','臺北市信義區忠孝東路5段236巷15號','http://az804957.vo.msecnd.net/photogym/20140619150012_IMG_20140116_103418.jpg','25.0396296050021','121.573001146317','http://www.saihs.edu.tw','02-27226616#351');
insert into Court values ('興福國中內操場','臺北市文山區興旺里福興路80號','http://az804957.vo.msecnd.net/photogym/20160511155540_內操場全景照片.jpg','25.0050197833577','121.550288200378','http://www.hfjh.tp.edu.tw','02-29322024#340');
insert into Court values ('南港高工籃球場','臺北市南港區南港里興中路29號','http://az804957.vo.msecnd.net/photogym/20140603094426_IMAG2487.jpg','25.0559735182746','121.608508229256','http://www.nkhs.tp.edu.tw','(02)27825432#1209');
insert into Court values ('建成國中體育館','臺北市大同區長安西路37之1號','http://az804957.vo.msecnd.net/photogym/20140724130523_照片 273_S.JPG','25.05188652928269','121.51886478066444','http://www.jcjh.tp.edu.tw','(02)25587042*651');
insert into Court values ('民族國中體育館','臺北市大安區羅斯福路4段113巷13號','http://az804957.vo.msecnd.net/photogym/20140806113300_-1.jpg','25.0111762570062','121.538864672184','http://www.mtjh.tp.edu.tw','(02)27322935');
insert into Court values ('滬江高中體育館','臺北市文山區景美里羅斯福路6段336號','http://az804957.vo.msecnd.net/photogym/20140630093525_.JPG','24.9890642876553','121.539237499237','http://www.hchs.tp.edu.tw','(02)86631122');
insert into Court values ('三玉國小室內綜合球場','臺北市士林區三玉里天母東路116號','http://az804957.vo.msecnd.net/photogym/20140724143135_DSC05749.JPG','25.1177768480957','121.537284851074','http://www.syups.tp.edu.tw','(02)28751369');
insert into Court values ('民族國中田徑場','臺北市大安區羅斯福路4段113巷13號','http://az804957.vo.msecnd.net/photogym/20140808100914_2.JPG','25.0104598102895','121.538652777672','http://www.mtjh.tp.edu.tw','(02)27322935');
insert into Court values ('武揚館','臺北市北投區一德里中央北路4段48號','http://az804957.vo.msecnd.net/photogym/20160512133346_DSC_0530.JPG','25.1347610977931','121.477416604757','http://www.ttcjh.ntpc.edu.tw','02-28929633#243');
insert into Court values ('松山家商活動中心','臺北市信義區松山路655號','http://az804957.vo.msecnd.net/photogym/20140619152957_全景照片.jpg','25.0357219061041','121.58047914505','http://www.ssvs.tp.edu.tw','(02)27261118#330');
insert into Court values ('臺灣師範大學體育館','臺北市文山區汀州路四段88號','http://az804957.vo.msecnd.net/photogym/20140619154317_體育館.JPG','25.0087060477633','121.535306721926','http://www.ntnu.edu.tw','(02)77343176');
insert into Court values ('大誠高中籃球場','臺北市文山區萬興里秀明路2段175號','http://az804957.vo.msecnd.net/photogym/20140619154428_C:%5CDocuments and Settings%5CPEHT%5C桌面%5C體育組%5C102學年度%5C公文附件%5C建構全國運動場館資訊網計畫相關資料%5CDSC09658.JPG','24.9906723192909','121.578397750854','http://www.tcsh.tp.edu.tw','(02)22348989 #32');
insert into Court values ('大直國小活動中心','臺北市中山區大直里大直街2號','http://az804957.vo.msecnd.net/photogym/20140724155653_DSCF9523.JPG','25.0804634379172','121.546179056168','http://www.tzes.tp.edu.tw','(02)25333953');
insert into Court values ('胡適國小戶外籃球場','臺北市南港區中研里舊莊街1段1號','http://az804957.vo.msecnd.net/photogym/20160512165930_1-1-1.jpg','25.042307570541','121.617491841262','http://www.hsps.tp.edu.tw','02-27824949#930');
insert into Court values ('民族國小操場','臺北市松山區民生東路4段97巷7號','http://az804957.vo.msecnd.net/photogym/20140812103641_2014_01_10_EOS 5D Mark III_8581_1 (複製).JPG','25.05955012927832','121.55130207538605','http://enable.mces.tp.edu.tw/front/bin/home.phtml','(02)27124872');
insert into Court values ('南門國小籃球場、綜合球場','臺北市中正區南門里廣州街6號','http://az804957.vo.msecnd.net/photogym/20140812103655_IMG_0999.JPG','25.0350025648793','121.508703231812','http://www.nmes.tp.edu.tw','(02)23715052');
insert into Court values ('臺北藝術大學籃球場','臺北市北投區學園路1號','http://az804957.vo.msecnd.net/photogym/20140609190108_泳池全景.jpg','25.1372038768211','121.473437547684','http://www.tnua.edu.tw','02-28961000#5663');
insert into Court values ('溪山國小運動場','臺北市士林區溪山里至善路3段199號','http://az804957.vo.msecnd.net/photogym/20140812120347_IMG_0515.JPG','25.1198751159997','121.579958796501','http://www.hops.tp.edu.tw','(02)28411010');
insert into Court values ('松山工農學生活動中心','臺北市信義區忠孝東路5段236巷15號','http://az804957.vo.msecnd.net/photogym/20140611140822_DSC_0847.jpg','25.0391217083908','121.572199165821','http://www.saihs.edu.tw','(02)27226616');
insert into Court values ('三興國民小學活動中心','臺北市信義區景聯里基隆路2段99號','http://az804957.vo.msecnd.net/photogym/20140724170647_DSCN2337-1.jpg','25.0294158618467','121.55833160874','http://www.shps.tp.edu.tw','(02)27385488分機51');
insert into Court values ('大同高中活動中心','臺北市中山區中央里長春路167號','http://az804957.vo.msecnd.net/photogym/20140605163553_20140326_114934.jpg','25.0568531021267','121.535723805428','http://www.ttsh.tp.edu.tw/releaseRedirect.do?unitID=183&pageID=3042','(02)25054269');
insert into Court values ('芳和國中籃球場','臺北市大安區芳和里臥龍街170號','http://az804957.vo.msecnd.net/photogym/20140813104930_QA1A8036.jpg','25.0182475259394','121.550068259239','http://www.fhjhs.tp.edu.tw','(02)27321961');
insert into Court values ('育成高中活動中心','臺北市南港區重陽路366號','http://az804957.vo.msecnd.net/photogym/20140611143603_C:%5CDocuments and Settings%5Cuser%5C桌面%5C6F籃球場.jpg','25.0582623669619','121.609618663788','http://www.yucsh.tp.edu.tw','(02)26530475');
insert into Court values ('中國科技大學體育館','臺北市文山區興隆路三段56號','http://az804957.vo.msecnd.net/photogym/20140603141742_3.JPG','24.998796758308','121.555588245392','http://www.cute.edu.tw/','(02)29313416轉2149');
insert into Court values ('臺北護理健康大學體育館','臺北市北投區明德路365號','http://az804957.vo.msecnd.net/photogym/20140714122228_S__4046900.jpg','25.118417989333','121.518627405167','http://www.ntunhs.edu.tw/bin/home.php','02-28227101#2901');
insert into Court values ('興雅國中活動中心','臺北市信義區松德路168巷15號','http://az804957.vo.msecnd.net/photogym/20140725090723_mobilea75831e5-1707-474b-ae7f-708c4214a6c6.jpg','25.0363075828374','121.571788787842','http://www.syajh.tp.edu.tw','02-27232771#330');
insert into Court values ('內湖國小活動中心','臺北市內湖區港富里內湖路二段41號','http://az804957.vo.msecnd.net/photogym/20140725091359_123-2.jpg','25.07996461809317','121.57991409296301','http://www.nhes.tp.edu.tw','(02)27998085');
insert into Court values ('中國科技大學環形/直線慢跑道(非田徑場型)','臺北市文山區興隆路三段56號','http://az804957.vo.msecnd.net/photogym/20140603144005_IMG_0034.JPG','24.9972992958595','121.554826498032','http://www.cute.edu.tw/','(02)29313416轉2149');
insert into Court values ('臺灣戲曲學院籃球場','臺北市內湖區內湖路二段177號','http://az804957.vo.msecnd.net/photogym/20140603145513_securedownload.jpg','25.0821613213862','121.586263489226','http://www.tcpa.edu.tw/bin/home.php','(02)27962666');
insert into Court values ('松山工農籃球場','臺北市信義區忠孝東路5段236巷15號','http://az804957.vo.msecnd.net/photogym/20140619164022_IMG_5393.JPG','25.0401545102948','121.573601961136','http://www.saihs.edu.tw','(02)27226616');
insert into Court values ('碧湖國小操場','臺北市內湖區內湖里金龍路100號','http://az804957.vo.msecnd.net/photogym/20140725103333_IMG_2871.jpg','25.08421909761','121.591433286667','http://www.bhps.tp.edu.tw','(02)27907161');
insert into Court values ('舊莊國小後山操場','臺北市南港區舊莊里舊莊街1段100號','http://az804957.vo.msecnd.net/photogym/20140725103703_調整大小IMG_3368.JPG','25.0389977715778','121.619247794151','http://www.zzes.tp.edu.tw','(02)27821418#121');
insert into Court values ('社子國小後操場','臺北市士林區永倫里延平北路六段308號','http://az804957.vo.msecnd.net/photogym/20140725104638_DSC02529-1.jpg','25.091258827113656','121.50250732898712','http://www.stps.tp.edu.tw','(02)28126195#821');
insert into Court values ('南門國中體育館','臺北市中正區南門里廣州街6號','http://az804957.vo.msecnd.net/photogym/20140725105049_室內籃球場.JPG','25.035255306871402','121.51033401489258','http://www.nmjh.tp.edu.tw','(02)23142775#67');
insert into Court values ('舊莊國小前庭操場','臺北市南港區舊莊里舊莊街1段100號','http://az804957.vo.msecnd.net/photogym/20140725105441_調整大小IMG_3366.JPG','25.0399358000292','121.619338989258','http://www.zzes.tp.edu.tw','(02)27821418#121');
insert into Court values ('東吳大學體育館','臺北市士林區臨溪路70號','http://az804957.vo.msecnd.net/photogym/20140616095059_雙溪體育館-2.jpg','25.0941567071309','121.546365469694','http://www.scu.edu.tw/physical/','(02)28819471#5606');
insert into Court values ('師大附中體育館','臺北市大安區和安里信義路3段143號','http://az804957.vo.msecnd.net/photogym/20140619170845_未命名.jpg','25.0340833579222','121.539847754175','http://www.hs.ntnu.edu.tw','(02)27075215');
insert into Court values ('螢橋國小活動中心','臺北市中正區螢雪里詔安街29號','http://az804957.vo.msecnd.net/photogym/20140725112531_未命名.gif','25.025461173860453','121.51517271995544','http://www.yces.tp.edu.tw','(02)23054620');
insert into Court values ('內湖運動中心','臺北市內湖區洲子街12號','http://az804957.vo.msecnd.net/photogym/20140718171821_1406884770741.jpg','25.078291613174382','121.57520055770874','http://www.nhsports.com.tw/nh/','02-25702330#6426');
insert into Court values ('古亭國中體育館','臺北市中正區中華路2段465號','http://az804957.vo.msecnd.net/photogym/20140725113741_DSCF6802.JPG','25.02390449090013','121.51001751422882','http://www.ktjh.tp.edu.tw','(02)23090986-315.316');
insert into Court values ('大直高中活動中心','臺北市中山區劍潭里北安路420號','http://az804957.vo.msecnd.net/photogym/20140603155148_20140605_142240.jpg','25.0792633516027','121.54296040535','http://www.dcsh.tp.edu.tw','(02)25334017');
insert into Court values ('薇閣小學田徑場','臺北市北投區長安里育仁路106號','http://az804957.vo.msecnd.net/photogym/20140714151244_操場照片.jpg','25.1361257577076','121.500881910324','http://www.wgps.tp.edu.tw','(02)28912668');
insert into Court values ('長安國小體育館','臺北市中山區興亞里吉林路15號','http://az804957.vo.msecnd.net/photogym/20140814175027_IMG_0030.JPG','25.0502536394591','121.531040668488','http://www.caps.tp.edu.tw','(02)25617600分機123');
insert into Court values ('大安森林公園籃球場','臺北市大安新生南路2段1號','http://az804957.vo.msecnd.net/photogym/20140814184741_大安森林公園-場館1.jpg','25.0300205250944','121.536045670509','http://pkl.taipei.gov.tw','(02)27003830');
insert into Court values ('古亭國中田徑場','臺北市中正區中華路2段465號','http://az804957.vo.msecnd.net/photogym/20140725122024_102-11-07-100公尺競賽.JPG','25.02404181033154','121.5103930234909','http://www.ktjh.tp.edu.tw','(02)23090986-315.316');
insert into Court values ('明德國小活動中心','臺北市北投區榮華里明德路190號','http://az804957.vo.msecnd.net/photogym/20140725131500_IMAG2309_BURST001.jpg','25.1122832955383','121.522269845009','http://www.mdes.tp.edu.tw','(02)28229651');
insert into Court values ('蓬萊國小綜合體育館','臺北市大同區星明里寧夏路35號','http://az804957.vo.msecnd.net/photogym/20140725141744_DSC00499.JPG','25.056206778695742','121.51563942432404','http://enable.plps.tp.edu.tw/modules/tadnews/','(02)25569835');
insert into Court values ('明德國小籃球場','臺北市北投區榮華里明德路190號','http://az804957.vo.msecnd.net/photogym/20140725144348_籃球場.jpg','25.1116032630183','121.522530019283','http://www.mdes.tp.edu.tw','(02)28229651');
insert into Court values ('士東國小籃球場','臺北市士林區蘭雅里中山北路6段392號','http://az804957.vo.msecnd.net/photogym/20140725145253_DSCN1196.JPG','25.1128127468097','121.527510881424','http://www.stes.tp.edu.tw','(02)28710064');
insert into Court values ('銘傳大學室外籃球場','臺北市士林區中山北路五段250號','http://az804957.vo.msecnd.net/photogym/20140610103319_室外籃球場地設~1.JPG','25.0870078311609','121.527628898621','http://www.mcu.edu.tw','(02)28824564分機2326');
insert into Court values ('東吳大學籃球場','臺北市士林區臨溪路70號','http://az804957.vo.msecnd.net/photogym/20140616101648_雙溪籃球場-1.jpg','25.095502388345','121.544685065746','http://www.scu.edu.tw/physical/','(02)28819471#5606');
insert into Court values ('復興高中田徑場','臺北市北投區復興四路70號','http://az804957.vo.msecnd.net/photogym/20140618133957_DSC000651.jpg','25.1427400142077','121.50200843811','http://www.fhsh.tp.edu.tw','(02)28914131#330');
insert into Court values ('台北海洋技術學院體育館','臺北市士林區延平北路九段212號','http://az804957.vo.msecnd.net/photogym/20140613090511_台北海院士林體育館.JPG','25.1089729587673','121.47069901228','http://www.tcmt.edu.tw','(02)28102292-2246');
insert into Court values ('復興國小活動中心','臺北市大安區仁愛里敦化南路1段262號','http://az804957.vo.msecnd.net/photogym/20140714173535_DSC_8212.JPG','25.0392347094934','121.548419237006','http://www.fhjh.tp.edu.tw','(02)27715859');
insert into Court values ('中山區花博公園新生園區游泳池(館)','臺北市中山區新生北路三段105號','http://az804957.vo.msecnd.net/photogym/20140815143040_IMG_2674.JPG','25.0686359201364','121.531475186348','http://pkl.taipei.gov.tw','(02)25850192');
insert into Court values ('萬福國小籃球場','臺北市文山區羅斯福5段170巷32號','http://az804957.vo.msecnd.net/photogym/20140725175758_IMG_5804.JPG','25.005159797735978','121.53691685196463','http://www.wfps.tp.edu.tw','(02)29353123');
insert into Court values ('達人女中籃球場','臺北市內湖區內湖路二段314號','http://az804957.vo.msecnd.net/photogym/20140610105853_操場.JPG','25.0812481033775','121.587710380554','http://www.trgsh.tp.edu.tw','(02)27956899#401');
insert into Court values ('龍門國中體育館','臺北市大安區建國南路二段269號','http://az804957.vo.msecnd.net/photogym/20140721100133_全景01.JPG','25.0236222362049','121.538370609251','http://www.lmjh.tp.edu.tw','02-27330299');
insert into Court values ('中正國小活動中心','臺北市中山區力行里龍江路62號','','25.0502026113016','121.539253592491','http://web.jjes.tp.edu.tw','(02)25070932');
insert into Court values ('復興實驗高中大禮堂(體育館)','臺北市大安區敦化南路1段262 號','http://az804957.vo.msecnd.net/photogym/20140708100641_DSC_8213.JPG','25.0393525707476','121.5479578964','http://www.fhjh.tp.edu.tw','(02)27715859#171');
insert into Court values ('桃源國中籃球場','臺北市北投區一德里中央北路4段48號','http://az804957.vo.msecnd.net/photogym/20140728091544_12.JPG','25.134595977765603','121.47705852985382','http://www.ttcjh.ntpc.edu.tw','(02)2892-9633');
insert into Court values ('臺北市立大學附設實驗國民小學活動中心','臺北市中正區黎明里公園路29號','http://az804957.vo.msecnd.net/photogym/20140721101715_IMG_0841_resized.jpg','25.0361909337525','121.515365839005','http://new.estmue.tp.edu.tw/index.php','(02)23110395');
insert into Court values ('開南商工田徑場','臺北市中正區東門里濟南路1段6號','http://az804957.vo.msecnd.net/photogym/20140618142306_11.jpg','25.0417292126936','121.521674394608','http://www.knvs.tp.edu.tw','(02)23212666');
insert into Court values ('芝山國小芝星廣場','臺北市士林區芝山里德行東路285號','http://az804957.vo.msecnd.net/photogym/20140728102230_mobile5262e80c-1e1c-40bf-806d-7305ed5b8966.jpg','25.1100572','121.5358076','http://www.zsps.tp.edu.tw','(02)28316115');
insert into Court values ('華興中學體育館','臺北市士林區芝山里仰德大道1段101號','http://az804957.vo.msecnd.net/photogym/20140715091103_IMG_20140715_090236.jpg','25.1060633826945','121.537917852402','http://www.hhhs.tp.edu.tw','02-28316834#235');
insert into Court values ('德明財經科技大學體育館','臺北市內湖區環山路一段56號','http://az804957.vo.msecnd.net/photogym/20140618143234_mobile6f5d00c2-bd45-46c4-be33-c5d988f76526.jpg','25.0867508233132','121.565238833427','http://www.takming.edu.tw','(02)26585801ex5268');
insert into Court values ('士林國小籃球場','臺北市士林區福德里大東路165號','http://az804957.vo.msecnd.net/photogym/20140728114555_DSC04422.jpg','25.0946935239746','121.524522900581','http://www.slps.tp.edu.tw','(02)28812231*222');
insert into Court values ('臺北市立大學附設實驗國民小學田徑場','臺北市中正區黎明里公園路29號','http://az804957.vo.msecnd.net/photogym/20140721111507_IMG_0862_resized.jpg','25.035901740751232','121.5157949924469','http://new.estmue.tp.edu.tw/index.php','(02)23110395');
insert into Court values ('木柵國中籃球場','臺北市文山區木柵路3段102巷12號','http://az804957.vo.msecnd.net/photogym/20140721111728_IMAG4551.jpg','24.9875361713485','121.567239761353','http://www.mcjhs.tp.edu.tw','02-29393031');
insert into Court values ('長安國中籃球場','臺北市中山區興亞里松江路70巷11號','http://az804957.vo.msecnd.net/photogym/20140728124342_7006.jpg','25.0494469061023','121.531652212143','http://www.cajh.tp.edu.tw','(02)25112382');
insert into Court values ('中山區榮星花園公園籃球場','臺北市中山區民權東路三段1號','http://az804957.vo.msecnd.net/photogym/20140818162614_IMG_2695.JPG','25.0633459528306','121.539586186409','http://pkl.taipei.gov.tw','(02)25850192');
insert into Court values ('文林國小活動中心','臺北市北投區建民里文林北路155號','http://az804957.vo.msecnd.net/photogym/20140728130509_IMG_2478.jpg','25.1060025656195','121.514164209366','http://www.wles.tp.edu.tw','(02)28234212');
insert into Court values ('臺北市士林運動中心','臺北市士林區士商路1號','http://az804957.vo.msecnd.net/photogym/20140624094002_士林運動中心全景外觀.jpg','25.0896799029981','121.521416902542','http://www.slsc-taipei.org/big5/','02-25702330#6428');
insert into Court values ('文林國小田徑場','臺北市北投區建民里文林北路155號','http://az804957.vo.msecnd.net/photogym/20140728132519_IMG_0562.jpg','25.1056746764262','121.513949632645','http://www.wles.tp.edu.tw','02-28234212#303');
insert into Court values ('桃源國小田徑場　','臺北市北投區中央北路3段40巷45號','http://az804957.vo.msecnd.net/photogym/20140728132629_DSC02706_調整大小.JPG','25.13965146325538','121.48336172103882','http://www.tyues.tp.edu.tw','(02)28941208');
insert into Court values ('修德國小操場','臺北市南港區東新街118巷86號','http://az804957.vo.msecnd.net/photogym/20140721115752_IMG_3700.JPG','25.0446695750817','121.588971018791','http://www.sdps.tp.edu.tw','(02)27880500');
insert into Court values ('誠正國中活動中心','臺北市南港區新富里富康街1巷24號','http://az804957.vo.msecnd.net/photogym/20140721115932_P1020405.JPG','25.0541530998638','121.619589507563','http://163.21.132.5','02-27828094#1510');
insert into Court values ('景美國小活動中心','臺北市文山區景行里景文街108號','http://az804957.vo.msecnd.net/photogym/20140728152035_DSC05794_1.jpg','24.9890491902515','121.539997458731','http://www.cmes.tp.edu.tw','(02)29322151*123');
insert into Court values ('景美國小籃球場','臺北市文山區景行里景文街108號','http://az804957.vo.msecnd.net/photogym/20140728152613_DSC05793_1.jpg','24.9893179102734','121.540456227979','http://www.cmes.tp.edu.tw','(02)29322151*123');
insert into Court values ('臺北市北投運動中心','臺北市北投區石牌路一段39巷100號','http://az804957.vo.msecnd.net/photogym/20140618145326_P1050700.JPG','25.1168977019917','121.509695649147','http://www.tms.taipei.gov.tw','02-25702330#6428');
insert into Court values ('萬芳高中學生活動中心','臺北市文山區興隆路3段115巷1號','http://az804957.vo.msecnd.net/photogym/20140728152804_P_20140728_150636_HDR11.jpg','25.0008581702678','121.55842602253','http://www.wfsh.tp.edu.tw','(02)22309585轉350');
insert into Court values ('博嘉國小運動場','臺北市文山區木柵路4段159巷14號之1','http://az804957.vo.msecnd.net/photogym/20140728154057_P1100164.JPG','25.0020152684298','121.575479507446','http://www.bjps.tp.edu.tw','(02)22302585');
insert into Court values ('萬芳高中田徑場','臺北市文山區興隆路3段115巷1號','http://az804957.vo.msecnd.net/photogym/20140728154117_田徑場全場01.JPG','25.00203471536461','121.55931651592255','http://www.wfsh.tp.edu.tw','(02)22309585轉350');
insert into Court values ('西松高中活動中心','臺北市松山區鵬程里健康路325巷7號西南側','http://az804957.vo.msecnd.net/photogym/20140728154331_球場.jpg','25.055005401749','121.566140055656','http://www.hssh.tp.edu.tw','(02)25286618');
insert into Court values ('信義國中田徑場','臺北市信義區松仁路158巷1號','http://az804957.vo.msecnd.net/photogym/20140728155005_SANY0272.JPG','25.02961223188975','121.56788885593414','http://www.syijh.tp.edu.tw','(02)27236771');
insert into Court values ('北安國中綜合大樓','臺北市中山區劍潭里明水路325號','http://az804957.vo.msecnd.net/photogym/20140728161220_P1070485.JPG','25.0785637007118','121.54227912426','http://www.pajh.tp.edu.tw','(02)25333888');
insert into Court values ('臺北商業大學活動中心','臺北市中正區濟南路一段321號','http://az804957.vo.msecnd.net/photogym/20140604110420_P7168495.JPG','25.0423027103963','121.526073217392','http://www.ntcb.edu.tw','(02)23226185');
insert into Court values ('瑠公國中活動中心','臺北市信義區福德街221巷15號','http://az804957.vo.msecnd.net/photogym/20140728170759_DSC06556.JPG','25.037423034109395','121.58550560474396','http://www.lkjh.tp.edu.tw','(02)27261481');
insert into Court values ('桃源國小籃球場　','臺北市北投區中央北路3段40巷45號','http://az804957.vo.msecnd.net/photogym/20140728171430_DSC02714_調整大小.JPG','25.13928481404687','121.48363932967186','http://www.tyues.tp.edu.tw','(02)28941208');
insert into Court values ('臺北商業大學籃球場','臺北市中正區濟南路一段321號','http://az804957.vo.msecnd.net/photogym/20140604111122_P7168485.JPG','25.0421277452798','121.525236368179','http://www.ntcb.edu.tw','(02)23226185');
insert into Court values ('大安國中活動中心','臺北市大安區大安路2段63號','http://az804957.vo.msecnd.net/photogym/20140729085418_IMGP5227 (3).JPG','25.0297624286306','121.546485803394','http://www.tajh.tp.edu.tw','02-27557131#132');
insert into Court values ('臺北市萬華區青年公園籃球場','臺北市萬華區水源路199號','http://az804957.vo.msecnd.net/photogym/20141002110953_IMG_20140924_111744.jpg','25.0224522981293','121.507383584976','http://www.tms.taipei.gov.tw','02-25702330#6520');
insert into Court values ('內湖國中戶外籃球場','臺北市內湖區紫陽里陽光街1號','http://az804957.vo.msecnd.net/photogym/20140729100624_籃球場1-1.jpg','25.0759812740953','121.589526236057','http://www.nhjh.tp.edu.tw','(02)27900843');
insert into Court values ('西湖國小活動中心','臺北市內湖區西湖里環山路1段25號','http://az804957.vo.msecnd.net/photogym/20140729102402_IMG_7530.JPG','25.0832765496042','121.566547751427','http://www.hhups.tp.edu.tw','(02)27971267#142');
insert into Court values ('明德國中田徑場','臺北市北投區建民里明德路50號','http://az804957.vo.msecnd.net/photogym/20140729102602_DSC01735.JPG','25.1079941699779','121.518697142601','http://www.mdjh.tp.edu.tw','02-28232539#605');
insert into Court values ('臺灣師範大學體育館','臺北市大安區和平東路一段162號','http://az804957.vo.msecnd.net/photogym/20140618152733_IMG_4028.jpg','25.0261453303833','121.527375429869','http://www.ntnu.edu.tw','02-77343176');
insert into Court values ('中山女中籃球場','臺北市中山區力行里長安東路2段141號','http://az804957.vo.msecnd.net/photogym/20140604113216_DSC09774.JPG','25.048602503303','121.538424789906','http://www.csghs.tp.edu.tw','(02)25073148');
insert into Court values ('至善國中籃球場','臺北市士林區臨溪里至善路2段360號','http://az804957.vo.msecnd.net/photogym/20140729105830_P1310665.JPG','25.1038166210572','121.556903868914','http://www.jsjh.tp.edu.tw','(02)28411350#32');
insert into Court values ('衛理女中室內球場','臺北市士林區翠山里至善路2段321號','http://az804957.vo.msecnd.net/photogym/20140704105111_室內球場1.JPG','25.1028110734373','121.552922129631','http://www.wlgsh.tp.edu.tw','(02)28411487');
insert into Court values ('萬華國中活動中心','臺北市萬華區日善里西藏路201號','http://az804957.vo.msecnd.net/photogym/20140729110257_IMG_20140729_112617.jpg','25.028761616683173','121.49847865104675','http://www.whjhs.tp.edu.tw','(02)23394567-133');
insert into Court values ('衛理女中室外球場','臺北市士林區翠山里至善路2段321號','http://az804957.vo.msecnd.net/photogym/20140704110006_室外球場1.JPG','25.1019415352547','121.551039218903','http://www.wlgsh.tp.edu.tw','(02)28411487');
insert into Court values ('東方工商籃球場','臺北市大安區信義路四段186巷8號','http://az804957.vo.msecnd.net/photogym/20140821093729_P1010186.JPG','25.032191406992563','121.55123593202006','http://www.tfvs.tp.edu.tw','(02)27554616#199');
insert into Court values ('臺北市中正運動中心','臺北市中正區信義路1段1號','http://az804957.vo.msecnd.net/photogym/20140620111105_1.jpg','25.0382031149193','121.519306004047','http://www.tpejjsports.com.tw/','02-25702330#6427');
insert into Court values ('惇敘工商籃球場','臺北市北投區泉源路221號','http://az804957.vo.msecnd.net/photogym/20140708114152_7.JPG','25.1453119988725','121.526157545886','http://www.thvs.tp.edu.tw','(02)28912630');
insert into Court values ('明德國中體育館','臺北市北投區建民里明德路50號','http://az804957.vo.msecnd.net/photogym/20140729115629_2.JPG','25.1080257439321','121.518745422363','http://www.mdjh.tp.edu.tw','02-28232539#605');
insert into Court values ('永安國小籃球場','臺北市中山區明水路397巷19弄1號','http://az804957.vo.msecnd.net/photogym/20140729120243_DSCN1249.JPG','25.07930222097945','121.54984831809998','http://web.yaes.tp.edu.tw/front/bin/home.phtml','(02)25335672');
insert into Court values ('師大附中籃球場','臺北市大安區和安里信義路3段143號','http://az804957.vo.msecnd.net/photogym/20140620111649_IMG_1502.JPG','25.0337291261519','121.539714932442','http://www.hs.ntnu.edu.tw','(02)27075215');
insert into Court values ('信義國中活動中心','臺北市信義區松仁路158巷1號','http://az804957.vo.msecnd.net/photogym/20140721185213_DSC08877-1.JPG','25.0288296661167','121.567915678024','http://www.syijh.tp.edu.tw','(02)27236771');
insert into Court values ('新民國中活動中心','臺北市北投區林泉里新民路10號','http://az804957.vo.msecnd.net/photogym/20140729121822_室內運動場 - 複製.jpg','25.1383402623387','121.506428718567','http://www.hmjh.tp.edu.tw','(02)28979001');
insert into Court values ('世新大學體育館','臺北市文山區木柵路一段17巷1號','http://az804957.vo.msecnd.net/photogym/20140604122953_室外球場s.jpg','24.9898603320731','121.545411944389','http://www.shu.edu.tw','02-22368225#3065');
insert into Court values ('臺北市萬華運動中心','臺北市萬華區西寧南路6之1號','http://az804957.vo.msecnd.net/photogym/20140618160453_IMAG6907.jpg','25.0475175282915','121.506750583649','https://whsc.cyc.org.tw/IISystem/Portal/whsc/','02-25702330#6428');
insert into Court values ('松山區民權公園籃球場','臺北市松山區富錦街359巷2弄','http://az804957.vo.msecnd.net/photogym/20140821134809_IMG_20140819_095910.jpg','25.061789264609878','121.55937820672955','http://pkl.taipei.gov.tw','(02)25850192');
insert into Court values ('興雅國中籃球場','臺北市信義區松德路168巷15號','http://az804957.vo.msecnd.net/photogym/20140729123955_mobiled90bfa96-96b8-43ab-9d4b-abde1d64b407.jpg','25.0349855533804','121.572456657887','http://www.syajh.tp.edu.tw','02-27232771#330');
insert into Court values ('新民國中室外綜合運動場','臺北市北投區林泉里新民路10號','http://az804957.vo.msecnd.net/photogym/20140729124520_室外運動場1 - 複製.jpg','25.138175147151','121.506434082985','http://www.hmjh.tp.edu.tw','(02)28979001');
insert into Court values ('臺灣警察專科學校籃球場','臺北市文山區興隆路三段 153 號','http://az804957.vo.msecnd.net/photogym/20140710163942_IMAG0962.jpg','24.9989144150612','121.560916900935','http://www.tpa.edu.tw/','(02)22308512-4');
insert into Court values ('麗湖國小活動中心','臺北市內湖區金湖路363巷8號','http://az804957.vo.msecnd.net/photogym/20140729124756_活動中心1.JPG','25.072859453307792','121.6016149520874','http://enable.lhes.tp.edu.tw/index.phtml','(02)26343888#130');
insert into Court values ('城市大學大成館','臺北市北投區學園路2號','http://az804957.vo.msecnd.net/photogym/20141022102431_大成館.jpg','25.1355002011539','121.469392776489','http://www.tpcu.edu.tw','(02)289-27154#2501');
insert into Court values ('麗湖國小操場','臺北市內湖區金湖路363巷8號','http://az804957.vo.msecnd.net/photogym/20140729130054_操場1.JPG','25.072451302761976','121.6010570526123','http://enable.lhes.tp.edu.tw/index.phtml','(02)26343888#130');
insert into Court values ('延平中學環形/直線慢跑道(非田徑場型)','臺北市大安區和安里建國南路1段275號','http://az804957.vo.msecnd.net/photogym/20140612093520_操場全景.jpg','25.0364233083288','121.538622334583','http://www.yphs.tp.edu.tw','(02)27071478');
insert into Court values ('臺灣警察專科學校體育館','臺北市文山區興隆路三段 153 號','http://az804957.vo.msecnd.net/photogym/20140710165107_IMAG0969.jpg','25.000522058695','121.560494899531','http://www.tpa.edu.tw/','(02)22308512-4');
insert into Court values ('麗山國小活動中心','臺北市內湖區港都里港華街100號','http://az804957.vo.msecnd.net/photogym/20140729135249_DSC_0465.JPG','25.0824505995088','121.572604179382','http://www.lnps.tp.edu.tw','(02)26574158轉325');
insert into Court values ('籃球場','臺北市北投區學園路2號','http://az804957.vo.msecnd.net/photogym/20141022123521_籃球場.jpg','25.1341045743984','121.469304263592','http://www.tpcu.edu.tw','(02)289-27154#2501');
insert into Court values ('康寧醫護暨管理專科學校野聲館','臺北市內湖區康寧路三段75巷137號','http://az804957.vo.msecnd.net/photogym/20140708122549_4.jpg','25.0764452889126','121.610466241837','http://www.knjc.edu.tw','(02)26321181-450');
insert into Court values ('北投區回饋設施洲美運動公園','臺北市北投區洲美街271號','http://az804957.vo.msecnd.net/photogym/20140729135729_mobile432bbacf-75bc-4279-ad69-7234b2091852.jpg','25.1096457197189','121.49972319603','http://www.ptrip.gov.tw/','02-28360050#131');
insert into Court values ('景美女中籃球場','臺北市文山區樟新里木新路3段312號','http://az804957.vo.msecnd.net/photogym/20140822094515_照片 2-1.jpg','24.9828099182112','121.555498838316','http://www.cmgsh.tp.edu.tw','(02)29368847');
insert into Court values ('舊莊國小學生活動中心','臺北市南港區舊莊里舊莊街1段100號','http://az804957.vo.msecnd.net/photogym/20140729142227_調整大小IMG_3398.JPG','25.0399260795639','121.619945168495','http://www.zzes.tp.edu.tw','(02)27821418#121');
insert into Court values ('信義國小活動中心','臺北市信義區松勤街60號','http://az804957.vo.msecnd.net/photogym/20140722093250_IMG_1294.JPG','25.03123081482577','121.56308770179749','http://www.syes.tp.edu.tw','(02)27204005');
insert into Court values ('木柵國中田徑場','臺北市文山區木柵路3段102巷12號','http://az804957.vo.msecnd.net/photogym/20140722094540_IMAG4551.jpg','24.9874486497933','121.567304134369','http://www.mcjhs.tp.edu.tw','02-29393031');
insert into Court values ('台北海洋技術學院田徑場','臺北市士林區延平北路九段212號','http://az804957.vo.msecnd.net/photogym/20140613114150_士林田徑場全景壓縮.JPG','25.1087227976137','121.471055746078','http://www.tcmt.edu.tw','(02)28102292-2246');
insert into Court values ('雙園國中體育館','臺北市萬華區和德里興義街2號','http://az804957.vo.msecnd.net/photogym/20140722094539_IMG_0630(001).jpg','25.0274249237312','121.491322517395','http://www.syjhs.tp.edu.tw','(02)23037605#137');
insert into Court values ('臺灣科技大學籃球場','臺北市大安區基隆路四段43號','http://az804957.vo.msecnd.net/photogym/20140610145546_DSC04705.JPG','25.0146356817825','121.543239355087','http://www.ntust.edu.tw','(02)27376503');
insert into Court values ('永春高中活動中心','臺北市信義區松隆里松山路654號','http://az804957.vo.msecnd.net/photogym/20140722095944_IMG_9146.JPG','25.0321834842895','121.578440666199','http://www.ycsh.tp.edu.tw','(02)27272983');
insert into Court values ('志清國小籃球場','臺北市文山區景仁里景福街21巷5號','http://az804957.vo.msecnd.net/photogym/20140722100243_IMG_2150.JPG','24.9982959855591','121.538937091827','http://www.jcps.tp.edu.tw','(02)29323875');
insert into Court values ('臺北護理健康大學室外籃球場','臺北市北投區明德路365號','http://az804957.vo.msecnd.net/photogym/20140729161849_S__4046895.jpg','25.1173032757039','121.519818305969','http://www.ntunhs.edu.tw/bin/home.php','02-28227101#2901');
insert into Court values ('十信高中籃球場','臺北市北投區北投路二段55號','http://az804957.vo.msecnd.net/photogym/20140613114932_IMG_5027.jpg','25.1330273263699','121.496574282646','http://www.shvs.tp.edu.tw','(02)28921166');
insert into Court values ('雙園國中田徑場','臺北市萬華區和德里興義街2號','http://az804957.vo.msecnd.net/photogym/20140722100427_IMG_9500(001).jpg','25.0274297844591','121.491451263428','http://www.syjhs.tp.edu.tw','(02)23037605#137');
insert into Court values ('稻江護家籃球場','臺北市中山區新生北路三段55號','http://az804957.vo.msecnd.net/photogym/20140704153313_學校全景.jpg','25.0655416906818','121.529066562653','http://www.tcnvs.tp.edu.tw','(02)25955161');
insert into Court values ('大同區迪化污水處理廠附設休閒運動公園','臺北市大同區酒泉街235號','http://az804957.vo.msecnd.net/photogym/20140729172010_IMGP2742_2.jpg','25.0737146214691','121.510264277458','http://www.sso.taipei.gov.tw/ct.asp?xItem=996002&ctNode=19804&mp=106041','02-25973183*863');
insert into Court values ('逸仙國小活動中心','臺北市北投區中心里新民路2號','http://az804957.vo.msecnd.net/photogym/20140722101210_活動中心-1.jpg','25.1379711810225','121.504926681519','http://www.ysps.tp.edu.tw','(02)28914537＃25');
insert into Court values ('內湖高工綜合球場','臺北市內湖區港墘里內湖路1段520號','http://az804957.vo.msecnd.net/photogym/20140604142835_mobile6db763e6-7966-4e68-a8e7-33e690b40aae.jpg','25.0799824330742','121.574310064316','http://www.nihs.tp.edu.tw','02-26574874#205');
insert into Court values ('富安國小操場','臺北市士林區富洲里延平北路8段135號','http://az804957.vo.msecnd.net/photogym/20140729174657_DSCN4888(003).jpg','25.1059733286316','121.481901664065','http://www.fuanps.tp.edu.tw','(02)28103192');
insert into Court values ('忠義國小籃球場','臺北市中正區中華路二段307巷17號','http://az804957.vo.msecnd.net/photogym/20160707162507_P5290490.JPG','25.0298990094017','121.505843997002','http://www.cips.tp.edu.tw','02-23038752#231');
insert into Court values ('德明財經科技大學田徑場','臺北市內湖區環山路一段56號','http://az804957.vo.msecnd.net/photogym/20140620122301_mobilefb4b27d2-400e-4b11-a062-ecf8b8def118.jpg','25.0871933233784','121.567239761353','http://www.takming.edu.tw','(02)26585801ex2672');
insert into Court values ('臺北市文山運動中心','臺北市文山區興隆路3段222號','http://az804957.vo.msecnd.net/photogym/20140620123524_167903574_m.jpg','24.99700879575491','121.5596866607666','https://wssc.cyc.org.tw/','02-25702330#6427');
insert into Court values ('東園國小籃球場','臺北市萬華區全德里東園街195號','http://az804957.vo.msecnd.net/photogym/20140722103514_藍 (1).JPG','25.0227828405883','121.49863421917','http://www.tyes.tp.edu.tw','(02)23034803');
insert into Court values ('內湖高中籃球場','臺北市內湖區紫陽里文德路218號','http://az804957.vo.msecnd.net/photogym/20140604145425_C:%5CUsers%5Cuser%5CDesktop%5C體育場所%5CIMG_2566.JPG','25.0771838219583','121.587624549866','http://www.nhsh.tp.edu.tw','(02)27977035');
insert into Court values ('大安運動中心','臺北市大安區','http://az804957.vo.msecnd.net/photogym/20140715192917_267-郭映圻-金碧輝煌.JPG','25.020533432964115','121.54577873647213','https://dasc.cyc.org.tw/IISystem/Portal/dasc/','02-25702330#6430');
insert into Court values ('民生國中活動中心','臺北市松山區新東里新東街30巷1號','http://az804957.vo.msecnd.net/photogym/20140722104631_P_20140722_084755.jpg','25.0599534633717','121.567293405533','http://newweb.msjh.tp.edu.tw/','(02)27653433');
insert into Court values ('臺北市立啟智學校田徑場(主要設施)、籃球場(次要設施)','臺北市士林區忠誠路二段207巷3號','http://az804957.vo.msecnd.net/photogym/20140716082920_IMG_1707.JPG','25.1168952734025','121.535857915878','http://www.tpmr.tp.edu.tw/releaseRedirect.do?unitID=183&pageID=3037','02-28749117#1302');
insert into Court values ('蘭雅國中活動中心','臺北市士林區三玉里忠誠路2段51號','http://az804957.vo.msecnd.net/photogym/20140722104735_DSC_8482.JPG','25.1105492051365','121.531963348389','http://163.21.26.20/enable01/','02-28329377#230');
insert into Court values ('再興中學體育館','臺北市文山區明義里興隆路4段2號','http://az804957.vo.msecnd.net/photogym/20140730122241_B.jpg','24.99045352086792','121.55897855758667','http://www.thsh.tp.edu.tw','(02)29366803分機123');
insert into Court values ('銘傳大學體育館','臺北市士林區中山北路五段250號','http://az804957.vo.msecnd.net/photogym/20140609104547_逸仙堂.jpg','25.0855988970648','121.533508300781','http://www.mcu.edu.tw','(02)28824564分機2326');
insert into Court values ('大同大學籃球場','臺北市中山區中山北路三段40號','http://az804957.vo.msecnd.net/photogym/20140620134805_DSC_7404.JPG','25.0682701107964','121.520158946514','http://www.ttu.edu.tw','(02)21822928#7519');
insert into Court values ('東湖國中活動中心','臺北市內湖區樂康里康樂街131號','http://az804957.vo.msecnd.net/photogym/20140730143017_DSC00084.jpg','25.0726699550093','121.619853973389','http://www.dhjh.tp.edu.tw','(02)26330373#634');
insert into Court values ('永建國小籃球場','臺北市文山區華興里試院路2號','http://az804957.vo.msecnd.net/photogym/20140722121529_DSC00434-1.jpg','24.987607890354276','121.54999852180481','http://www.yjps.tp.edu.tw','(02)22363855');




--建立聯賽資料--

INSERT INTO League VALUES ('世界盃',12,'2016-07-01','2016-09-30',1);
INSERT INTO League VALUES ('來一盃',12,'2016-10-01','2016-11-30',2);

--聯賽主表格--

INSERT INTO LeagueClub VALUES (1,1,1);
INSERT INTO LeagueClub VALUES (1,2,2);
INSERT INTO LeagueClub VALUES (1,3,3);
INSERT INTO LeagueClub VALUES (1,4,2);
INSERT INTO LeagueClub VALUES (1,5,3);
INSERT INTO LeagueClub VALUES (1,6,4);
INSERT INTO LeagueClub VALUES (1,7,4);
INSERT INTO LeagueClub VALUES (1,8,1);
INSERT INTO LeagueClub VALUES (1,9,4);
INSERT INTO LeagueClub VALUES (1,10,3);
INSERT INTO LeagueClub VALUES (1,11,2);
INSERT INTO LeagueClub VALUES (1,12,1);

INSERT INTO LeagueClub (leagueId,clubId) VALUES (2,1);
INSERT INTO LeagueClub (leagueId,clubId) VALUES (2,2);
INSERT INTO LeagueClub (leagueId,clubId) VALUES (2,3);
INSERT INTO LeagueClub (leagueId,clubId) VALUES (2,4);
INSERT INTO LeagueClub (leagueId,clubId) VALUES (2,5);
INSERT INTO LeagueClub (leagueId,clubId) VALUES (2,6);
INSERT INTO LeagueClub (leagueId,clubId) VALUES (2,7);
INSERT INTO LeagueClub (leagueId,clubId) VALUES (2,8);
INSERT INTO LeagueClub (leagueId,clubId) VALUES (2,9);
INSERT INTO LeagueClub (leagueId,clubId) VALUES (2,10);
INSERT INTO LeagueClub  (leagueId,clubId) VALUES (2,11);
INSERT INTO LeagueClub (leagueId,clubId) VALUES (2,12);


--單季聯賽表格--

INSERT INTO LeagueRecord VALUES(1,1,12,'2016-07-02 12:30:00',1,73,70,'50:28',1);
INSERT INTO LeagueRecord VALUES(1,2, 4,'2016-07-02 14:30:00',1,81,80,'55:28',2);
INSERT INTO LeagueRecord VALUES(1,5,10,'2016-07-03 16:30:00',1,59,70,'40:58',10);
INSERT INTO LeagueRecord VALUES(1,6, 7,'2016-07-03 18:30:00',1,64,78,'51:38',7);
INSERT INTO LeagueRecord VALUES(1,8, 1,'2016-07-10 18:30:00',2,90,63,'52:44',8);
INSERT INTO LeagueRecord VALUES(1,11,2,'2016-07-17 18:30:00',2,107,85,'53:28',11);
INSERT INTO LeagueRecord VALUES(1,3,10,'2016-07-24 18:30:00',2,66,68,'55:38',10);
INSERT INTO LeagueRecord VALUES(1,7, 9,'2016-07-31 18:30:00',2,72,64,'56:27',7);
INSERT INTO LeagueRecord VALUES(1,8, 11,'2016-08-14 18:30:00',3,95,78,'52:57',8);
INSERT INTO LeagueRecord VALUES(1,10,7,'2016-08-28 18:30:00',3,88,86,'54:22',10);
INSERT INTO LeagueRecord VALUES(1,11, 7,'2016-09-11 18:30:00',4,64,63,'57:45',11);
INSERT INTO LeagueRecord VALUES(1,8,10,'2016-09-25 18:30:00',4,88,98,'51:18',10);
