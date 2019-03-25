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
	SessionFactory factory = null;
	Session session = null;
	
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
			tx.rollback();
			System.err.println("新增錯誤："+e.getMessage());
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
			
			forum.setForumBean(session.get(Forum.class, forum.getId()));
			forum.setMemberBean(session.get(Member.class,member.getId()));
			session.save(forum);
			session.flush();
			
			tx.commit();
		}catch (Exception e) {
			tx.rollback();
			System.err.println("新增錯誤："+e.getMessage());
		}
	}
	public void CloseFactory() {
		if(factory != null)
		factory.close();
	}
}
