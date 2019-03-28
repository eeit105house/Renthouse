package com.iiiedu105.RentHouse.listHouse.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iiiedu105.RentHouse.listHouse.dao.SearchHouseByConditionDao;
import com.iiiedu105.RentHouse.model.HousePic;

@Repository
public class SearchHouseByConditionDaoImpl implements SearchHouseByConditionDao {
	
	@Autowired
	SessionFactory factory;
	
	public SearchHouseByConditionDaoImpl() {
	}
	
	@SuppressWarnings("unchecked")
	public List<Object[]> reObjectMethod(String hql) {
		List<Object[]> list = new ArrayList<>();		
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).list();
	
		return list;
	}
	
	
	@Override
	public List<Object[]> getAllhouse() {
				String hql = "select hp.id,hd.title,h.type,h.sqft,h.floor,h.topFloor,h.boroughs,h.addr,m.name,hd.price ,h.launched ,h.lat, h.lon,h.id " + 
				"from House h,HouseDetail hd,Member m ,HousePic hp " + 
				"where h.memberBean = m.id " + 
				"	  and h.status = '上架' " + 
				"	  and hp.picNo = 0 " + 
				"	  and h.id = hd.houseBean " + 
				"	  and h.id = hp.houseBean " + 
				"order by h.pay";
		return reObjectMethod(hql);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> getAllVipHouse() {
		String hql = "select hp.id,hd.title,h.type,h.sqft,h.floor,h.topFloor,h.boroughs,h.addr,m.name,hd.price ,h.launched ,h.lat, h.lon,h.id " + 
				"from House h,HouseDetail hd,Member m ,HousePic hp " + 
				"where h.memberBean = m.id " + 
				"	  and h.status = '上架' " + 
				"	  and hp.picNo = 0 " + 
				"	  and h.pay = 2 " + 
				"	  and h.id = hd.houseBean " + 
				"	  and h.id = hp.houseBean " + 
				"order by h.launched DESC";
		List<Object[]> list = new ArrayList<>();		
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).setMaxResults(20).list();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> gethouse() {
				String hql ="select h.id,h.city,h.boroughs,h.addr,h.layout,h.lat,h.lon,h.id from house h";
				List<Object[]> list = new ArrayList<>();		
				Session session = factory.getCurrentSession();
				list = session.createQuery(hql).list();
		return list;
	}
	
	@Override
	public HousePic getHousePicById(Integer id) {
		HousePic housePic = null;
		
		Session session = factory.getCurrentSession();
		housePic = session.get(HousePic.class,id);
		return housePic;
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<HousePic> getAllHousePic() {
		List<HousePic> list = new ArrayList<>();
		String hql = "From HousePic";
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).list();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> getHouseByCriteria(String Searchcriteria) {
		List<Object[]> list = new ArrayList<>();
		String hql = "select hp.id,hd.title,h.type,h.sqft,h.floor,h.topFloor,h.boroughs,h.addr,m.name,hd.price ,h.launched ,h.lat,h.lon,h.id " + 
				"from House h,HouseDetail hd,Member m ,HousePic hp " + 
				"where h.memberBean = m.id " + 
				"	  and h.status = '上架' " + 
				"	  and hp.picNo = 0 " + 
				"	  and h.id = hd.houseBean " + 
				"	  and h.id = hp.houseBean " + 
				Searchcriteria + 
				"order by h.pay";
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).list();
		return list;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> getHouseByMsg(String msg) {
		List<Object[]> list = new ArrayList<>();
		String hql = "select hp.id,hd.title,h.type,h.sqft,h.floor,h.topFloor,h.boroughs,h.addr,m.name,hd.price ,h.launched ,h.lat,h.lon,h.id " + 
				"from House h,HouseDetail hd,Member m ,HousePic hp " + 
				"where h.memberBean = m.id " + 
				"	  and h.status = '上架' " + 
				"	  and hp.picNo = 0 " + 
				"	  and h.id = hd.houseBean " + 
				"	  and h.id = hp.houseBean " + 
				msg + 
				"order by h.pay";
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).list();
		return list;
	}

}
