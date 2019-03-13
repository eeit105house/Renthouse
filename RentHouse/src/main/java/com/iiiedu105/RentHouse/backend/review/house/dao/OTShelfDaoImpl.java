package com.iiiedu105.RentHouse.backend.review.house.dao;

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
	public List<Object[]> getAllHouse(){
		String hql = 
				"SELECT m.id,h.addr,h.city,h.status,h.id FROM House h join Member m on h.memberBean = m.id where h.status = '審核'";
		Session session = null;
		List<Object[]> list = null;
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();		
		return list;		
	}
	@Override
	public void updateHouseStatus(int id) {
		Session session = factory.getCurrentSession();
		String hql = 
		"update House h set h.status = '上架' where h.id = :hid";
		session.createQuery(hql).setParameter("hid", id).executeUpdate();	
	}
	@Override
	public void deleteHouse(int id) {
		Session session = factory.getCurrentSession();
		String hql = "update House h set h.status = '下架' where h.id = :hid";
		session.createQuery(hql).setParameter("hid", id).executeUpdate();			
	}
}
