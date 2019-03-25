package com.iiiedu105.RentHouse.deal.dao.Impl;


import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.iiiedu105.RentHouse.deal.dao.HouseDealDao;
import com.iiiedu105.RentHouse.model.House;
import com.iiiedu105.RentHouse.model.HouseDeal;

@Repository
public class HouseDealDaoImpl implements HouseDealDao {
	
	@Autowired
	SessionFactory factory;
	
	public HouseDealDaoImpl() {
	}

	@Override
	public House getHouseByHouseId(int houseId) {
		Session session = factory.getCurrentSession();
		House hd = session.get(House.class, houseId);	
		return hd;
	}

	public void addHouseDeal(HouseDeal houseDeal) {
		Session session = factory.getCurrentSession();
		session.save(houseDeal);
	}
	
	@SuppressWarnings("unchecked")
	public List<HouseDeal> getHouseDealByHouseId(int houseId) {
		Session session = factory.getCurrentSession();
		List<HouseDeal> hd = null;
		String hql = "from HouseDeal hd where hd.houseBean.id = :houseId";
		hd = session.createQuery(hql).setParameter("houseId", houseId).list();
		return hd;	
	}

	@Override
	public void updateHouseDeal(HouseDeal houseDeal) {
		Session session = factory.getCurrentSession();
		session.update(houseDeal);	
	}
	@Override
	public HouseDeal getHouseDealById(int id) {
		Session session = factory.getCurrentSession();
		HouseDeal houseDeal = session.get(HouseDeal.class, id);
		return houseDeal;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<House> getAllHouseByMemberId(String memberId){
		List<House> houseList = new ArrayList<>();
		Session session = factory.getCurrentSession();
		String hql = "from House h where h.memberBean.id = :memberId";
		houseList = session.createQuery(hql).setParameter("memberId", memberId).list();
		return houseList;
	}

}
