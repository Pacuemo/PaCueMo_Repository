USE MagicJack_main;
---------------------- INSERT NBA球隊假資料 ---------------------------------------------------------------------------
INSERT INTO NBATeam(teamName, teamLogoURL , start5URL ) VALUES ('亞特蘭大老鷹',	'/image/NBA_teamLogo/Hawks.png' ,		'/image/start5/Hawks.png'  );
INSERT INTO NBATeam(teamName, teamLogoURL , start5URL ) VALUES ('波士頓塞爾提克',	'/image/NBA_teamLogo/Celtics.png',		'/image/start5/Celtics.png'  );
INSERT INTO NBATeam(teamName, teamLogoURL , start5URL ) VALUES ('紐澤西籃網',		'/image/NBA_teamLogo/Nets.png',		'/image/start5/Nets.png'  );
INSERT INTO NBATeam(teamName, teamLogoURL , start5URL ) VALUES ('夏洛特黃蜂',		'/image/NBA_teamLogo/Hornets.png',		'/image/start5/Hornets.png'  );
INSERT INTO NBATeam(teamName, teamLogoURL , start5URL ) VALUES ('芝加哥公牛',		'/image/NBA_teamLogo/Bulls.png',		'/image/start5/Bulls.png'  );
INSERT INTO NBATeam(teamName, teamLogoURL , start5URL ) VALUES ('克里夫蘭騎士',	'/image/NBA_teamLogo/Cavaliers.png',	'/image/start5/Cavaliers.png'  );
INSERT INTO NBATeam(teamName, teamLogoURL , start5URL ) VALUES ('達拉斯小牛',		'/image/NBA_teamLogo/Mavericks.png',	'/image/start5/Mavericks.png'  );
INSERT INTO NBATeam(teamName, teamLogoURL , start5URL ) VALUES ('丹佛金塊',		'/image/NBA_teamLogo/Nuggets.png',		'/image/start5/Nuggets.png'  );
INSERT INTO NBATeam(teamName, teamLogoURL , start5URL ) VALUES ('底特律活塞',		'/image/NBA_teamLogo/Pistons.png',		'/image/start5/Pistons.png'  );
INSERT INTO NBATeam(teamName, teamLogoURL , start5URL ) VALUES ('金州勇士',		'/image/NBA_teamLogo/Warriors.png',		'/image/start5/Warriors.png'  );

INSERT INTO NBATeam(teamName, teamLogoURL , start5URL ) VALUES ('休士頓火箭',		'/image/NBA_teamLogo/Rockets.png',		'/image/start5/Rockets.png'  );
INSERT INTO NBATeam(teamName, teamLogoURL , start5URL ) VALUES ('印第安納溜馬',	'/image/NBA_teamLogo/Pacers.png',		'/image/start5/Pacers.png'  );
INSERT INTO NBATeam(teamName, teamLogoURL , start5URL ) VALUES ('洛杉磯快艇',		'/image/NBA_teamLogo/Clippers.png',		'/image/start5/Clippers.png'  );
INSERT INTO NBATeam(teamName, teamLogoURL , start5URL ) VALUES ('洛杉磯湖人',		'/image/NBA_teamLogo/Lakers.png',		'/image/start5/Lakers.png'  );
INSERT INTO NBATeam(teamName, teamLogoURL , start5URL ) VALUES ('曼菲斯灰熊',		'/image/NBA_teamLogo/Grizzlies.png',	'/image/start5/Grizzlies.png'  );
INSERT INTO NBATeam(teamName, teamLogoURL , start5URL ) VALUES ('邁阿密熱火',		'/image/NBA_teamLogo/Heat.png',		'/image/start5/Heat.png'  );
INSERT INTO NBATeam(teamName, teamLogoURL , start5URL ) VALUES ('密爾瓦基公鹿',	'/image/NBA_teamLogo/Bucks.png',		'/image/start5/Bucks.png'  );
INSERT INTO NBATeam(teamName, teamLogoURL , start5URL ) VALUES ('明尼蘇達灰狼',	'/image/NBA_teamLogo/Timberwolves.png',	'/image/start5/Timberwolves.png'  );
INSERT INTO NBATeam(teamName, teamLogoURL , start5URL ) VALUES ('紐澳良鵜鶘',		'/image/NBA_teamLogo/Pelicans.png',		'/image/start5/Pelicans.png'  );
INSERT INTO NBATeam(teamName, teamLogoURL , start5URL ) VALUES ('紐約尼克',		'/image/NBA_teamLogo/Knicks.png',		'/image/start5/Knicks.png'  );

INSERT INTO NBATeam(teamName, teamLogoURL , start5URL ) VALUES ('奧克拉荷馬雷霆',	'/image/NBA_teamLogo/Thunder.png',		'/image/start5/Thunder.png'  );
INSERT INTO NBATeam(teamName, teamLogoURL , start5URL ) VALUES ('奧蘭多魔術',		'/image/NBA_teamLogo/Magic.png',		'/image/start5/Magic.png'  );
INSERT INTO NBATeam(teamName, teamLogoURL , start5URL ) VALUES ('費城七六人',		'/image/NBA_teamLogo/Sixers.png',		'/image/start5/Sixers.png'  );
INSERT INTO NBATeam(teamName, teamLogoURL , start5URL ) VALUES ('鳳凰城太陽',		'/image/NBA_teamLogo/Suns.png',		'/image/start5/Suns.png'  );
INSERT INTO NBATeam(teamName, teamLogoURL , start5URL ) VALUES ('波特蘭拓荒者',	'/image/NBA_teamLogo/Blazers.png',		'/image/start5/Blazers.png'  );
INSERT INTO NBATeam(teamName, teamLogoURL , start5URL ) VALUES ('沙加緬度國王',	'/image/NBA_teamLogo/Kings.png',		'/image/start5/Kings.png'  );
INSERT INTO NBATeam(teamName, teamLogoURL , start5URL ) VALUES ('聖安東尼奧馬刺',	'/image/NBA_teamLogo/Spurs.png',		'/image/start5/Spurs.png'  );
INSERT INTO NBATeam(teamName, teamLogoURL , start5URL ) VALUES ('多倫多暴龍',		'/image/NBA_teamLogo/Raptors.png',		'/image/start5/Raptors.png'  );
INSERT INTO NBATeam(teamName, teamLogoURL , start5URL ) VALUES ('猶他爵士',		'/image/NBA_teamLogo/Jazz.png',		'/image/start5/Jazz.png'  );
INSERT INTO NBATeam(teamName, teamLogoURL , start5URL ) VALUES ('華盛頓巫師',		'/image/NBA_teamLogo/Wizards.png',		'/image/start5/Wizards.png'  );

---------------------- INSERT NBA球隊假資料 結束-----------------------------------------------------------------
-----------------------INSERT 對戰組合假資料---------------------------------------------------------------------

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-10-07 23:31' ,14 ,27 , 85 , 79 ,1288000 ,1323700 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-10-02 04:55' ,29 ,27 ,103 , 95 ,2676100 ,2426300 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-10-26 13:55' ,08 ,23 , 73 , 71 ,3102700 ,1414700 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-10-10 03:54' ,21 ,28 , 87 , 71 ,  1400 ,3429600 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-10-23 12:16' ,03 ,12 , 84 , 78 ,967500 ,3340500 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-10-27 17:06' ,10 ,01 , 97 , 92 ,3897400 ,3910700 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-10-14 16:39' ,25 ,29 , 82 , 70 ,1197500 ,1235300 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-10-08 04:20' ,28 ,04 , 87 , 72 ,3186800 ,1712400 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-10-16 09:46' ,27 ,14 , 78 , 87 ,549300 ,403800 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-10-10 05:06' ,09 ,07 , 80 , 71 ,770600 , 52000 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-10-29 08:49' ,25 ,06 , 90 , 79 ,4927700 ,3358700 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-10-14 14:53' ,26 ,15 , 76 , 78 ,442300 ,3081800 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-10-28 05:50' ,02 ,15 , 73 , 63 ,237300 ,742100 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-10-03 06:51' ,10 ,16 , 82 , 96 ,2786500 ,3298900 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-10-08 19:26' ,03 ,08 , 89 , 72 ,3491500 ,1644200 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-10-09 13:22' ,18 ,22 , 60 , 73 ,2116000 ,4465500 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-10-30 16:58' ,12 ,22 , 87 ,101 ,1042800 ,4081700 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-10-08 23:38' ,11 ,25 , 83 , 87 ,864400 ,672700 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-10-12 05:05' ,17 ,01 , 73 , 57 ,971900 ,  5200 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-10-24 00:22' ,12 ,16 , 55 , 64 ,2368600 ,336800 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-10-04 00:19' ,26 ,17 , 85 , 89 ,1700400 ,4284200 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-10-28 13:15' ,16 ,08 , 70 , 51 ,556300 ,2945500 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-10-21 02:51' ,21 ,22 , 55 , 74 ,2700600 ,1880700 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-10-13 08:12' ,04 ,05 , 99 , 89 ,3561800 ,805800 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-10-25 05:56' ,18 ,17 , 57 , 57 ,1141300 ,251500 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-10-19 18:12' ,08 ,24 , 76 , 87 ,3794800 ,4862800 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-10-22 05:20' ,25 ,17 , 62 , 64 ,3465900 ,2464700 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-10-13 09:58' ,26 ,28 , 77 , 68 , 98000 ,4688500 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-10-06 10:55' ,04 ,25 ,109 , 92 ,4713700 ,2611700 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-10-06 03:25' ,22 ,30 , 54 , 63 ,2556700 ,1392900 )
------------------------------------------

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-11-11 18:04' ,25 ,27 ,105 ,107 ,4643800 ,4042300 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-11-14 02:07' ,09 ,21 , 98 , 87 ,825300 ,2260400 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-11-17 21:24' ,28 ,02 , 70 , 55 ,1756600 ,1166600 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-11-08 08:47' ,26 ,09 , 88 , 85 ,554300 ,398800 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-11-02 04:58' ,02 ,13 , 60 , 75 ,4961400 ,1250700 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-11-01 12:28' ,27 ,09 , 64 , 57 ,2052700 ,271500 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-11-06 04:16' ,14 ,20 , 70 , 60 ,4433900 ,785800 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-11-01 04:45' ,06 ,20 , 88 , 82 ,4640200 ,1999400 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-11-04 00:45' ,07 ,21 , 74 , 77 ,1046600 ,4629800 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-11-12 21:55' ,13 ,20 , 97 , 97 ,4935400 ,1869900 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-11-17 02:28' ,02 ,17 , 76 , 72 ,873400 ,1973200 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-11-12 07:22' ,24 ,23 , 64 , 50 ,3388000 ,3396800 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-11-28 11:20' ,14 ,06 , 57 , 76 , 27600 ,3958200 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-11-07 18:28' ,22 ,07 , 64 , 54 ,1892600 ,1592900 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-11-05 01:41' ,16 ,24 , 73 , 69 ,4637600 ,2937000 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-11-16 02:31' ,14 ,23 ,104 , 96 ,1835000 ,2441900 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-11-06 10:53' ,06 ,26 , 71 , 74 ,3413300 ,1542700 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-11-02 20:33' ,23 ,26 , 80 , 94 ,2278400 ,4909300 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-11-08 07:11' ,13 ,26 , 90 , 96 ,2311500 ,1222600 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-11-27 10:51' ,26 ,24 , 83 , 87 ,1344300 ,4062000 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-11-20 16:26' ,28 ,04 ,100 , 86 ,4269900 ,264400 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-11-12 08:30' ,14 ,21 , 91 ,107 ,3402400 ,4790400 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-11-14 05:49' ,25 ,10 ,100 ,109 ,2627200 ,4909700 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-11-20 23:24' ,04 ,12 ,104 ,101 ,4245400 ,1161800 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-11-10 12:50' ,28 ,17 , 84 , 77 ,2434700 ,1344000 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-11-06 16:22' ,26 ,27 , 96 , 80 ,258200 ,1455600 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-11-06 19:51' ,05 ,27 , 85 , 81 ,308800 ,4049300 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-11-03 04:02' ,22 ,25 , 97 , 86 ,1199800 ,3557200 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-11-29 03:21' ,21 ,01 , 56 , 53 ,1277600 ,4685400 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-11-23 10:53' ,17 ,02 , 85 , 91 ,1839100 ,554700 )
------------------------------------------

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-12-18 02:42' ,13 ,30 , 75 , 77 ,1622800 ,279200 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-12-11 16:10' ,02 ,10 , 67 , 78 ,4298500 ,609700 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-12-16 00:05' ,19 ,18 , 80 , 70 ,1577300 ,2339700 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-12-21 09:10' ,24 ,01 , 87 ,102 ,4993700 ,3014900 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-12-14 22:26' ,27 ,18 , 91 , 93 ,869500 ,2365500 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-12-21 18:09' ,14 ,01 , 72 , 79 ,478300 ,3332900 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-12-01 20:01' ,25 ,24 , 63 , 58 ,3516900 ,3707100 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-12-03 13:52' ,23 ,01 , 53 , 51 ,4001300 ,469000 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-12-16 01:33' ,02 ,27 ,105 , 87 ,3311700 ,3542500 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-12-18 12:13' ,29 ,27 , 84 , 96 ,4241700 ,1183100 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-12-14 14:55' ,05 ,03 , 83 , 84 ,1154900 ,4062600 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-12-05 14:03' ,17 ,30 , 70 , 55 ,2642400 ,3025300 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-12-01 18:46' ,18 ,08 , 97 , 95 ,2125100 ,1393600 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-12-18 05:06' ,02 ,12 , 87 , 68 ,4399600 ,2304100 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-12-16 10:17' ,15 ,20 , 61 , 62 ,3262700 ,2985400 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-12-29 06:29' ,29 ,20 , 61 , 57 ,4669100 ,1955700 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-12-05 08:51' ,05 ,06 , 51 , 61 ,2455000 ,3186100 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-12-20 03:34' ,26 ,01 , 88 , 80 ,4638700 ,518300 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-12-12 10:05' ,05 ,18 , 69 , 60 ,1070600 ,3114500 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-12-30 01:59' ,03 ,23 , 69 , 85 ,4090200 ,2502600 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-12-29 17:55' ,06 ,04 , 76 , 79 ,2742800 ,2396400 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-12-25 15:12' ,28 ,17 , 51 , 59 ,4256200 ,2467000 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-12-30 18:08' ,06 ,05 , 64 , 62 ,4709700 ,4469100 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-12-08 10:25' ,08 ,11 , 77 , 93 ,347900 ,1728800 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-12-30 16:31' ,07 ,27 , 54 , 57 ,2931400 ,765000 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-12-07 00:00' ,14 ,28 , 74 , 83 ,3838000 ,3975700 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-12-16 12:56' ,20 ,12 , 91 , 95 ,2451700 ,704800 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-12-08 09:42' ,01 ,13 , 50 , 52 ,3749000 ,2170700 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-12-16 07:07' ,19 ,24 , 78 , 69 ,1194400 ,1290500 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2015-12-12 10:49' ,06 ,19 , 93 , 94 ,2356400 ,1037600 )
------------------------------------------

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-01-19 04:25' ,23 ,05 ,104 , 90 ,2141400 ,114500 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-01-28 10:54' ,07 ,12 , 57 , 58 ,1804700 ,177000 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-01-25 18:36' ,09 ,22 , 83 , 79 ,1264800 ,1001900 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-01-23 03:53' ,15 ,07 , 88 , 72 ,4767900 ,4443800 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-01-12 15:20' ,19 ,14 , 97 , 83 ,3805100 ,1265000 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-01-22 01:44' ,02 ,10 , 69 , 74 ,4267500 ,688100 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-01-08 22:42' ,16 ,10 , 85 , 90 ,3753400 ,248500 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-01-22 20:13' ,25 ,05 , 99 , 89 ,4767100 ,4819600 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-01-06 15:55' ,17 ,16 , 51 , 54 ,1540500 ,1806400 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-01-22 03:18' ,17 ,01 , 75 , 58 ,4624900 ,897800 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-01-17 07:09' ,12 ,09 , 78 , 75 ,2877100 ,3673200 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-01-08 22:30' ,13 ,26 , 94 , 91 ,100500 ,4446700 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-01-28 01:41' ,04 ,24 , 50 , 50 ,804300 ,3385300 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-01-03 17:34' ,03 ,10 ,106 , 87 ,4205100 ,3253800 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-01-09 07:22' ,18 ,03 , 84 , 82 ,2340100 ,2111800 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-01-13 20:44' ,17 ,16 , 63 , 52 ,2671300 , 11600 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-01-05 17:05' ,24 ,30 , 74 , 78 , 18600 ,3503600 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-01-29 11:20' ,12 ,22 , 52 , 53 ,1374500 ,4768100 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-01-05 17:47' ,06 ,30 , 66 , 69 ,582000 ,4587600 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-01-14 22:17' ,24 ,05 ,107 , 99 ,4776800 ,2494500 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-01-17 05:12' ,16 ,14 ,106 ,101 ,3400200 ,116000 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-01-29 01:42' ,14 ,09 , 90 , 73 ,2705300 ,3719300 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-01-29 22:11' ,14 ,27 , 96 , 90 ,1177100 ,3038600 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-01-06 23:43' ,26 ,13 , 70 , 77 ,180400 ,895000 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-01-11 05:58' ,17 ,29 ,105 , 93 ,3652100 ,4955700 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-01-19 05:07' ,04 ,23 , 96 , 80 ,2749100 ,3497500 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-01-02 13:41' ,28 ,11 , 94 , 99 ,4444800 ,4619700 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-01-13 16:05' ,12 ,10 , 74 , 87 ,137300 ,3334100 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-01-04 13:46' ,11 ,02 , 65 , 80 ,1524400 ,1751200 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-01-30 07:47' ,05 ,13 , 62 , 50 ,3705900 ,1944800 )
------------------------------------------

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-02-05 20:50' ,02 ,08 , 83 , 69 ,363100 ,1275800 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-02-20 20:43' ,06 ,22 , 75 , 58 ,2457800 ,514500 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-02-29 19:25' ,14 ,23 ,101 , 90 ,1920600 ,3180000 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-02-21 00:00' ,28 ,18 , 66 , 64 ,3716100 ,4954200 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-02-26 10:21' ,21 ,04 ,105 , 99 ,4430200 ,869300 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-02-20 06:02' ,07 ,26 , 92 , 76 ,1273400 ,1144300 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-02-10 21:36' ,19 ,15 , 82 , 81 ,2255600 ,3454300 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-02-05 23:17' ,22 ,11 , 80 , 86 ,2366300 ,3310100 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-02-20 07:06' ,25 ,13 , 96 , 79 ,625700 ,2136500 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-02-09 08:00' ,19 ,18 , 66 , 57 ,2303800 ,3796700 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-02-26 17:13' ,07 ,15 , 89 , 99 ,1696100 ,1194500 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-02-18 10:23' ,27 ,17 , 65 , 69 , 69200 ,3654800 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-02-26 08:46' ,06 ,12 , 74 , 58 ,3552700 ,4785000 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-02-11 17:35' ,12 ,16 , 70 , 63 ,3809100 ,4258400 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-02-06 15:27' ,10 ,24 , 50 , 55 ,2284400 ,2842200 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-02-29 23:59' ,03 ,29 , 88 ,104 ,4292300 ,4706900 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-02-23 20:59' ,29 ,10 , 54 , 67 ,4708300 ,4147200 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-02-10 01:33' ,19 ,09 , 90 , 74 ,2028300 ,4447100 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-02-24 02:58' ,20 ,04 , 68 , 64 ,1020500 ,1114900 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-02-29 14:40' ,09 ,17 , 69 , 80 ,1190100 ,1310000 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-02-06 11:20' ,05 ,14 , 63 , 73 ,2565400 ,1067100 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-02-15 23:57' ,20 ,23 , 71 , 54 ,3953800 ,326700 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-02-17 13:29' ,09 ,14 , 62 , 56 ,3569400 ,2896900 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-02-22 14:37' ,26 ,24 , 77 , 81 ,4603400 ,2575500 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-02-08 12:16' ,29 ,13 , 87 , 69 ,4843500 ,750500 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-02-09 11:41' ,24 ,30 , 89 ,102 ,1157600 ,128800 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-02-04 13:16' ,27 ,21 ,101 ,108 ,3393200 ,3151500 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-02-14 09:55' ,15 ,20 , 97 , 93 ,2234700 ,248300 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-02-01 00:29' ,29 ,25 , 88 , 79 ,4965700 ,4666000 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-02-18 13:50' ,10 ,13 , 73 , 73 ,2596400 ,3352100 )
------------------------------------------

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-03-06 03:56' ,30 ,22 , 91 , 92 ,375800 ,2960000 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-03-06 17:34' ,03 ,09 , 71 , 72 ,3420100 ,1583900 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-03-26 18:00' ,15 ,01 ,103 ,105 ,2452100 ,1320100 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-03-13 13:41' ,01 ,26 , 67 , 61 ,2584600 ,2447000 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-03-04 23:59' ,05 ,22 , 61 , 76 ,3697000 ,3407300 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-03-15 14:12' ,11 ,23 , 82 , 83 ,1788100 ,1210700 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-03-11 18:30' ,04 ,26 , 70 , 71 ,4256700 ,3963200 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-03-04 08:25' ,25 ,04 ,103 ,108 ,1731000 ,1092600 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-03-26 00:37' ,04 ,23 , 77 , 76 ,2492700 ,3001100 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-03-11 02:12' ,05 ,13 , 86 , 88 ,2574700 ,2674100 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-03-09 16:21' ,02 ,14 , 86 , 85 ,2893700 ,1724900 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-03-11 22:17' ,02 ,21 ,101 , 89 ,1812500 ,4231400 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-03-10 11:10' ,02 ,03 , 87 , 77 , 93400 ,1727700 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-03-04 03:12' ,22 ,02 ,107 , 95 ,3883400 ,3857500 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-03-16 11:16' ,26 ,10 , 54 , 73 ,2383800 ,3005300 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-03-24 20:39' ,14 ,04 , 59 , 67 ,4685700 ,312700 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-03-23 15:54' ,02 ,24 , 57 , 70 ,4985500 ,2896700 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-03-19 09:53' ,19 ,06 , 70 , 51 ,3114400 ,3312700 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-03-23 03:34' ,24 ,02 , 70 , 65 ,3668000 ,782000 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-03-04 20:02' ,14 ,13 , 77 , 88 ,4981900 ,971600 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-03-19 01:54' ,16 ,17 , 92 , 78 ,4122700 ,4449200 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-03-05 21:36' ,01 ,30 , 55 , 74 ,324800 ,659200 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-03-22 14:42' ,03 ,02 , 92 , 95 ,1884900 ,2957500 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-03-10 01:10' ,24 ,02 , 78 , 93 ,1435400 ,4855100 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-03-11 02:04' ,17 ,30 , 62 , 65 ,2507800 ,2745100 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-03-05 16:03' ,19 ,04 , 78 , 75 ,203300 ,3265600 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-03-29 01:55' ,12 ,03 , 67 , 68 ,2074200 ,2367300 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-03-12 20:36' ,28 ,19 , 65 , 70 ,2654100 ,4815500 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-03-24 10:18' ,28 ,17 , 55 , 58 ,2586100 ,3453800 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-03-26 11:21' ,27 ,23 , 60 , 70 ,1346900 ,2440000 )
------------------------------------------

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-04-10 22:28' ,26 ,16 , 67 , 59 ,2776100 ,2423800 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-04-15 08:08' ,19 ,10 , 53 , 60 ,2242800 ,2885800 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-04-12 12:08' ,10 ,27 , 66 , 84 ,1322800 ,3220600 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-04-12 01:57' ,22 ,21 ,104 , 88 ,3457000 ,3869900 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-04-13 15:24' ,23 ,11 ,104 ,102 ,1659500 ,4712200 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-04-05 16:12' ,21 ,01 , 78 , 76 ,3286300 ,566400 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-04-11 14:15' ,02 ,27 , 61 , 61 ,4463100 ,2843800 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-04-05 11:12' ,30 ,15 ,108 , 92 ,3902100 ,4495800 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-04-01 22:04' ,11 ,19 ,106 ,101 ,  2400 ,3905100 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-04-26 08:07' ,25 ,13 , 68 , 80 ,1332100 ,1772600 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-04-05 19:04' ,06 ,23 , 88 , 98 ,840700 ,2327400 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-04-08 04:15' ,28 ,19 , 69 , 74 ,3608400 ,4790300 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-04-01 12:11' ,03 ,30 , 77 , 67 ,4788500 ,4127200 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-04-11 19:32' ,28 ,10 , 78 , 60 ,1654100 ,2727100 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-04-14 14:53' ,23 ,14 , 72 , 64 ,1456200 ,844700 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-04-05 23:50' ,04 ,08 , 95 , 89 ,2165700 ,1605300 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-04-28 21:58' ,09 ,03 , 67 , 69 ,733400 ,1539200 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-04-01 01:27' ,23 ,13 , 91 , 87 ,4925200 ,3659500 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-04-03 02:08' ,24 ,13 , 99 , 92 ,1234000 ,2406500 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-04-28 12:34' ,07 ,05 , 81 , 62 ,228400 ,2246400 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-04-30 13:26' ,17 ,25 , 70 , 77 ,3181300 ,224500 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-04-01 00:22' ,14 ,10 , 82 , 72 ,3002000 ,4109900 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-04-03 05:29' ,13 ,20 , 65 , 68 ,362700 ,634000 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-04-09 03:37' ,01 ,12 , 87 ,105 ,223700 ,1039800 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-04-06 22:15' ,03 ,23 , 74 , 74 ,1746100 ,4578900 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-04-04 03:40' ,05 ,03 , 62 , 70 ,4245000 ,3885900 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-04-17 21:33' ,14 ,21 , 66 , 50 ,3899200 ,3664300 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-04-13 06:54' ,04 ,07 , 79 , 63 ,398900 ,1978900 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-04-22 05:13' ,01 ,13 , 56 , 68 ,3513300 ,3834300 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-04-20 05:54' ,28 ,22 , 75 , 90 ,1402900 ,2416100 )
------------------------------------------

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-05-25 17:10' ,17 ,18 , 60 , 53 ,3369400 ,3285100 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-05-28 14:28' ,18 ,08 ,105 , 86 ,2104200 ,  6100 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-05-30 18:43' ,25 ,05 , 78 , 71 ,4505100 , 83300 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-05-24 05:56' ,24 ,08 , 96 , 92 ,4223600 ,914500 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-05-08 19:25' ,08 ,26 , 66 , 63 ,595800 ,798700 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-05-27 10:36' ,28 ,06 , 80 , 71 ,1624500 ,1968600 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-05-06 02:02' ,04 ,25 , 82 , 90 ,3827400 ,3457000 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-05-02 17:40' ,14 ,29 ,109 , 94 ,2690900 ,4625300 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-05-05 02:20' ,03 ,24 , 64 , 57 ,2043000 ,4273400 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-05-20 07:39' ,03 ,24 , 86 , 85 ,3179200 ,4224200 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-05-02 16:23' ,14 ,29 ,101 , 82 ,1745100 ,705300 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-05-28 09:39' ,26 ,16 , 96 , 82 ,480200 ,4404300 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-05-22 06:16' ,24 ,01 , 76 , 90 ,1354900 ,1596900 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-05-10 14:30' ,12 ,04 , 93 , 95 ,4061500 ,4265200 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-05-10 16:57' ,08 ,22 , 98 ,100 ,3551500 ,2241000 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-05-20 08:28' ,27 ,19 ,107 ,105 ,2342300 ,2671900 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-05-19 16:35' ,21 ,13 , 71 , 68 ,350400 ,681100 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-05-24 15:09' ,19 ,26 , 68 , 58 ,3242500 ,4988700 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-05-15 08:12' ,06 ,09 , 69 , 68 ,2965500 ,3004900 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-05-05 15:26' ,06 ,21 , 59 , 57 ,2854700 ,3576900 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-05-11 03:12' ,07 ,05 , 59 , 57 , 45100 ,4733500 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-05-13 07:29' ,18 ,09 ,103 , 89 ,4903800 ,3651900 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-05-06 01:55' ,14 ,10 , 77 , 77 ,1929900 ,1352300 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-05-27 00:32' ,17 ,07 , 98 , 93 ,490200 ,3976800 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-05-25 22:09' ,09 ,29 , 86 ,102 ,1335700 ,3210400 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-05-12 01:08' ,10 ,23 , 81 , 87 ,245600 ,3735800 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-05-03 19:28' ,17 ,16 , 70 , 85 ,1987600 ,1981200 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-05-17 16:48' ,13 ,11 , 85 , 89 ,4226100 ,2764600 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-05-27 14:14' ,28 ,15 , 73 , 82 ,3451100 ,1059200 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-05-13 06:11' ,22 ,06 ,100 , 97 ,3286900 ,2173500 )
------------------------------------------

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-06-09 18:37' ,04 ,22 , 74 , 73 ,794300 ,3192800 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-06-14 06:07' ,08 ,03 , 66 , 66 ,2332600 ,4142800 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-06-22 12:33' ,21 ,06 , 57 , 53 ,3205400 ,1158000 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-06-09 22:58' ,28 ,25 , 69 , 79 , 67400 ,4000700 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-06-19 19:06' ,08 ,10 , 73 , 81 ,3781000 ,3500600 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-06-03 07:33' ,01 ,12 , 69 , 51 ,2572900 ,3181400 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-06-19 12:30' ,01 ,03 ,104 , 86 ,773600 ,2786400 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-06-05 09:06' ,07 ,13 , 61 , 73 ,619200 ,4152000 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-06-14 13:54' ,23 ,12 , 62 , 65 ,906600 ,113500 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-06-24 10:17' ,13 ,27 , 75 , 74 ,3066900 ,3465100 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-06-29 06:16' ,14 ,07 ,109 , 93 ,2663600 ,2773600 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-06-06 05:12' ,22 ,01 , 58 , 56 ,3025000 ,1195800 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-06-24 11:28' ,24 ,18 ,105 , 96 ,4494200 , 61900 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-06-14 21:07' ,20 ,22 ,103 , 87 ,2504800 ,978800 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-06-11 01:28' ,12 ,24 , 96 ,103 ,4068800 ,4404300 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-06-10 08:27' ,25 ,22 , 80 , 77 ,2030600 ,3347800 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-06-09 15:46' ,18 ,24 , 51 , 55 ,2690500 ,754000 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-06-05 18:19' ,21 ,20 , 92 , 85 ,3569300 ,569400 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-06-21 14:05' ,24 ,23 , 62 , 53 ,3584100 ,979400 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-06-20 19:44' ,09 ,28 , 94 , 77 ,3802300 ,3284000 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-06-28 05:14' ,27 ,25 , 71 , 56 ,3166500 ,2225700 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-06-18 00:41' ,11 ,04 , 69 , 87 ,3876100 ,2138800 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-06-10 17:39' ,26 ,30 , 91 ,109 ,1162200 ,1382800 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-06-06 00:53' ,13 ,16 , 96 , 98 ,3604000 ,4408000 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-06-25 16:03' ,03 ,14 , 98 , 94 ,500400 ,3055000 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-06-18 10:59' ,28 ,12 , 84 ,103 ,3254300 ,422200 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-06-20 01:34' ,17 ,30 , 75 , 66 ,3768400 ,2876500 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-06-29 19:50' ,02 ,24 , 51 , 60 ,511400 ,4891400 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-06-17 14:49' ,17 ,22 , 86 , 88 ,4459500 ,4558600 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-06-13 20:22' ,10 ,02 , 76 , 86 ,2433100 ,3882300 )
------------------------------------------

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-07-14 12:37' ,19 ,28 , 76 , 69 ,1218600 ,4888100 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-07-14 09:06' ,15 ,21 , 92 , 91 ,518200 ,2685500 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-07-08 06:54' ,30 ,26 , 90 , 82 ,3001200 ,3754000 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-07-08 00:49' ,17 ,22 ,105 ,101 ,1682100 ,1748100 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-07-15 23:39' ,09 ,30 , 80 , 87 , 33300 ,906400 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-07-05 21:59' ,25 ,08 , 57 , 53 ,2442700 ,2453300 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-07-08 01:00' ,29 ,16 , 71 , 73 ,4202800 ,2931700 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-07-09 21:23' ,15 ,11 , 94 , 94 ,1330700 ,2459900 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-07-15 20:04' ,10 ,07 , 56 , 70 ,1583700 ,3687400 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-07-18 13:00' ,11 ,17 , 94 ,105 ,1596900 ,3096900 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-07-09 07:11' ,03 ,20 , 52 , 69 ,4231300 ,1053600 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-07-28 17:08' ,26 ,19 , 91 , 93 ,1979900 ,2620100 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-07-12 01:08' ,15 ,14 , 77 , 68 ,4599200 ,1676700 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-07-06 02:57' ,22 ,25 , 85 ,103 , 53900 ,3108900 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-07-01 10:15' ,06 ,05 , 81 , 70 ,2231200 ,1927200 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-07-02 12:51' ,09 ,07 , 73 , 81 ,1110900 ,3286000 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-07-08 02:37' ,13 ,08 , 84 , 90 ,465200 ,3367100 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-07-24 02:58' ,08 ,15 , 95 , 89 ,3946700 ,2676700 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-07-20 07:00' ,16 ,06 , 82 , 80 ,3631400 ,2833300 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-07-22 22:40' ,15 ,27 , 61 , 80 ,3338800 ,4371100 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-07-14 00:48' ,01 ,11 ,101 , 99 ,2819700 ,2891600 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-07-23 15:46' ,23 ,03 , 59 , 54 ,4281000 ,2559300 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-07-10 19:33' ,15 ,02 , 70 , 82 ,3610400 ,2472700 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-07-01 19:58' ,10 ,13 , 65 , 75 ,220700 ,2595500 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-07-17 14:41' ,09 ,05 , 98 , 90 ,268400 ,1560100 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-07-29 17:57' ,13 ,17 , 97 , 90 ,1345300 ,3341700 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-07-08 05:07' ,26 ,03 , 61 , 73 ,1318200 ,594500 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-07-01 04:58' ,28 ,30 , 92 , 79 ,2306200 ,2406000 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-07-29 14:34' ,22 ,14 , 60 , 69 ,4264000 ,889400 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-07-11 02:05' ,16 ,17 , 84 , 77 ,1644400 ,1731700 )
----
INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-09-11 11:05' ,5 ,6 , 45 , 67 ,150000 ,140000 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-09-11 05:25' ,7 ,1 , 65 , 24 ,5600 ,6800 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-09-11 06:17' ,25 ,6 , 68 , 35 ,7700 ,9800 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-09-11 12:35' ,24 ,4 , 78 , 66 ,10000 ,1500 )

INSERT INTO BattleSet (  battleDateTime , homeId , awayId , homeScore , awayScore , homebet , awaybet )
VALUES( '2016-09-11 08:47' ,17 ,28 , 58 , 45 ,3500 ,8000 )
------------------------------------------
-- 共 300 場比賽 --
------對戰組合  本日--------------------------------------------------------------------------------------------
INSERT INTO BattleSet (  battleDateTime, homeId,awayId, homeScore, awayScore,homebet, awaybet )
VALUES   (DateAdd(mi,-10,GETDATE()),1,16,66,58,2000,6000);

INSERT INTO BattleSet (  battleDateTime, homeId,awayId, homeScore, awayScore,homebet, awaybet )
VALUES   (DateAdd(mi,-26,GETDATE()),2,17,74,56,2300,1200);

INSERT INTO BattleSet (  battleDateTime, homeId,awayId, homeScore, awayScore,homebet, awaybet )
VALUES   (DateAdd(mi,-33,GETDATE()),3,18,77,64,3500,3300);

INSERT INTO BattleSet (  battleDateTime, homeId,awayId, homeScore, awayScore,homebet, awaybet )
VALUES   (DateAdd(mi,-41,GETDATE()),4,19,87,82,9700,10000);

INSERT INTO BattleSet (  battleDateTime, homeId,awayId, homeScore, awayScore,homebet, awaybet )
VALUES   (DateAdd(mi,-51,GETDATE()),5,20,48,68,4500,7400);

INSERT INTO BattleSet (  battleDateTime, homeId,awayId, homeScore, awayScore,homebet, awaybet )
VALUES   (DateAdd(mi,-70,GETDATE()),6,21,79,99,2900,2700);

INSERT INTO BattleSet (  battleDateTime, homeId,awayId, homeScore, awayScore,homebet, awaybet )
VALUES   (DateAdd(mi,-108,GETDATE()), 7,21,58,59,1500,7100);

INSERT INTO BattleSet (  battleDateTime, homeId,awayId, homeScore, awayScore,homebet, awaybet )
VALUES   (DateAdd(mi,-136,GETDATE()) , 8,22,61,71,3300,3600);
-----------------------
-- 今天尚未開始的比賽 --
-----------------------
INSERT INTO BattleSet (  battleDateTime, homeId,awayId, homeScore, awayScore,homebet, awaybet )
VALUES   (DateAdd(mi,59,GETDATE()), 6,18,0,0,5000,6500);

INSERT INTO BattleSet (  battleDateTime, homeId,awayId, homeScore, awayScore,homebet, awaybet )
VALUES   (DateAdd(mi,52,GETDATE()), 9,23,0,0,2000,6000);

INSERT INTO BattleSet (  battleDateTime, homeId,awayId, homeScore, awayScore,homebet, awaybet )
VALUES   (DateAdd(mi,300,GETDATE()),10,24,0,0,6500,6000);

INSERT INTO BattleSet (  battleDateTime, homeId,awayId, homeScore, awayScore,homebet, awaybet )
VALUES   (DateAdd(mi,251,GETDATE()),11,25,0,0,7700,8300);

INSERT INTO BattleSet (  battleDateTime, homeId,awayId, homeScore, awayScore,homebet, awaybet )
VALUES   (DateAdd(mi,240,GETDATE()),12,26,0,0,9900,1200);

INSERT INTO BattleSet (  battleDateTime, homeId,awayId, homeScore, awayScore,homebet, awaybet )
VALUES   (DateAdd(mi,391,GETDATE()),13,27,0,0,25000,14000);

INSERT INTO BattleSet (  battleDateTime, homeId,awayId, homeScore, awayScore,homebet, awaybet )
VALUES   (DateAdd(mi,137,GETDATE()),14,28,0,0,35000,12000);

INSERT INTO BattleSet (  battleDateTime, homeId,awayId, homeScore, awayScore,homebet, awaybet )
VALUES   (DateAdd(mi,417,GETDATE()),15,29,0,0,10000,2300);

--------------------------- GambleOrder 假資料 -----------------------
INSERT INTO GambleOrder VALUES ('3EA1ADB7-F37B-4DAE-8283-13EA6D242DAC', 1,200,5000 );                     
INSERT INTO GambleOrder VALUES ('8DDA0CF6-A937-46A7-BA01-0292BC2FD3D7', 315, 300,0 ); 
INSERT INTO GambleOrder VALUES ('5DAE7000-D1B7-4319-A388-80323B24DD38', 9, 100,700); 
INSERT INTO GambleOrder VALUES ('82BED47C-C571-4737-AE9A-211C71CB1A12',1,0,1200 ); 
INSERT INTO GambleOrder VALUES ('F1DA8A66-CD7C-4FAF-9268-180DF2375DA2', 7, 100, 600 ); 
INSERT INTO GambleOrder VALUES ('10CFF0EF-737F-4369-9687-0EE4FA0547AB',10, 1000, 0 ); 
INSERT INTO GambleOrder VALUES ('747420A4-8B21-4065-A53B-4569A4490E16', 2, 100, 0 ); 
INSERT INTO GambleOrder VALUES ('458578DD-764E-4A2D-B4A2-6F2FBC60E867', 315, 200, 900 ); 
INSERT INTO GambleOrder VALUES ('90ACD66E-29E0-40BF-A86A-572F6D877E02', 3, 100, 2000 ); 
INSERT INTO GambleOrder VALUES ('30A4DCC0-A726-4A30-B118-1059051C2678', 1, 300, 1000 );
INSERT INTO GambleOrder VALUES ('125EF6B7-98FE-4DF5-B755-001CD99B4648', 315, 1800, 0 );                     
INSERT INTO GambleOrder VALUES ('128F57E7-0266-4EBA-B0C4-019D163312BE', 275, 0, 1000); 
INSERT INTO GambleOrder VALUES ('8DDA0CF6-A937-46A7-BA01-0292BC2FD3D7', 315, 100, 1300 ); 
INSERT INTO GambleOrder VALUES ('ED7D55A0-920B-4392-83E8-04C02C16B68A', 12, 700, 0 ); 
INSERT INTO GambleOrder VALUES ('7F0DE280-D5E1-4FF2-B600-0654B97C550C', 7, 100, 4200 ); 
INSERT INTO GambleOrder VALUES ('7ADCCF6D-47EE-4373-B9E2-076DD075D099',105, 1000, 0 ); 
INSERT INTO GambleOrder VALUES ('AE799EFE-4278-4E6D-B4CD-0789744302E5', 315, 300, 100 ); 
INSERT INTO GambleOrder VALUES ('A46BA10D-E584-4B12-A0F0-09BA011F81C6', 315, 0, 1600 ); 
INSERT INTO GambleOrder VALUES ('5C9C24C2-BF00-427F-B17E-0A693532E697', 3, 100, 100 ); 
INSERT INTO GambleOrder VALUES ('7D1D490A-5D0E-4CC7-BB7E-0B94B71696E0', 315, 300, 500 );
INSERT INTO GambleOrder VALUES ('16F3D7E4-5BC3-4372-884E-FF3EA13B7E7E', 308,200,0 );                     
INSERT INTO GambleOrder VALUES ('54FA9A0F-7CD1-460F-908E-9C1547A261DE', 315, 300,500 ); 
INSERT INTO GambleOrder VALUES ('3E833283-4520-48F8-A273-8D59252DE154', 315, 100,700); 
INSERT INTO GambleOrder VALUES ('E42131F7-72CC-4D90-8555-6DA1146E768B',1,700,1200 ); 
INSERT INTO GambleOrder VALUES ('DF86ADBB-F1F5-49F8-A579-3800875B7292', 308, 100, 600 ); 
INSERT INTO GambleOrder VALUES ('E42131F7-72CC-4D90-8555-6DA1146E768B',318, 1000, 0 ); 
INSERT INTO GambleOrder VALUES ('46D93FD7-B70E-46B2-9954-6627B7E758A1', 315, 100, 0 ); 
INSERT INTO GambleOrder VALUES ('5DAE7000-D1B7-4319-A388-80323B24DD38', 315, 200, 900 ); 
INSERT INTO GambleOrder VALUES ('90ACD66E-29E0-40BF-A86A-572F6D877E02', 308, 0, 2000 ); 
INSERT INTO GambleOrder VALUES ('30A4DCC0-A726-4A30-B118-1059051C2678', 306, 300, 1000 );
INSERT INTO GambleOrder VALUES ('5DAE7000-D1B7-4319-A388-80323B24DD38', 310, 1800, 0 );                     
INSERT INTO GambleOrder VALUES ('128F57E7-0266-4EBA-B0C4-019D163312BE', 314, 300, 1000); 
INSERT INTO GambleOrder VALUES ('16F3D7E4-5BC3-4372-884E-FF3EA13B7E7E', 307, 100, 100 ); 
INSERT INTO GambleOrder VALUES ('C52DA173-1793-4192-A836-C56BE3E14AFE', 313, 700, 0 ); 
INSERT INTO GambleOrder VALUES ('B96614FD-3797-4686-BF7A-9C9952D38442', 307, 0, 4000 ); 
INSERT INTO GambleOrder VALUES ('C52DA173-1793-4192-A836-C56BE3E14AFE',320, 1200, 0 ); 
INSERT INTO GambleOrder VALUES ('2A363E34-9738-4F56-83B2-7EF28388055E', 315, 300, 100 ); 
INSERT INTO GambleOrder VALUES ('178C3CDA-202D-4745-B067-5A74A78E46E4', 315, 200, 1100); 
INSERT INTO GambleOrder VALUES ('16F3D7E4-5BC3-4372-884E-FF3EA13B7E7E', 320, 100, 200 ); 
INSERT INTO GambleOrder VALUES ('9B7C8FDF-9A2C-45E9-8F98-8163B651AFD7', 311, 0, 500 );








--------------------------- GoodsOrder 假資料 ----------------
INSERT INTO GoodsOrder VALUES('125EF6B7-98FE-4DF5-B755-001CD99B4648','1AFXDmkLUX8eUWs0OHWfrx15Xi6wU6byl2GiEXZ+f48=','三重劉德華','2018','09',365,100,100*100,'2016-09-10 06:28:34',0);
INSERT INTO GoodsOrder VALUES('128F57E7-0266-4EBA-B0C4-019D163312BE','fKJuZOXKrWzv8st5DjNRs4cIWrTXqGLpDXgitIcOFUQ=','板橋劉德華','2022','01',014,1200,1200*100,'2016-09-11 11:28:15',0);
INSERT INTO GoodsOrder VALUES('8DDA0CF6-A937-46A7-BA01-0292BC2FD3D7','xZOiJ0WVg2R5fchXd0Uwbg5Y//hdIVR0a4O+ozrPXYk=','永和劉德華','2019','11',080,520,520*100,'2016-09-12 15:28:03',0);
INSERT INTO GoodsOrder VALUES('ED7D55A0-920B-4392-83E8-04C02C16B68A','yE9vI3iOxq4O7q4IQfnsbaLorXLJ33jOwUHToWpKtoo=','蘆洲劉德華','2023','05',345,670,670*100,'2016-09-15 06:00:05',1);
INSERT INTO GoodsOrder VALUES('7F0DE280-D5E1-4FF2-B600-0654B97C550C','oEV8cJd2rPe4qsVrG22YHkBny8UNvhRoovqmZikgO/Q=','天母劉德華','2020','09',546,300,300*100,'2016-09-29 06:04:34',0);
INSERT INTO GoodsOrder VALUES('7ADCCF6D-47EE-4373-B9E2-076DD075D099','nnBXviKqU5lNdtthQ267WKJbgmcDEfKwZUEZYnCjd7U=','中和劉德華','2020','12',789,1200,1200*100,'2016-08-31 16:07:34',0);
INSERT INTO GoodsOrder VALUES('AE799EFE-4278-4E6D-B4CD-0789744302E5','LpWVttDDl46UryzqjVcf6NIVw9RS4oOL9ZUa3sNWe/k=','土城劉德華','2019','09',951,1560,1560*100,'2016-09-06 07:34:54',1);
INSERT INTO GoodsOrder VALUES('A46BA10D-E584-4B12-A0F0-09BA011F81C6','Qtc4DuCN0B5D6ElvJzx2dTJD94lvkf3OTyDE99bXhHg=','嘉義劉德華','2018','07',657,350,350*100,'2016-08-23 05:26:25',0);
INSERT INTO GoodsOrder VALUES('5C9C24C2-BF00-427F-B17E-0A693532E697','VODCaD7cVL1FALgUdaaUtX5tSz05oM1j7ZW52A9pGvw=','屏東劉德華','2021','06',357,500,500*100,'2016-08-25 01:25:52',1);
INSERT INTO GoodsOrder VALUES('7D1D490A-5D0E-4CC7-BB7E-0B94B71696E0','123/nsEQf+D6/t7HW2C0i21AgK3Lzimpa6lkI9Mgcxk=','高雄劉德華','2020','09',260,3000,3000*100,'2016-09-22 13:28:57',1);


































