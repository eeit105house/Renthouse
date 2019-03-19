package _init;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.google.gson.Gson;

import _init.util.HibernateUtils;

public class Search {

	@SuppressWarnings("unchecked")
	public static void main(String[] args) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction tx = null;
		String hql = "select hp.id,hd.title,h.type,h.sqft,h.floor,h.topFloor,h.boroughs,h.addr,m.name,hd.price ,h.launched  ,h.lat,h.lon  " + 
				"from House h,HouseDetail hd,Member m ,HousePic hp " + 
				"where h.memberBean = m.id " + 
				"	  and h.status = '上架' " + 
				"	  and hp.picNo = 1 " + 
				"	  and h.id = hd.houseBean " + 
				"	  and h.id = hp.houseBean " + 
				"order by h.pay";
//		String hql = "select h.type From House h";
		try {
			tx = session.beginTransaction();
			List<Object[]> allHouseList = session.createQuery(hql).list();
			
			for(Object[] allHouse : allHouseList) {				
					System.out.println(allHouse);				
			}
			for(int i =0;i<5;i++) {
				System.out.println(allHouseList.get(i));	
			}

			tx.commit();
		} catch (Exception e) {
			tx.rollback();
		}

	}

}
