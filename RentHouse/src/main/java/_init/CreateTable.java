package _init;

import java.sql.Blob;
import java.sql.Clob;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.sql.rowset.serial.SerialClob;

import com.iiiedu105.RentHouse.ChangeClob;
import com.iiiedu105.RentHouse.model.Employee;
import com.iiiedu105.RentHouse.model.EmployeeReport;
import com.iiiedu105.RentHouse.model.Forum;
import com.iiiedu105.RentHouse.model.ForumReply;
import com.iiiedu105.RentHouse.model.ForumReport;
import com.iiiedu105.RentHouse.model.House;
import com.iiiedu105.RentHouse.model.HouseDetail;
import com.iiiedu105.RentHouse.model.HousePic;
import com.iiiedu105.RentHouse.model.Member;
public class CreateTable {
 
	
	public static void main(String[] args) {
		Blob blob=null;
		SimpleDateFormat sDF = new SimpleDateFormat("yyyy-MM-dd");
		sDF.setLenient(false);
		 Long date = new java.util.Date().getTime();
		 Timestamp time = new Timestamp(date);
		 java.sql.Date sdate = new java.sql.Date(date); 
		 
		 ChangeClob cc = new ChangeClob();
		 
		 String str1 = "前行政院長賴清德拋下震撼彈，昨(18日)到民進黨中央領表登記參與黨內總統初選，"
		 		+ "直球對決尋求連任的總統蔡英文。臉書社團《爆料公社》舉行模擬投票，"
		 		+ "共湧入18萬名網友踴躍表達意見，結果竟是賴清德支持度勝過蔡英文。"
		 		+ "賴清德登記黨內總統初選，他表示民進黨的情勢比2008年還要險峻，"
		 		+ "基層擔心2020年若輸掉總統選舉，立委席次又大幅減少，失去的不只是政權，"
		 		+ "台灣的主權和民主也將陷入空前的挑戰和危機，決定響應主席卓榮泰的號召，登記參選民進黨黨內總統初選。"
		 		+ "蔡英文也回應，她會在本週登記參選，爭取黨內提名，競選連任總統，"
		 		+ "「用行動告訴所有人，我們的國家正走在正確的道路上。」";
		 String str2 = "《爆料公社》昨日舉行模擬投票「民進黨展開總統大選黨內初選登記，賴清德前往黨部領表登記參選。"
		 		+ "問題：請問您支持賴清德參選或支持蔡英文參選呢？」"
		 		+ "，截至今上午9點為止，共有近18萬名網友湧入投票。其中62%網友支持賴清德，僅有38%網友挺蔡英文連任。"
		 		+ "當中也有網友陷入兩難困境，「兩個都有很高的民意，很難選耶」、「無論誰出來競選，請真正讓經濟繁榮，社會安定。」，"
		 		+ "也有人兩位都不支持「兩個都很爛，給民進黨執政，還不夠慘嗎？人民還要繼續被騙嗎」"
		 		+ "、「讓你們治國第四年了，還在跟我提主權，主X小越來越看不懂」、「柯P投哪裡」。";
		 String str3 = "其他條件EX: 獨立電表一度5塊";
		 String str4 = "城市中歐洲城堡的日常!4米2魔幻空間!";
		 Clob clob1 = null;
		 Clob clob2 = null;
		 Clob clob3 = null;
		 Clob clob4 = null;
		 clob1 =  cc.stringToClob(str1);
		 clob2 = cc.stringToClob(str2);
		 clob3 =  cc.stringToClob(str3);
		 clob4 = cc.stringToClob(str4);
		 
		Member member0 = null;
		Member member1 = null;
		Member member2 = null;
		Member member3 = null;
		
		House house0 = null ;
		House house1 = null ;
		House house2= null ;
		House house3= null ;
		
		HouseDetail houseDetail0=null;
		HouseDetail houseDetail1=null;
		HouseDetail houseDetail2=null;
		HouseDetail houseDetail3=null;
		
		HousePic housePic0 = null;
		HousePic housePic1 = null;
		HousePic housePic2 = null;
		HousePic housePic3 = null;
		
		HousePic housePic00 = null;
		HousePic housePic01 = null;
		HousePic housePic02 = null;
		HousePic housePic03 = null;
		
		HousePic housePic10 = null;
		HousePic housePic11 = null;
		HousePic housePic12 = null;
		HousePic housePic13 = null;
	
		
		Employee employee=null;
		EmployeeReport employeeReport1 = null;
		EmployeeReport employeeReport2 = null;
		
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
			
			housePic0 = new HousePic(null, 1, null, 1);	
			housePic00 = new HousePic(null, 1, null, 2);
			housePic01 = new HousePic(null, 1,null, 3);
			housePic02 = new HousePic(null, 1, null, 4);
			housePic03 = new HousePic(null, 1, null, 5);
			
			housePic1 = new HousePic(null, 2, null, 1);
			housePic10 = new HousePic(null, 2,null, 2);
			housePic11 = new HousePic(null, 2, null, 3);
			housePic12 = new HousePic(null, 2, null, 4);
			housePic13 = new HousePic(null, 2,null, 5);
			
			housePic2 = new HousePic(null, 3, null, 1);
			housePic3 = new HousePic(null, 4, null, 1);
					  	
			member0 = new Member("abc123", "!@Qa1234", "王小明", "0987123123", new Date(sDF.parse("1990-01-23").getTime()), "男", "A123456789", "abc123@gmail.com", "開通", blob, 0.0, "");
			member1 = new Member("bcd234", "!@Qa1234", "李大明", "0987234234", new Date(sDF.parse("1990-02-04").getTime()), "女", "A223456789", "bcd234@gmail.com", "開通", blob, 0.0, "");
			member2 = new Member("cde345", "!@Qa1234", "王小豬", "0987345345", new Date(sDF.parse("1990-02-15").getTime()), "女", "A223456789", "cde345@gmail.com", "開通", blob, 0.0, "");
			member3 = new Member("def456", "!@Qa1234", "李小豬", "0987456456", new Date(sDF.parse("1990-03-16").getTime()), "男", "A123456789", "def456@gmail.com", "開通", blob, 0.0, "");
			
			house0 = new House(null, "復興南路一段10號", 5, "公寓", 3, 5, "套房", "一房", "abc123", "審核", "台中市", "大安區", 0.0f, 0.0f, new Timestamp(sDF.parse("2019-03-01").getTime()), "住家", new Timestamp(sDF.parse("2019-03-01").getTime()), 1);
			house1 = new House(null, "建國北路二段10號", 10, "電梯大樓", 5, 11, "套房", "一房", "bcd234", "審核", "新北市", "中山區", 0.0f, 0.0f, new Timestamp(sDF.parse("2019-03-01").getTime()), "住家", new Timestamp(sDF.parse("2019-03-01").getTime()), 1);
			house2 = new House(null, "仁愛路三段10號", 23, "電梯華廈", 3, 7, "整層住家", "3房2廳2衛", "cde345", "審核", "台南市", "信義區", 0.0f, 0.0f, new Timestamp(sDF.parse("2019-03-01").getTime()), "住家", new Timestamp(sDF.parse("2019-03-01").getTime()), 2);
			house3 = new House(null, "信義路四段10號", 30, "公寓", 3, 5, "整層住家", "3房2廳2衛", "def456", "審核", "台北市", "信義區", 0.0f, 0.0f, new Timestamp(sDF.parse("2019-03-01").getTime()), "住家", new Timestamp(sDF.parse("2019-03-01").getTime()), 2);
			
			houseDetail0 = new HouseDetail(null, "捷運中山國小電梯德惠四平陽光晴光新喜公園", clob1, 2, 300, new Date(sDF.parse("2019-03-15").getTime()), "一年", "電視，冰箱，熱水器，洗衣機", "床，衣櫃，椅子，桌子", "管理費", "近便利商店，近傳統市場", "雄聲", 5000);
			houseDetail1 = new HouseDetail(null, "高檔獨立套房鄰近捷運站環境單純限女性", clob2, 1, 1050, new Date(sDF.parse("2019-03-15").getTime()), "一年", "電視，冰箱，熱水器，洗衣機", "床，衣櫃，椅子，桌子", null, "近便利商店，近傳統市場", "學生", 10000);
			houseDetail2= new HouseDetail(null, "微風商圈中山女中北科大學生上班族皆適合", clob3, 2, 3000, new Date(sDF.parse("2019-03-15").getTime()), "一年", "電視，冰箱，熱水器，洗衣機", "床，衣櫃，椅子，桌子", "管理費", "近便利商店，近傳統市場", "學生", 23000);
			houseDetail3= new HouseDetail(null, "城市中歐洲城堡的日常!4米2魔幻空間!", clob4, 2, 4000, new Date(sDF.parse("2019-03-15").getTime()), "一年", "電視，冰箱，熱水器，洗衣機", "床，衣櫃，椅子，桌子", "管理費", "近便利商店，近傳統市場", "學生", 30000);
			
			employee = new Employee("master01", "!@Qa1234", "林忠明", "staff",null);
			employeeReport1 = new EmployeeReport(null,null,null,"系統相關","遇到房屋圖片死圖",clob4,time,"未讀",null);
			employeeReport2 = new EmployeeReport(null,null,null,"系統相關","遇到房屋圖片死圖",clob3,time,"未讀",null);

			forumR0 = new Forum(null, "Test00",clob1, new Timestamp(sDF.parse("2019-03-04").getTime()),"租屋交流", "審核", null);
			forumR1 = new Forum(null,"Test01", clob3, new Timestamp(sDF.parse("2019-03-05").getTime()),"心情抒發", "審核",  null);
			forumR2 = new Forum(null,"Test02",clob2, new Timestamp(sDF.parse("2019-03-06").getTime()),"知識問答", "審核",  null);
			forumR3 = new Forum(null,"Test03", clob4, new Timestamp(sDF.parse("2019-03-06").getTime()),"房價討論", "審核",  null);
			forumReply1 = new ForumReply(null, "test1", clob3, time, "待審", null, null);
			forumReply2 = new ForumReply(null, "test2", clob1, time, "待審", null, null);
			forumReport1 = new ForumReport(null, null, "Xxxxx", clob1, time,"待審",null,null);
			forumReport2 = new ForumReport(null, null, "污辱字眼", clob3, time,"待審",null,null);

		} catch (ParseException e1) {
			e1.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		new CreateTable2().CreateTableEmp(employee);	
		new CreateTable2().CreateTableAllPic(member3, house0, houseDetail0, housePic0,housePic00,housePic01,housePic02,housePic03, forumR0);
		new CreateTable2().CreateTableAllPic(member2, house1, houseDetail1, housePic1,housePic10,housePic11,housePic12,housePic13, forumR1);
		new CreateTable2().CreateTableOther(member0, house2, houseDetail2, housePic2, forumR2,forumReport1,forumReply1,employeeReport1);
		new CreateTable2().CreateTableOther(member1, house3, houseDetail3, housePic3, forumR3,forumReport2,forumReply2,employeeReport2);

		new CreateTable2().CloseFactory();
	
	}
}
