package com.iiiedu105.RentHouse.furniture.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iiiedu105.RentHouse.furniture.dao.FurnitureDao;
import com.iiiedu105.RentHouse.model.Furniture;
import com.iiiedu105.RentHouse.model.House;
import com.iiiedu105.RentHouse.model.Member;

@Repository
public class FurnitureDaoImpl implements FurnitureDao {
	SessionFactory factory;

	public SessionFactory getFactory() {
		return factory;
	}

	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}
	
	public FurnitureDaoImpl() {
	}

	@Override
	public Furniture findById(Integer fuId) {
		Session session = factory.getCurrentSession();
		Furniture furnitureBean = session.get(Furniture.class, fuId);
		return furnitureBean;
	}
	@Override
	public void insertFurniture(Furniture fuurnitureBean) {
		Session session = factory.getCurrentSession();
		session.save(fuurnitureBean);
	}

	@Override
	public void updateFurniture(Furniture fuurnitureBean) {
		Session session = factory.getCurrentSession();
		session.update(fuurnitureBean);
	}

	@Override
	public Member getMemberById(String id) {
		Session session = factory.getCurrentSession();
		Member memberBean = session.get(Member.class, id);
		return memberBean;
	}

	@Override
	public List<Furniture> getFurnituresByMemberId(String id) {
		Session session = factory.getCurrentSession();
		Member memberBean = session.get(Member.class, id);
//		String hql ="FROM House h WHERE :mId = h.memberBean";
//		List<House> houses = session.createQuery(hql).setParameter("mId", memberBean).getResultList();
		List<Furniture> furnitureBeans = new ArrayList<>(memberBean.getFurnitureBeans());

		return furnitureBeans;
	}

	@Override
	public List<Furniture> getFurnituresOrderbyId() {
		String hql = "FROM Furniture fu ORDER BY fu.id";
		Session session = factory.getCurrentSession();
		List<Furniture> furnitureBeans = new ArrayList<>();
		furnitureBeans = session.createQuery(hql).getResultList();
		return furnitureBeans;
	}

	@Override
	public List<Furniture> getFurnituresOrderbyType(String type) {
		String hql = "FROM Furniture fu WHERE :type = fu.type ORDER BY fu.id";
		Session session = factory.getCurrentSession();
		List<Furniture> furnitureBeans = new ArrayList<>();
		furnitureBeans = session.createQuery(hql).setParameter("type", type).getResultList();
		return furnitureBeans;
	}
	
}
