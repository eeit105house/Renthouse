package com.iiiedu105.RentHouse.house.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iiiedu105.RentHouse.house.dao.HouseDao;
import com.iiiedu105.RentHouse.model.House;
import com.iiiedu105.RentHouse.model.HouseDetail;
import com.iiiedu105.RentHouse.model.HousePic;
import com.iiiedu105.RentHouse.model.Member;

@Repository
public class HouseDaoImpl implements HouseDao {
	SessionFactory factory;

	public SessionFactory getFactory() {
		return factory;
	}

	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	public HouseDaoImpl() {
	}

	@Override
	public House findById(Integer houseId) {
		Session session = factory.getCurrentSession();
		House houseBean = session.get(House.class, houseId);
		return houseBean;
	}

	@Override
	public void insertHouse(House houseBean) {
		Session session = factory.getCurrentSession();
		Member memberBean = getMemberById(houseBean.getMemberId());
		houseBean.setMemberBean(memberBean);
		session.save(houseBean);
	}

	@Override
	public void insertDetail(HouseDetail detailBean) {
		Session session = factory.getCurrentSession();
		session.save(detailBean);
	}

	@Override
	public void insertPicture(HousePic housePicBean) {
		Session session = factory.getCurrentSession();
		String hql = "FROM HousePic WHERE houseBean = :hID AND  picNo = :pNo";
		List<HousePic> checkPic = session.createQuery(hql).setParameter("hID", housePicBean.getHouseBean())
				.setParameter("pNo", housePicBean.getPicNo()).getResultList();
		if (checkPic.isEmpty())
			session.save(housePicBean);
		else {
			String hqlUp = "UPDATE HousePic hp SET hp.pic = :pic WHERE houseBean = :hID AND picNo = :pNo";
			session.createQuery(hqlUp)
			.setParameter("pic", housePicBean.getPic())
			.setParameter("hID", housePicBean.getHouseId())
			.setParameter("pNo", housePicBean.getPicNo())
			.executeUpdate();
		}
			
	}
	@Override
	public Member getMemberById(String id) {
		Session session = factory.getCurrentSession();
		Member memberBean = session.get(Member.class, id);
		return memberBean;
	}

}
