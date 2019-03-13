package _init;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.iiiedu105.RentHouse.model.Employee;
import com.iiiedu105.RentHouse.model.Forum;
import com.iiiedu105.RentHouse.model.House;
import com.iiiedu105.RentHouse.model.HouseDetail;
import com.iiiedu105.RentHouse.model.HousePic;
import com.iiiedu105.RentHouse.model.Member;

import _init.util.HibernateUtils;

public class CreateTable2 {
	SessionFactory factory =null ;
	Session session =null; 
	
	public CreateTable2(){
		factory = HibernateUtils.getSessionFactory();
		session = factory.getCurrentSession();
	}
	

	public void CreateTableEmp(Employee employee) {
		Transaction tx = null;
		try {
			tx=session.beginTransaction();
			session.saveOrUpdate(employee);
			tx.commit();
		}catch (Exception e) {
			if(tx != null)
			tx.rollback();
			System.err.println("新增錯誤："+e.getMessage());
		}
	}
	public void createForumReportTable() {
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			
		}catch(Exception e) {
			
		}
	}
	public void CreateTableOther(Member member,House house,HouseDetail houseDetail,HousePic housePic,Forum forum) {	
		Transaction tx = null;
		try {
			tx=session.beginTransaction();
			session.saveOrUpdate(member);
			
			session.flush();

			Member refMember = session.get(Member.class,member.getId());
			house.setMemberBean(refMember);
			session.save(house);
			session.flush();
			
			forum.setMemberBean(session.get(Member.class,member.getId()));
			session.save(forum);
			session.flush();
			
			houseDetail.setHouseBean(session.get(House.class,house.getId()));
			session.save(houseDetail);
			session.flush();
			
			housePic.setHouseBean(session.get(House.class, house.getId()));
			session.save(housePic);
			session.flush();
			
			forum.setForumBean(session.get(Forum.class, forum.getId()));
//			forum.setMemberBean(session.get(Member.class,member.getId()));
			session.save(forum);
			session.flush();
			
//			forumReport.setForumBean(session.get(Forum.class, forumReport.getId()));
//			session.save(forumReport);
//			session.flush();
//			
//			forumReport.setMemberBean(session.get(Member.class,member.getId()));
//			session.save(forumReport);
//			session.flush();
			
			tx.commit();
		}catch (Exception e) {
			if(tx != null)
			tx.rollback();
			System.err.println("新增錯誤："+e.getMessage());
		}
	}
	public void CloseFactory() {
		if(factory != null)
		factory.close();
	}


	public void CreateTableAllPic(Member member, House house, HouseDetail houseDetail, HousePic housePic,
			HousePic housePic0, HousePic housePic1, HousePic housePic2, HousePic housePic3, Forum forum) {
		Transaction tx = null;
		try {
			tx=session.beginTransaction();
			session.saveOrUpdate(member);
			session.flush();

			Member refMember = session.get(Member.class,member.getId());
			house.setMemberBean(refMember);
			session.save(house);
			session.flush();
			
			forum.setMemberBean(session.get(Member.class,member.getId()));
			session.save(forum);
			session.flush();
			
			houseDetail.setHouseBean(session.get(House.class,house.getId()));
			session.save(houseDetail);
			session.flush();
			
			housePic.setHouseBean(session.get(House.class, house.getId()));
			session.save(housePic);
			session.flush();
			
			housePic0.setHouseBean(session.get(House.class, house.getId()));
			session.save(housePic0);
			session.flush();
			
			housePic1.setHouseBean(session.get(House.class, house.getId()));
			session.save(housePic1);
			session.flush();
			
			housePic2.setHouseBean(session.get(House.class, house.getId()));
			session.save(housePic2);
			session.flush();
			
			housePic3.setHouseBean(session.get(House.class, house.getId()));
			session.save(housePic3);
			session.flush();
			
			forum.setForumBean(session.get(Forum.class, forum.getId()));
//			forum.setMemberBean(session.get(Member.class,member.getId()));
			session.save(forum);
			session.flush();
			
//			forumReport.setForumBean(session.get(Forum.class, forumReport.getId()));
//			session.save(forumReport);
//			session.flush();
//			
//			forumReport.setMemberBean(session.get(Member.class,member.getId()));
//			session.save(forumReport);
//			session.flush();
//			
			tx.commit();
		}catch (Exception e) {
			if(tx != null)
			tx.rollback();
			System.err.println("新增錯誤："+e.getMessage());
		}	
		
	}

}