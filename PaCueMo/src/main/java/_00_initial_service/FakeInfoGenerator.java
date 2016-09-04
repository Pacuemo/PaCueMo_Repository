package _00_initial_service;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import _9_41_member_model.MemberVO;

public class FakeInfoGenerator
{

	static Random random = new Random();
	static String[] position = { "'C'", "'PF'", "'SF'", "'SG'", "'PG'" };
	static String[] location = { "新北市", "台北市", "桃園市", "基隆市" };
	static String nameLine = "葉函鈺、丁淳來、王詩福、陳嘉軒、邱佑霖、謝志屏、張金翰、廖建良、巫尚輝、林平名、謝崇迪、吳宜友、曹定淑、林旭群、盧正新、楊珮如、游豪筠、饒雅芳、謝雲鳳、賴心怡、王孟哲、陳芝寶、黃珮恭、"
			+ "林婉均、許奕廷、錢靜火、賴家祥、林慧峰、敖小萍、趙萱隆、宋朝岑、蔡俊良、林雅均、黃千軒、吳佳琪、傅秋萍、曾小昀、葉奕廷、陳志海、陳依婷、黃梅民、倪怡君、曾俊傑、戈俐蓮、徐雅婷、蔡宣希、李怡君"
			+ "、林孟儒、劉睿瑄、陳育萱、周盈秀、陳姿雅、楊羽燕、謝孟芝、許淑人、劉佳靜、許宏然、蔣文豪、彭俊逸、洪佑瑜、吳佩珊、辛俊維、金莉蘋、賴淑娟、黃常恆、王昱妃、王智亞、汪華馨、吳協佳、楊建安、倪志文、"
			+ "汪綺函、王培尹、王佩君、楊旺丞、吳慧苓、張雅文、丁可任、李慧君、陳映冰、林鳳珠、彭怡秀、吳玉華、李佳幸、謝志瑋、詹士瑋、藍欣怡、陳瑋山、曾婉婷、吳紹蓁、丁健安、蘇芷洋、施季其、蔡珮裕、王文旺、白宜潔、林冠依、陳婉麟、黃京能、黃文宏"
			+ "、邱呈方、吳如湖、張文豪、陳財帆、陳冠勇、李辛盈、何旺紋、楊雅惠、李信宏、楊宇馨、葉麗美、吳志薇、柯雅娟、陳信禾、詹晴瑤、林元志、趙思妤、羅致峰、趙燕嘉、舒予龍、杜行心、黃國惟、何燦琪、陳美其、陳逸玉、王建智、王光學、林靜昆、吳孟菱、陳隆龍、"
			+ "鄭馨鑫、王淑玉、鄭嘉琪、郭怡君、吳惠君、蔡翊友、呂凡沛、何淑婷、陳美彬、陳賢慧、陳柏翰、陳良夢、韓易凱、李依菁、蕭志偉";
	static String[] emailDomain = { "@yahoo.com.tw", "@gmail.com", "@hotmail.com", "@yahoo.com",
					"@pchome.com.tw" };
	static MemberVO memberVO = null;
	static Connection con = null;
	static PreparedStatement pstmt = null;
	static ResultSet rs = null;
	static String driver = GlobalService.DRIVER_NAME;
	static String url = GlobalService.DB_URL;
	static String userid = GlobalService.USERID;
	static String passwd = GlobalService.PASSWORD;
	static List<String> list;

	public static String[] cutName(String nameLine)
	{

		String[] names = nameLine.split("、");

		return names;
	}

	public static void memberGenerator()
	{
		List<String> firstNames = new ArrayList<>();
		List<String> lastNames = new ArrayList<>();

		String[] firstName;
		String[] lastName;

		File allFiles = new File("C:\\PaCueMo\\image\\member");
		File[] files = allFiles.listFiles();

		Random random = new Random();

		String[] names = cutName(nameLine);

		for (String name : names)
		{
			String last = name.substring(0, 1);
			String first = name.substring(1);

			firstNames.add(first);
			lastNames.add(last);
		}

		firstName = firstNames.toArray(new String[144]);
		lastName = lastNames.toArray(new String[144]);

		String password = GlobalService.getMD5Endocing("123456789");

		for (int i = 0 ; i < 144 ; i++)
		{

			long timeMillis = (long) (Math.random() * 1104537600000l);
			Date birthDay = new Date(timeMillis);
			String phoneNumber = String.format("09%08d", random.nextInt(100000000));
			long rgTimeMillis = 1467331200000l + (long) (Math.random() * (System.currentTimeMillis() - 1467331200000l));
			Timestamp rgDate = new Timestamp(rgTimeMillis);

			String rgDatetime = rgDate.toString();

			StringBuilder sb = new StringBuilder();
			for (int j = 1 ; j <= 6 ; j++)
			{
				char c = (char) (random.nextInt(25) + 97);
				sb.append(c);
			}

			String mail = String.format("'%s%06d%s'", sb.toString(), random.nextInt(1000000),
					emailDomain[random.nextInt(5)]);

			int num = (int) (Math.random() * 10 + 1);

			String fileName = "";

			if (num == 5 || num == 2)
			{
				fileName = null;
			}
			else
			{
				fileName = "'" + files[random.nextInt(files.length)].getName() + "'";
			}

			String str = String.format(
					"INSERT INTO MEMBER SELECT NEWID(), '%s','%s','%s','%s','%s',%30s,%20s,1000,1,NULL,1,'%-23s',%d,NULL,NULL,NULL,0",
					firstName[i], lastName[i], password, birthDay.toString(), phoneNumber, mail, fileName, rgDatetime,
					(int) (Math.random() * 2));

			System.out.println(str);
		}
	}

	public static void playercardGenerator() throws NumberFormatException, IOException
	{

		try
		{

			List<String> list = new ArrayList<String>();
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement("SELECT memberId FROM dbo.Member");

			rs = pstmt.executeQuery();

			while (rs.next())
			{
				String memberId = rs.getString("memberId");
				int gender = random.nextInt(2);
				int hand = random.nextInt(2);
				double height = 150 + (Math.random() * 60);
				double weight = 40 + (Math.random() * 70);
				String note = "";

				int a = random.nextInt(21);
				int b = random.nextInt(21 - a);
				int c = random.nextInt(21 - a - b);
				int d = random.nextInt(21 - a - b - c);
				int e = random.nextInt(21 - a - b - c - d);
				int f = random.nextInt(21 - a - b - c - d - e);

				String str = String.format("INSERT INTO PLAYERCARD SELECT '%s', %d, %.2f, %.2f, %2s, %d," + " '%s', '%s', %d, %d, %d, %d, %d, %d",
						memberId, gender, height, weight, position[random.nextInt(5)], hand, note, location[random.nextInt(4)], a, b,
						c, d, e, f);

				System.out.println(str);

				list.add(memberId);

			}

			// Handle any driver errors
		}
		catch (ClassNotFoundException e)
		{
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		}
		catch (SQLException se)
		{
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		}
		finally
		{
			if (rs != null)
			{
				try
				{
					rs.close();
				}
				catch (SQLException se)
				{
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null)
			{
				try
				{
					pstmt.close();
				}
				catch (SQLException se)
				{
					se.printStackTrace(System.err);
				}
			}
			if (con != null)
			{
				try
				{
					con.close();
				}
				catch (Exception e)
				{
					e.printStackTrace(System.err);
				}
			}
		}
	}

	public static void fightrecoedGenerator() throws IOException
	{

		try
		{

			List<String> list = new ArrayList<String>();
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement("SELECT memberId FROM dbo.Member");

			rs = pstmt.executeQuery();

			while (rs.next())
			{
				String memberId = rs.getString("memberId");
				list.add(memberId);

			}

			File file = new File("C:\\PaCueMo\\fightrecord.txt");
			BufferedReader br = new BufferedReader(new FileReader(file));
			String str = "";

			while ((str = br.readLine()) != null)
			{
				String str1 = "";
				String[] strs = str.split(",");
				for (int i = 0 ; i < strs.length ; i++)
				{
					if (i == strs.length - 1)
					{
						str1 = str1 + strs[i];
					}
					else if (i == 2)
					{
						int x = Integer.parseInt(strs[i]) - 1;
						str1 = str1 + "'" + list.get(x) + "'" + ",";
					}
					else
					{
						str1 = str1 + strs[i] + ",";
					}

				}

				System.out.println(str1);

			}

			br.close();

			// Handle any driver errors
		}
		catch (ClassNotFoundException e)
		{
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		}
		catch (SQLException se)
		{
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		}
		finally
		{
			if (rs != null)
			{
				try
				{
					rs.close();
				}
				catch (SQLException se)
				{
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null)
			{
				try
				{
					pstmt.close();
				}
				catch (SQLException se)
				{
					se.printStackTrace(System.err);
				}
			}
			if (con != null)
			{
				try
				{
					con.close();
				}
				catch (Exception e)
				{
					e.printStackTrace(System.err);
				}
			}
		}

	}

	public static void clubGenerator() throws NumberFormatException, IOException
	{

		try
		{
			List<String> list = new ArrayList<String>();
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement("SELECT memberId FROM dbo.Member");

			rs = pstmt.executeQuery();

			while (rs.next())
			{
				String memberId = rs.getString("memberId");
				list.add(memberId);

			}

			File file = new File("C:\\PaCueMo\\club.txt");
			BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(file), "UTF-8"));
			String str = "";

			while ((str = br.readLine()) != null)
			{
				String str1 = "";
				String[] strs = str.split(",");
				for (int i = 0 ; i < strs.length ; i++)
				{
					if (i == strs.length - 1)
					{
						str1 = str1 + strs[i];
					}
					else if (i == 3)
					{

						int x = Integer.parseInt(strs[i]) - 1;
						str1 = str1 + "'" + list.get(x) + "'" + ",";
					}
					else
					{
						str1 = str1 + strs[i] + ",";
					}

				}

				System.out.println(str1);

			}

			br.close();

			// Handle any driver errors
		}
		catch (

		ClassNotFoundException e)
		{
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		}
		catch (SQLException se)
		{
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		}
		finally
		{
			if (rs != null)
			{
				try
				{
					rs.close();
				}
				catch (SQLException se)
				{
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null)
			{
				try
				{
					pstmt.close();
				}
				catch (SQLException se)
				{
					se.printStackTrace(System.err);
				}
			}
			if (con != null)
			{
				try
				{
					con.close();
				}
				catch (Exception e)
				{
					e.printStackTrace(System.err);
				}
			}
		}
	}

//	public static void clubmemberGenerator() throws NumberFormatException, IOException
//	{
//
//
//		try
//		{
//			List<String> list = new ArrayList<String>();
//			Class.forName(driver);
//			con = DriverManager.getConnection(url, userid, passwd);
//			pstmt = con.prepareStatement("SELECT memberId FROM dbo.Member");
//
//			rs = pstmt.executeQuery();
//
//			while (rs.next())
//			{
//				String memberId = rs.getString("memberId");
//				list.add(memberId);
//
//			}
//
//			File file = new File("C:\\PaCueMo\\club.txt");
//			BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(file), "UTF-8"));
//			String str = "";
//
//			while ((str = br.readLine()) != null)
//			{
//				String str1 = "";
//				String[] strs = str.split(",");
//				for (int i = 0 ; i < strs.length ; i++)
//				{
//					if (i == strs.length - 1)
//					{
//						str1 = str1 + strs[i];
//					}
//					else if (i == 3)
//					{
//
//						int x = Integer.parseInt(strs[i]) - 1;
//						str1 = str1 + "'" + list.get(x) + "'" + ",";
//					}
//					else
//					{
//						str1 = str1 + strs[i] + ",";
//					}
//
//				}
//
//				System.out.println(str1);
//
//			}
//
//			br.close();
//
//			// Handle any driver errors
//		}
//		catch (ClassNotFoundException e)
//		{
//			throw new RuntimeException("Couldn't load database driver. "
//					+ e.getMessage());
//			// Handle any SQL errors
//		}
//		catch (SQLException se)
//		{
//			throw new RuntimeException("A database error occured. "
//					+ se.getMessage());
//			// Clean up JDBC resources
//		}
//		finally
//		{
//			if (rs != null)
//			{
//				try
//				{
//					rs.close();
//				}
//				catch (SQLException se)
//				{
//					se.printStackTrace(System.err);
//				}
//			}
//			if (pstmt != null)
//			{
//				try
//				{
//					pstmt.close();
//				}
//				catch (SQLException se)
//				{
//					se.printStackTrace(System.err);
//				}
//			}
//			if (con != null)
//			{
//				try
//				{
//					con.close();
//				}
//				catch (Exception e)
//				{
//					e.printStackTrace(System.err);
//				}
//			}
//		}
//	}

	public static void gambleOrderGenerator() throws NumberFormatException, IOException
	{
		try
		{
			List<String> list = new ArrayList<String>();
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement("SELECT memberId FROM dbo.Member");

			rs = pstmt.executeQuery();

			while (rs.next())
			{
				String memberId = rs.getString("memberId");
				list.add(memberId);

			}

			File file = new File("C:\\PaCueMo\\gambleorder.txt");
			BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(file), "UTF-8"));
			String str = "";

			while ((str = br.readLine()) != null)
			{
				String str1 = "";
				String[] strs = str.split(",");
				for (int i = 0 ; i < strs.length ; i++)
				{
					if (i == strs.length - 1)
					{
						str1 = str1 + strs[i];
					}
					else if (i == 0)
					{
						String[] test = strs[i].split("\\(");
						int x = Integer.parseInt(test[1].trim()) - 1;
						str1 = test[0] + "(" + "'" + list.get(x) + "'" + ",";

					}
					else
					{
						str1 = str1 + strs[i] + ",";
					}

				}

				System.out.println(str1);

			}

			br.close();

			// Handle any driver errors
		}
		catch (ClassNotFoundException e)
		{
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		}
		catch (SQLException se)
		{
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		}
		finally
		{
			if (rs != null)
			{
				try
				{
					rs.close();
				}
				catch (SQLException se)
				{
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null)
			{
				try
				{
					pstmt.close();
				}
				catch (SQLException se)
				{
					se.printStackTrace(System.err);
				}
			}
			if (con != null)
			{
				try
				{
					con.close();
				}
				catch (Exception e)
				{
					e.printStackTrace(System.err);
				}
			}
		}
	}

	public static void clubmemberGenerator() throws NumberFormatException, IOException
	{

		try
		{

			list = new ArrayList<String>();
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement("SELECT memberId FROM dbo.Member");

			rs = pstmt.executeQuery();

			while (rs.next())
			{
				String memberId = rs.getString("memberId");
				list.add(memberId);

			}

			File file = new File("C:\\PaCueMo\\clubmember.txt");
			BufferedReader br = new BufferedReader(new FileReader(file));
			String str = "";
			while ((str = br.readLine()) != null)
			{
				String str1 = "";
				String[] strs = str.split(",");
				for (int i = 0 ; i < strs.length ; i++)
				{
					if (i == strs.length - 1)
					{
						str1 = str1 + strs[i];
					}
					else if (i == 1)
					{
						int x = Integer.parseInt(strs[i]) - 1;
						str1 = str1 + "'" + list.get(x) + "'" + ",";
					}
					else
					{
						str1 = str1 + strs[i] + ",";
					}

				}

				System.out.println(str1);

			}

			br.close();

			// Handle any driver errors
		}
		catch (ClassNotFoundException e)
		{
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		}
		catch (SQLException se)
		{
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		}
		finally
		{
			if (rs != null)
			{
				try
				{
					rs.close();
				}
				catch (SQLException se)
				{
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null)
			{
				try
				{
					pstmt.close();
				}
				catch (SQLException se)
				{
					se.printStackTrace(System.err);
				}
			}
			if (con != null)
			{
				try
				{
					con.close();
				}
				catch (Exception e)
				{
					e.printStackTrace(System.err);
				}
			}
		}
	}

	public static void teammemberGenerator() throws NumberFormatException, IOException
	{

		try
		{

			list = new ArrayList<String>();
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement("SELECT memberId FROM dbo.Member");

			rs = pstmt.executeQuery();

			while (rs.next())
			{
				String memberId = rs.getString("memberId");
				list.add(memberId);

			}

			File file = new File("C:\\PaCueMo\\teammember.txt");
			BufferedReader br = new BufferedReader(new FileReader(file));
			String str = "";
			while ((str = br.readLine()) != null)
			{
				String str1 = "";
				String[] strs = str.split(",");
				for (int i = 0 ; i < strs.length ; i++)
				{
					if (i == strs.length - 1)
					{
						str1 = str1 + strs[i];
					}
					else if (i == 1)
					{
						int x = Integer.parseInt(strs[i]) - 1;
						str1 = str1 + "'" + list.get(x) + "'" + ",";
					}
					else
					{
						str1 = str1 + strs[i] + ",";
					}

				}

				System.out.println(str1);

			}

			br.close();

			// Handle any driver errors
		}
		catch (ClassNotFoundException e)
		{
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		}
		catch (SQLException se)
		{
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		}
		finally
		{
			if (rs != null)
			{
				try
				{
					rs.close();
				}
				catch (SQLException se)
				{
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null)
			{
				try
				{
					pstmt.close();
				}
				catch (SQLException se)
				{
					se.printStackTrace(System.err);
				}
			}
			if (con != null)
			{
				try
				{
					con.close();
				}
				catch (Exception e)
				{
					e.printStackTrace(System.err);
				}
			}
		}
	}

	public static void main(String[] args) throws NumberFormatException, IOException
	{
		/**
		 * Step1 : 先產生會員 memberGenerator() ，貼到SSMS → run
		 * Step2 : 將你的 與 memberId 相關的 INSERT...假資料 指令貼到文字檔，放到 C:/PaCueMo 根目錄下
		 * Step3 : 在本程式中執行你的方法，將SSMS NEWID() 生成的 memberId 換掉原本的 INSERT 指令
		 * Step4 : 以Console產生的INSERT貼到SSMS中塞入假資料到DB
		 */

//		memberGenerator(); //--->產生會員
//		playercardGenerator();

//      club和league部分
//		clubGenerator();

		clubmemberGenerator();

//		fightrecoedGenerator();

//		gambleOrderGenerator();

//		teammemberGenerator();

	}
}
