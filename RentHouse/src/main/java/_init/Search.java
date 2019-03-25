package _init;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.google.gson.Gson;
import com.iiiedu105.RentHouse.model.House;
import com.iiiedu105.RentHouse.model.HouseDeal;
import com.iiiedu105.RentHouse.model.Member;

import _init.util.HibernateUtils;

public class Search {

	@SuppressWarnings("unchecked")
	public static void main(String[] args) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction tx = null;		
		try {
			tx = session.beginTransaction();
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			Map<Integer,List<HouseDeal>> hdMap = new HashMap<>();
			String memberId = "abc123";
			String hql = "";
			Integer i = 0;
			
			Member mb = session.get(Member.class, memberId);
			Set<House> hb = mb.getHouseBeans();
			Iterator<House> hbit = hb.iterator();
			while(hbit.hasNext()) {
				Integer hid = hbit.next().getId();
				System.out.println("hid="+hid);
				hql = "from HouseDeal hd where hd.houseBean.id= :hid";
				List<HouseDeal> hd = session.createQuery(hql).setParameter("hid", hid).list();
				for(HouseDeal houseDeal : hd) {
					System.out.println("id="+houseDeal.getId());
				}
				hdMap.put(i, hd);
				i++;
			}
			System.out.println(hdMap);
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			tx.commit();
		}catch(Exception e) {
			if(tx != null) tx.rollback();
			e.printStackTrace();
		}
		

	}

}
