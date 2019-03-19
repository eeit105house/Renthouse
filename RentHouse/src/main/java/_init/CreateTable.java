package _init;

import java.io.IOException;
import java.sql.Blob;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import com.iiiedu105.RentHouse.model.Employee;
import com.iiiedu105.RentHouse.model.Forum;

import com.iiiedu105.RentHouse.model.ForumReply;

import com.iiiedu105.RentHouse.model.ForumReport;
import com.iiiedu105.RentHouse.model.House;
import com.iiiedu105.RentHouse.model.HouseDetail;
import com.iiiedu105.RentHouse.model.HousePic;
import com.iiiedu105.RentHouse.model.Member;

import _init.util.SystemUtils;
public class CreateTable {

	
	public static void main(String[] args) {
		Blob blob=null;
		SimpleDateFormat sDF = new SimpleDateFormat("yyyy-MM-dd");
		sDF.setLenient(false);
		 Long date = new java.util.Date().getTime();
		 Timestamp time = new Timestamp(date);

		Member member0 = null;
		Member member1 = null;
		Member member2 = null;
		Member member3 = null;
		
		House house0 = null ;
		House house1 = null ;
		House house2= null ;
		House house3= null ;
		House house4 = null ;
		House house5 = null ;
		House house6= null ;
		House house7= null ;
		
		HouseDetail houseDetail0=null;
		HouseDetail houseDetail1=null;
		HouseDetail houseDetail2=null;
		HouseDetail houseDetail3=null;
		HouseDetail houseDetail4=null;
		HouseDetail houseDetail5=null;
		HouseDetail houseDetail6=null;
		HouseDetail houseDetail7=null;
		
		HousePic housePic0 = null;
		HousePic housePic1 = null;
		HousePic housePic2 = null;
		HousePic housePic3 = null;
		HousePic housePic4 = null;
		HousePic housePic5 = null;
		HousePic housePic6 = null;
		HousePic housePic7 = null;
		
		HousePic housePic00 = null;
		HousePic housePic01 = null;
		HousePic housePic02 = null;
		HousePic housePic03 = null;
		
		HousePic housePic10 = null;
		HousePic housePic11 = null;
		HousePic housePic12 = null;
		HousePic housePic13 = null;
	
		
		Employee employee=null;
		
		Forum forumR0= null;
		Forum forumR1 = null;
		Forum forumR2 = null;
//		try {
//			member = new Member("abc123", "!@Qa1234", "王小明", "0987666555", new Date(sDF.parse("1990-01-05").getTime()), "男", "A123456789", "abc123@gmail.com", "一般", blob, 0.15, "");
//			member2 = new Member("bcd456", "!@Qa1234", "李大明", "0987444333", new Date(sDF.parse("1990-01-05").getTime()), "男", "A123456789", "abc123@gmail.com", "一般", blob, 1.0, "");
//			house = new House(null, "XX路XX號X樓", 5, "公寓", 3, 5, "套房", "一房", "abc123", "上架", "台北市", "中山區", 0.0f, 0.0f, new Timestamp(sDF.parse("2019-03-01").getTime()), "住家", new Timestamp(sDF.parse("2019-03-01").getTime()), 0);
//			houseDetail = new HouseDetail(null, "測試房", "TestTestTestTest", 1000, 0, new Date(sDF.parse("2019-03-15").getTime()), "", null, null, null, null, null, 100);
//			employee = new Employee("master01", "!@Qa1234", "林忠明", "manager" ,null);
//			forum = new Forum(null, "Test01", "tttttttt", new Timestamp(sDF.parse("2019-03-04").getTime()), "", null, null);
//			forumR1 = new Forum(null, null, "R1，TTTTTTTTT", new Timestamp(sDF.parse("2019-03-05").getTime()), "", null, null);
//			forumR2 = new Forum(null, null, "R2，TTTTTTTTT", new Timestamp(sDF.parse("2019-03-06").getTime()), "", null, null);
//=======
		Forum forumR3 = null;
		ForumReply forumReply1 = null;
		ForumReply forumReply2 = null;
		ForumReport forumReport1 = null;
		ForumReport forumReport2 = null;

		
		try {
			
			housePic0 = new HousePic(null, 1, SystemUtils.fileToBlob("data/images/HousePic0.jpg"), 1);	
			housePic00 = new HousePic(null, 1, SystemUtils.fileToBlob("data/images/HousePic0_0.jpg"), 2);
			housePic01 = new HousePic(null, 1, SystemUtils.fileToBlob("data/images/HousePic0_1.jpg"), 3);
			housePic02 = new HousePic(null, 1, SystemUtils.fileToBlob("data/images/HousePic0_2.jpg"), 4);
			housePic03 = new HousePic(null, 1, SystemUtils.fileToBlob("data/images/HousePic0_3.jpg"), 5);
			
			housePic1 = new HousePic(null, 2, SystemUtils.fileToBlob("data/images/HousePic1.jpg"), 1);
			housePic10 = new HousePic(null, 2, SystemUtils.fileToBlob("data/images/HousePic1_0.jpg"), 2);
			housePic11 = new HousePic(null, 2, SystemUtils.fileToBlob("data/images/HousePic1_1.jpg"), 3);
			housePic12 = new HousePic(null, 2, SystemUtils.fileToBlob("data/images/HousePic1_2.jpg"), 4);
			housePic13 = new HousePic(null, 2, SystemUtils.fileToBlob("data/images/HousePic1_3.jpg"), 5);
			
			housePic2 = new HousePic(null, 3, SystemUtils.fileToBlob("data/images/HousePic2.jpg"), 1);
			housePic3 = new HousePic(null, 4, SystemUtils.fileToBlob("data/images/HousePic3.jpg"), 1);
			housePic4 = new HousePic(null, 3, SystemUtils.fileToBlob("data/images/HousePic0.jpg"), 1);
			housePic5 = new HousePic(null, 4, SystemUtils.fileToBlob("data/images/HousePic1.jpg"), 1);
			housePic6 = new HousePic(null, 3, SystemUtils.fileToBlob("data/images/HousePic2.jpg"), 1);
			housePic7 = new HousePic(null, 4, SystemUtils.fileToBlob("data/images/HousePic3.jpg"), 1);
			member0 = new Member("abc123", "!@Qa1234", "王小明", "0987123123", new Date(sDF.parse("1990-01-23").getTime()), "男", "A123456789", "abc123@gmail.com", "開通", blob, 0.0, "");
			member1 = new Member("bcd234", "!@Qa1234", "李大明", "0987234234", new Date(sDF.parse("1990-02-04").getTime()), "女", "A223456789", "bcd234@gmail.com", "開通", blob, 0.0, "");
			member2 = new Member("cde345", "!@Qa1234", "王小豬", "0987345345", new Date(sDF.parse("1990-02-15").getTime()), "女", "A223456789", "cde345@gmail.com", "開通", blob, 0.0, "");
			member3 = new Member("def456", "!@Qa1234", "李小豬", "0987456456", new Date(sDF.parse("1990-03-16").getTime()), "男", "A123456789", "def456@gmail.com", "開通", blob, 0.0, "");
			
			house0 = new House(null, "復興南路一段10號", 5, "公寓", 3, 5, "獨立套房", "一房", "abc123", "上架", "台中市", "大安區", 0.0f, 0.0f, new Timestamp(sDF.parse("2019-03-01").getTime()), "住家", new Timestamp(sDF.parse("2019-03-01").getTime()), 1);
			house1 = new House(null, "建國北路二段10號", 10, "電梯大樓", 5, 11, "獨立套房", "一房", "bcd234", "上架", "新北市", "中山區", 0.0f, 0.0f, new Timestamp(sDF.parse("2019-03-01").getTime()), "住家", new Timestamp(sDF.parse("2019-03-01").getTime()), 1);
			house2 = new House(null, "仁愛路三段10號", 23, "電梯大樓", 3, 7, "整層住家", "3房2廳2衛", "cde345", "上架", "台南市", "信義區", 0.0f, 0.0f, new Timestamp(sDF.parse("2019-03-01").getTime()), "住家", new Timestamp(sDF.parse("2019-03-01").getTime()), 2);
			house3 = new House(null, "信義路四段10號", 30, "公寓", 3, 5, "雅房", "3房2廳2衛", "def456", "上架", "台北市", "信義區", 0.0f, 0.0f, new Timestamp(sDF.parse("2019-03-01").getTime()), "住家", new Timestamp(sDF.parse("2019-03-01").getTime()), 2);
			house4 = new House(null, "復興南路一段10號", 5, "透天厝", 3, 5, "獨立套房", "一房", "abc123", "上架", "台中市", "大安區", 0.0f, 0.0f, new Timestamp(sDF.parse("2019-03-01").getTime()), "住家", new Timestamp(sDF.parse("2019-03-01").getTime()), 1);
			house5 = new House(null, "建國北路二段10號", 10, "電梯大樓", 5, 11, "分租套房", "一房", "bcd234", "上架", "新北市", "中山區", 0.0f, 0.0f, new Timestamp(sDF.parse("2019-03-01").getTime()), "住家", new Timestamp(sDF.parse("2019-03-01").getTime()), 1);
			house6 = new House(null, "仁愛路三段10號", 23, "電梯大樓", 3, 7, "整層住家", "3房2廳2衛", "cde345", "上架", "台南市", "信義區", 0.0f, 0.0f, new Timestamp(sDF.parse("2019-03-01").getTime()), "住家", new Timestamp(sDF.parse("2019-03-01").getTime()), 2);
			house7 = new House(null, "信義路四段10號", 30, "別墅", 3, 5, "分租套房", "3房2廳2衛", "def456", "上架", "台北市", "信義區", 0.0f, 0.0f, new Timestamp(sDF.parse("2019-03-01").getTime()), "住家", new Timestamp(sDF.parse("2019-03-01").getTime()), 2);
			
			houseDetail0 = new HouseDetail(null, "捷運中山國小電梯德惠四平陽光晴光新喜公園", "其他條件EX: 獨立電表一度5塊", 2, 300, new Date(sDF.parse("2019-03-15").getTime()), "一年", "電視，冰箱，熱水器，洗衣機", "床，衣櫃，椅子，桌子", "管理費", "近便利商店，近傳統市場", null, 5000);
			houseDetail1 = new HouseDetail(null, "高檔獨立套房鄰近捷運站環境單純限女性", "其他條件EX: 獨立電表一度5塊", 1, 1050, new Date(sDF.parse("2019-03-15").getTime()), "一年", "電視，冰箱，熱水器，洗衣機,冷氣,網路,第四台,瓦斯", "床，衣櫃，椅子，桌子", null, "近便利商店，近傳統市場", null, 10000);
			houseDetail2= new HouseDetail(null, "微風商圈中山女中北科大學生上班族皆適合", "其他條件EX: 獨立電表一度5塊", 2, 3000, new Date(sDF.parse("2019-03-15").getTime()), "一年", "電視，冰箱，熱水器，洗衣機", "床，衣櫃，椅子，桌子", "管理費", "近便利商店，近傳統市場", null, 23000);
			houseDetail3= new HouseDetail(null, "城市中歐洲城堡的日常!4米2魔幻空間!", "其他條件EX: 獨立電表一度5塊", 2, 4000, new Date(sDF.parse("2019-03-15").getTime()), "一年", "電視，冰箱，熱水器，洗衣機,冷氣,網路,第四台,瓦斯", "床，衣櫃，椅子，桌子", "管理費", "近便利商店，近傳統市場", null, 30000);
			houseDetail4 = new HouseDetail(null, "捷運中山國小電梯德惠四平陽光晴光新喜公園", "其他條件EX: 獨立電表一度5塊", 2, 300, new Date(sDF.parse("2019-03-15").getTime()), "一年", "電視，冰箱，熱水器，洗衣機", "床，衣櫃，椅子，桌子", "管理費", "近便利商店，近傳統市場", null, 5000);
			houseDetail5 = new HouseDetail(null, "高檔獨立套房鄰近捷運站環境單純限女性", "其他條件EX: 獨立電表一度5塊", 1, 1050, new Date(sDF.parse("2019-03-15").getTime()), "一年", "電視，冰箱，熱水器，洗衣機,冷氣,網路,第四台,瓦斯", "床，衣櫃，椅子，桌子", null, "近便利商店，近傳統市場", null, 10000);
			houseDetail6= new HouseDetail(null, "微風商圈中山女中北科大學生上班族皆適合", "其他條件EX: 獨立電表一度5塊", 2, 3000, new Date(sDF.parse("2019-03-15").getTime()), "一年", "電視，冰箱，熱水器，洗衣機", "床，衣櫃，椅子，桌子", "管理費", "近便利商店，近傳統市場", null, 23000);
			houseDetail7= new HouseDetail(null, "城市中歐洲城堡的日常!4米2魔幻空間!", "其他條件EX: 獨立電表一度5塊", 2, 4000, new Date(sDF.parse("2019-03-15").getTime()), "一年", "電視，冰箱，熱水器，洗衣機,冷氣,網路,第四台,瓦斯", "床，衣櫃，椅子，桌子", "管理費", "近便利商店，近傳統市場", null, 30000);
			employee = new Employee("master01", "!@Qa1234", "林忠明", "staff",SystemUtils.fileToBlob("data/images/employee/avatar1.jpg"));
			

			forumR0 = new Forum(null, "Test00", "（中央社華盛頓13日綜合外電報導）美國總統川普今天宣布，計畫下令停飛所有波音737 MAX機型飛機。這型飛機在不到5個月內兩度失事，多數國家已下令停飛，使得川普承受沈重國際與政治壓力，終於決定跟進。\r\n" + 
					"\r\n" + 
					"川普在白宮告訴記者：「我們將會發布緊急命令，禁止所有737 MAX 8和737 MAX 9型飛機飛行。」\r\n" + 
					"\r\n" + 
					"他又說，美國聯邦航空總署（FAA）準備很快就此作出宣布。\r\n" + 
					"\r\n" + 
					"衣索比亞航空公司（Ethiopian Airlines）一架波音737 MAX 8型客機10日墜毀，造成機上157人全部罹難。其後中國、印度、澳洲和所有歐洲國家已相繼禁止這型飛機在空域飛行。（譯者：林治平）1080314\r\n" + 
					"\r\n" + 
					"波音737機瘟", new Timestamp(sDF.parse("2019-03-04").getTime()),"租屋交流", "審核", null);
			forumR1 = new Forum(null,"Test01", "R1，TTTTTTTTT", new Timestamp(sDF.parse("2019-03-05").getTime()),"心情抒發", "審核",  null);
			forumR2 = new Forum(null,"Test02", "（中央社華盛頓13日綜合外電報導）美國總統川普今天宣布，計畫下令停飛所有波音737 MAX機型飛機。這型飛機在不到5個月內兩度失事，多數國家已下令停飛，使得川普承受沈重國際與政治壓力，終於決定跟進。\\r\\n\" + \r\n" + 
					"					\"\\r\\n\" + \r\n" + 
					"					\"川普在白宮告訴記者：「我們將會發布緊急命令，禁止所有737 MAX 8和737 MAX 9型飛機飛行。」\\r\\n\" + \r\n" + 
					"					\"\\r\\n\" + \r\n" + 
					"					\"他又說，美國聯邦航空總署（FAA）準備很快就此作出宣布。\\r\\n\" + \r\n" + 
					"					\"\\r\\n\" + \r\n" + 
					"					\"衣索比亞航空公司（Ethiopian Airlines）一架波音737 MAX 8型客機10日墜毀，造成機上157人全部罹難。其後中國、印度、澳洲和所有歐洲國家已相繼禁止這型飛機在空域飛行。（譯者：林治平）1080314\\r\\n\" + \r\n" + 
					"					\"\\r\\n\" + \r\n" + 
					"					\"波音737機瘟", new Timestamp(sDF.parse("2019-03-06").getTime()),"知識問答", "審核",  null);
			forumR3 = new Forum(null,"Test03", "（中央社華盛頓13日綜合外電報導）美國總統川普今天宣布，計畫下令停飛所有波音737 MAX機型飛機。這型飛機在不到5個月內兩度失事，多數國家已下令停飛，使得川普承受沈重國際與政治壓力，終於決定跟進。\\r\\n\" + \r\n" + 
					"					\"\\r\\n\" + \r\n" + 
					"					\"川普在白宮告訴記者：「我們將會發布緊急命令，禁止所有737 MAX 8和737 MAX 9型飛機飛行。」\\r\\n\" + \r\n" + 
					"					\"\\r\\n\" + \r\n" + 
					"					\"他又說，美國聯邦航空總署（FAA）準備很快就此作出宣布。\\r\\n\" + \r\n" + 
					"					\"\\r\\n\" + \r\n" + 
					"					\"衣索比亞航空公司（Ethiopian Airlines）一架波音737 MAX 8型客機10日墜毀，造成機上157人全部罹難。其後中國、印度、澳洲和所有歐洲國家已相繼禁止這型飛機在空域飛行。（譯者：林治平）1080314\\r\\n\" + \r\n" + 
					"					\"\\r\\n\" + \r\n" + 
					"					\"波音737機瘟", new Timestamp(sDF.parse("2019-03-06").getTime()),"房價討論", "審核",  null);
			forumReply1 = new ForumReply(null, "test1", "asdqwrcwqefefqwe", time, "待審", null, null);
			forumReply2 = new ForumReply(null, "test2", "好棒棒", time, "待審", null, null);
			forumReport1 = new ForumReport(null, null, "Xxxxx", "hello world", time,"待審");
			forumReport2 = new ForumReport(null, null, "污辱字眼污辱字眼污辱字眼污辱字眼污辱字眼污辱字眼污辱字眼", "此文章有不雅字眼", time,"待審");

		} catch (ParseException e1) {
			e1.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		new CreateTable2().CreateTableEmp(employee);	
		new CreateTable2().CreateTableAllPic(member3, house0, houseDetail0, housePic0,housePic00,housePic01,housePic02,housePic03, forumR0);
		new CreateTable2().CreateTableAllPic(member2, house1, houseDetail1, housePic1,housePic10,housePic11,housePic12,housePic13, forumR1);
		new CreateTable2().CreateTableOther(member0, house2, houseDetail2, housePic2, forumR2,forumReport1,forumReply1);
		new CreateTable2().CreateTableOther(member1, house3, houseDetail3, housePic3, forumR3,forumReport2,forumReply2);
		new CreateTable2().CreateTableOther(member0, house4, houseDetail4, housePic4, forumR2,forumReport1,forumReply1);
		new CreateTable2().CreateTableOther(member1, house5, houseDetail5, housePic5, forumR3,forumReport2,forumReply2);
		new CreateTable2().CreateTableOther(member0, house6, houseDetail6, housePic6, forumR2,forumReport1,forumReply1);
		new CreateTable2().CreateTableOther(member1, house7, houseDetail7, housePic7, forumR3,forumReport2,forumReply2);

		new CreateTable2().CloseFactory();
	
	}
}
