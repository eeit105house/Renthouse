package com.iiiedu105.RentHouse.backend.review.house.dao;

import java.sql.Timestamp;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.iiiedu105.RentHouse.model.House;

@Repository
public class OTShelfDaoImpl implements OTShelfDao {
	@Autowired
	SessionFactory factory;
	@Override
	@SuppressWarnings("unchecked")
	public List<House> getAllHouse(){
		String hql = 
				"FROM House h where h.status = '審核'";
		Session session = null;
		List<House> list = null;
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();		
		return list;		
	}
	@Override
	public void updateHouseStatus(Integer id) {
		Session session = factory.getCurrentSession();
		Timestamp launched = new Timestamp(new java.util.Date().getTime());
		Long newtime = new java.util.Date().getTime()+(long)60*60*24*30*1000;
		Timestamp limiteDay = new Timestamp(newtime);
		String hql = 
		"update House h set h.status = '上架',h.launched = :launched, h.limiteDay = :limiteDay where h.id = :hid";
		session.createQuery(hql).setParameter("hid", id)
								.setParameter("launched", launched)
								.setParameter("limiteDay", limiteDay)
								.executeUpdate();	
		
	}
	@Override
	public void deleteHouse(Integer id) {
		Session session = factory.getCurrentSession();
		String hql = "update House h set h.status = '下架' where h.id = :hid";
		session.createQuery(hql).setParameter("hid", id).executeUpdate();			
	}
}
