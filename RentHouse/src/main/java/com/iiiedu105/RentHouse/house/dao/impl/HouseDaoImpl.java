package com.iiiedu105.RentHouse.house.dao.impl;

import java.util.ArrayList;
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
			.setParameter("hID", housePicBean.getHouseBean())
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

	@Override
	public HousePic getPicById(Integer picId) {
		Session session = factory.getCurrentSession();
		HousePic housePicBean = session.get(HousePic.class, picId);
		return housePicBean;
	}

	@Override
	public List<Integer> getPicIdsByHouse(House houseBean) {
		Session session = factory.getCurrentSession();
		String hql ="SELECT hp.id FROM  HousePic hp WHERE :hId = hp.houseBean ORDER BY hp.picNo ASC";
		List<Integer> picIds = new ArrayList<Integer>();
		picIds = session.createQuery(hql).setParameter("hId", houseBean).getResultList();
		return picIds;
	}

	@Override
	public List<House> getHousesByMemberId(String id) {
		Session session = factory.getCurrentSession();
		Member memberBean = session.get(Member.class, id);
//		String hql ="FROM House h WHERE :mId = h.memberBean";
//		List<House> houses = session.createQuery(hql).setParameter("mId", memberBean).getResultList();
		List<House> houseBeans = new ArrayList<>(memberBean.getHouseBeans());

		return houseBeans;
	}

	@Override
	public void updateHouseDetail(HouseDetail forUpdateDetailBean,Integer houseId) {
		Session session = factory.getCurrentSession();
		House houseBean = session.get(House.class, houseId);
		HouseDetail detailBean = houseBean.getDetailBean();
		detailBean.setAppliance(forUpdateDetailBean.getAppliance());
		detailBean.setDeposit(forUpdateDetailBean.getDeposit());
		detailBean.setFurniture(forUpdateDetailBean.getFurniture());
		detailBean.setHoaFee(forUpdateDetailBean.getHoaFee());
		detailBean.setInclude(forUpdateDetailBean.getInclude());
		detailBean.setIndetity(forUpdateDetailBean.getIndetity());
		detailBean.setInfo(forUpdateDetailBean.getInfo());
		detailBean.setLe(forUpdateDetailBean.getLe());
		detailBean.setMovingIn(forUpdateDetailBean.getMovingIn());
		detailBean.setPrice(forUpdateDetailBean.getPrice());
		detailBean.setShortest(forUpdateDetailBean.getShortest());
		detailBean.setTitle(forUpdateDetailBean.getTitle());
		session.update(detailBean);
	}

	@Override
	public void updatePicture(HousePic housePicBean) {
		Session session = factory.getCurrentSession();
		session.update(housePicBean);
	}

	@Override
	public HousePic getPictureIdByHouseAndPicNo(House houseBean, Integer picNo) {
		Session session = factory.getCurrentSession();
		String hql = "FROM  HousePic hp WHERE hp.houseBean = :house AND hp.picNo = :pNo";
		List<HousePic> pics = session.createQuery(hql).setParameter("house", houseBean).setParameter("pNo", picNo).getResultList();
		if(!pics.isEmpty())
			return pics.get(0);
		else
			return null;
	}

	@Override
	public void updateHouse(House houseBean) {
		Session session = factory.getCurrentSession();
		session.update(houseBean);
	}


}
