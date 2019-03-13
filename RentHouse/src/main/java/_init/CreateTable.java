package _init;

import java.sql.Blob;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import _init.util.HibernateUtils;
import com.iiiedu105.RentHouse.model.*;
public class CreateTable {

	
	public static void main(String[] args) {
		Blob blob=null;
		SimpleDateFormat sDF = new SimpleDateFormat("yyyy-MM-dd");
		sDF.setLenient(false);
		
		Member member = null;
		Member member2 = null;
		House house = null ;
		HouseDetail houseDetail=null;
		Employee employee=null;
		Forum forum = null;
		Forum forumR1 = null;
		Forum forumR2 = null;
		try {
			member = new Member("abc123", "!@Qa1234", "王小明", "0987666555", new Date(sDF.parse("1990-01-05").getTime()), "男", "A123456789", "abc123@gmail.com", "一般", blob, 0.0, "");
			member2 = new Member("bcd456", "!@Qa1234", "李大明", "0987444333", new Date(sDF.parse("1990-01-05").getTime()), "男", "A123456789", "abc123@gmail.com", "一般", blob, 0.0, "");
			house = new House(null, "XX路XX號X樓", 5, "公寓", 3, 5, "套房", "一房", "abc123", "上架", "台北市", "中山區", 0.0f, 0.0f, new Timestamp(sDF.parse("2019-03-01").getTime()), "住家", new Timestamp(sDF.parse("2019-03-01").getTime()), 0);
			houseDetail = new HouseDetail(null, "測試房", "TestTestTestTest", 1000, 0, new Date(sDF.parse("2019-03-15").getTime()), "", null, null, null, null, null, 100);
			employee = new Employee("master01", "!@Qa1234", "林忠明", "manager",null);
			forum = new Forum(null, "Test01", "tttttttt", new Timestamp(sDF.parse("2019-03-04").getTime()), "", null, null);
			forumR1 = new Forum(null, null, "R1，TTTTTTTTT", new Timestamp(sDF.parse("2019-03-05").getTime()), "", null, null);
			forumR2 = new Forum(null, null, "R2，TTTTTTTTT", new Timestamp(sDF.parse("2019-03-06").getTime()), "", null, null);
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		 
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction tx = null;
		try {
			tx=session.beginTransaction();
			session.saveOrUpdate(member);
			session.saveOrUpdate(member2);
			session.saveOrUpdate(employee);
			session.flush();
			
			Member refMember = session.get(Member.class,member.getId());
			house.setMemberBean(refMember);
			session.save(house);
			session.flush();
			
			houseDetail.setHouseBean(session.get(House.class,house.getId()));
			session.save(houseDetail);
			session.flush();

			forum.setMemberBean(session.get(Member.class,member.getId()));
			session.save(forum);
			session.flush();

			forumR1.setForumBean(session.get(Forum.class, forum.getId()));
			forumR1.setMemberBean(session.get(Member.class,member2.getId()));
			session.save(forumR1);
			session.flush();
			
			forumR2.setForumBean(session.get(Forum.class, forum.getId()));
			forumR2.setMemberBean(session.get(Member.class,member.getId()));
			session.save(forumR2);
			session.flush();
			
			tx.commit();
		}catch (Exception e) {
			tx.rollback();
			System.err.println("新增錯誤："+e.getMessage());
		}
		factory.close();
	}

}
