package com.iiiedu105.RentHouse.backend.review.writings.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.iiiedu105.RentHouse.model.House;

@Repository
public class RWritingsDaoImpl implements RWritingsDao {
	@Autowired
	SessionFactory factory;
	@Override
	@SuppressWarnings("unchecked")
	public List<Object[]> getAllWritings(){
		String hql = 
				"";
		Session session = null;
		List<Object[]> list = null;
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();		
		return list;		
	}
	@Override
	public void passWritings(int id) {
		Session session = factory.getCurrentSession();
		String hql = 
		"update House h set h.status = '上架' where h.id = :hid";
		session.createQuery(hql).setParameter("hid", id).executeUpdate();	
	}
	@Override
	public void failWritings(int id) {
		Session session = factory.getCurrentSession();
		String hql = "update House h set h.status = '下架' where h.id = :hid";
		session.createQuery(hql).setParameter("hid", id).executeUpdate();			
	}
}
