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
		
		Forum forumR0= null;
		Forum forumR1 = null;
		Forum forumR2 = null;
		Forum forumR3 = null;
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
						
			member0 = new Member("abc123", "!@Qa1234", "王小明", "0987123123", new Date(sDF.parse("1990-01-23").getTime()), "男", "A123456789", "abc123@gmail.com", "開通", blob, 0.0, "");
			member1 = new Member("bcd234", "!@Qa1234", "李大明", "0987234234", new Date(sDF.parse("1990-02-04").getTime()), "女", "A223456789", "bcd234@gmail.com", "開通", blob, 0.0, "");
			member2 = new Member("cde345", "!@Qa1234", "王小豬", "0987345345", new Date(sDF.parse("1990-02-15").getTime()), "女", "A223456789", "cde345@gmail.com", "開通", blob, 0.0, "");
			member3 = new Member("def456", "!@Qa1234", "李小豬", "0987456456", new Date(sDF.parse("1990-03-16").getTime()), "男", "A123456789", "def456@gmail.com", "開通", blob, 0.0, "");
			
			house0 = new House(null, "復興南路一段10號", 5, "公寓", 3, 5, "套房", "一房", "abc123", "上架", "台北市", "大安區", 0.0f, 0.0f, new Timestamp(sDF.parse("2019-03-01").getTime()), "住家", new Timestamp(sDF.parse("2019-03-01").getTime()), 1);
			house1 = new House(null, "建國北路二段10號", 10, "電梯大樓", 5, 11, "套房", "一房", "bcd234", "審核", "台北市", "中山區", 0.0f, 0.0f, new Timestamp(sDF.parse("2019-03-01").getTime()), "住家", new Timestamp(sDF.parse("2019-03-01").getTime()), 1);
			house2 = new House(null, "仁愛路三段10號", 23, "電梯華廈", 3, 7, "整層住家", "3房2廳2衛", "cde345", "上架", "台北市", "信義區", 0.0f, 0.0f, new Timestamp(sDF.parse("2019-03-01").getTime()), "住家", new Timestamp(sDF.parse("2019-03-01").getTime()), 2);
			house3 = new House(null, "信義路四段10號", 30, "公寓", 3, 5, "整層住家", "3房2廳2衛", "def456", "下架", "台北市", "信義區", 0.0f, 0.0f, new Timestamp(sDF.parse("2019-03-01").getTime()), "住家", new Timestamp(sDF.parse("2019-03-01").getTime()), 2);
			
			houseDetail0 = new HouseDetail(null, "捷運中山國小電梯德惠四平陽光晴光新喜公園", "其他條件EX: 獨立電表一度5塊", 2, 300, new Date(sDF.parse("2019-03-15").getTime()), "一年", "電視，冰箱，熱水器，洗衣機", "床，衣櫃，椅子，桌子", "管理費", "近便利商店，近傳統市場", null, 5000);
			houseDetail1 = new HouseDetail(null, "高檔獨立套房鄰近捷運站環境單純限女性", "其他條件EX: 獨立電表一度5塊", 1, 1050, new Date(sDF.parse("2019-03-15").getTime()), "一年", "電視，冰箱，熱水器，洗衣機", "床，衣櫃，椅子，桌子", null, "近便利商店，近傳統市場", null, 10000);
			houseDetail2= new HouseDetail(null, "微風商圈中山女中北科大學生上班族皆適合", "其他條件EX: 獨立電表一度5塊", 2, 3000, new Date(sDF.parse("2019-03-15").getTime()), "一年", "電視，冰箱，熱水器，洗衣機", "床，衣櫃，椅子，桌子", "管理費", "近便利商店，近傳統市場", null, 23000);
			houseDetail3= new HouseDetail(null, "城市中歐洲城堡的日常!4米2魔幻空間!", "其他條件EX: 獨立電表一度5塊", 2, 4000, new Date(sDF.parse("2019-03-15").getTime()), "一年", "電視，冰箱，熱水器，洗衣機", "床，衣櫃，椅子，桌子", "管理費", "近便利商店，近傳統市場", null, 30000);
			
			employee = new Employee("master01", "!@Qa1234", "林忠明", "manager");
			
			forumR0 = new Forum(null, "Test00", "R0，TTTTTTTTT", new Timestamp(sDF.parse("2019-03-04").getTime()), "", null, null);
			forumR1 = new Forum(null,"Test01", "R1，TTTTTTTTT", new Timestamp(sDF.parse("2019-03-05").getTime()), "", null, null);
			forumR2 = new Forum(null,"Test02", "R2，TTTTTTTTT", new Timestamp(sDF.parse("2019-03-06").getTime()), "", null, null);
			forumR3 = new Forum(null,"Test03", "R3，TTTTTTTTT", new Timestamp(sDF.parse("2019-03-06").getTime()), "", null, null);
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
		new CreateTable2().CreateTableAllPic(member0, house0, houseDetail0, housePic0,housePic00,housePic01,housePic02,housePic03, forumR0);
		new CreateTable2().CreateTableAllPic(member1, house1, houseDetail1, housePic1,housePic10,housePic11,housePic12,housePic13, forumR1);
//		new CreateTable2().CreateTableOther(member0, house0, houseDetail0, housePic0, forumR0);
//		new CreateTable2().CreateTableOther(member1, house1, houseDetail1, housePic1, forumR1);
		new CreateTable2().CreateTableOther(member2, house2, houseDetail2, housePic2, forumR2);
		new CreateTable2().CreateTableOther(member3, house3, houseDetail3, housePic3, forumR3);
		
		new CreateTable2().CloseFactory();
	}
	
}
