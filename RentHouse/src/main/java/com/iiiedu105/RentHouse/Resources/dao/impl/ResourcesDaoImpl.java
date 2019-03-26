package com.iiiedu105.RentHouse.Resources.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iiiedu105.RentHouse.Resources.dao.ResourcesDao;
import com.iiiedu105.RentHouse.model.House;
import com.iiiedu105.RentHouse.model.Member;
import com.iiiedu105.RentHouse.model.Reservation;
@Repository
public class ResourcesDaoImpl implements ResourcesDao{
	@Autowired
	SessionFactory factory;
	@Override
	public void addResources(Reservation product) {
		Session session = factory.getCurrentSession();
	    session.save(product);
		
	}
	@Override
	public House findById(Integer houseId) {
		Session session = factory.getCurrentSession();
		House houseBean = session.get(House.class, houseId);
		return houseBean;	
	}
	@Override
	public Member getMemberById(String id) {
		Session session = factory.getCurrentSession();
		Member memberBean = session.get(Member.class, id);
		return memberBean;
	}
	@Override
	public List<Reservation> getReservation(Integer houseId) {
		Session session = factory.getCurrentSession();
		String hql ="FROM Reservation rt WHERE houseBean.id= :hid";
		List<Reservation> gRt = new ArrayList<Reservation>();
		gRt = session.createQuery(hql).setParameter("hid", houseId).getResultList();
		return gRt;
	}//利用房屋ID查詢預約資料
	@Override
	public void updateReservation(Integer id) {
		Session session =factory.getCurrentSession();
		String hql ="UPDATE Reservation rt SET rt.confirm='同意' where rt.id = :hid ";
		session.createQuery(hql).setParameter("hid", id).executeUpdate();
	}
	@Override
	public List<Integer> findByHId(String memberId) {
		Session session = factory.getCurrentSession();
		String hql ="SELECT h.id FROM  House h WHERE memberBean.id= :mid";
		List<Integer>hId= new ArrayList<Integer>();
		hId= session.createQuery(hql).setParameter("mid", memberId).getResultList();
		return hId;
	}//查詢房東的物件

}
