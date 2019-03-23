package com.iiiedu105.RentHouse.house.service.impl;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iiiedu105.RentHouse.house.dao.HouseDao;
import com.iiiedu105.RentHouse.house.service.HouseService;
import com.iiiedu105.RentHouse.model.House;
import com.iiiedu105.RentHouse.model.HouseDetail;
import com.iiiedu105.RentHouse.model.HousePic;
import com.iiiedu105.RentHouse.model.Member;

@Service
@Transactional // 加在此視為所有方法
public class HouseServiceImpl implements HouseService {

	@Autowired
	HouseDao dao;

	public HouseServiceImpl() {
	}

	@Override
	public House findById(Integer houseId) {
		return dao.findById(houseId);
	}

	@Override
	public void insertHouse(House houseBean) {
		dao.insertHouse(houseBean);
	}

	@Override
	public void insertDetail(HouseDetail detailBean) {
		dao.insertDetail(detailBean);
	}

	@Override
	public void insertPicture(HousePic housePicBean) {
		housePicBean.setHouseBean(dao.findById(housePicBean.getHouseId()));
		dao.insertPicture(housePicBean);
	}

	@Override
	public Member getMemberById(String id) {
		return dao.getMemberById(id);
	}

	@Override
	public HousePic getPicById(Integer picId) {
		return dao.getPicById(picId);
	}

	@Override
	public List<Integer> getPicIdsByHouse(House houseBean) {
		return dao.getPicIdsByHouse(houseBean);
	}

	@Override
	public List<House> getHousesByMemberId(String id) {
		return dao.getHousesByMemberId(id);
	}

	@Override
	public void updateHouseDetail(HouseDetail detailBean, Integer houseId) {
		dao.updateHouseDetail(detailBean, houseId);
	}

//	@Override
//	public void updateHouseDetailByHouseId(Integer houseId, HouseDetail detailBean) {
//		dao.findById(houseId);
//	}
	@Override
	public void updatePictureByHouseIdAndPicNo(HousePic housePicBean) {
		House houseBean = dao.findById(housePicBean.getHouseId());
		HousePic housePicBeanQ = dao.getPictureIdByHouseAndPicNo(houseBean, housePicBean.getPicNo());
		if (housePicBeanQ == null) {
			housePicBean.setHouseBean(houseBean);
			dao.insertPicture(housePicBean);
		} else {
			housePicBeanQ.setPic(housePicBean.getPic());
			dao.updatePicture(housePicBeanQ);
		}
	}

	@Override
	public void updateHouse(House houseBean) {
		dao.updateHouse(houseBean);
	}

	@Override
	public void orderFinishied(Integer houseId, Timestamp timestamp, Integer pay) {
		House houseBean = dao.findById(houseId);
		houseBean.setStatus("審核");
		houseBean.setLaunched(timestamp);
		houseBean.setPay(pay);
	}

	@Override
	public Map<Integer, Integer> getPicNumberWithIdByIds(List<Integer> picIds) {
		Map<Integer, Integer> picNoWithId = new HashMap<>();
		for (Integer picId : picIds) {
			HousePic picBean = dao.getPicById(picId);
			Integer picNo = picBean.getPicNo();
//			if (picNo.equals(0)) {
//				Integer a = 11;
//				picNoWithId.put(a, picId);
//			}
//			else
				picNoWithId.put(picNo, picId);
			System.out.println(picNo + "," + picId);
		}
		return picNoWithId;
	}

	@Override
	public void dontPostHouseById(Integer houseId) {
		House houseBean = dao.findById(houseId);
		houseBean.setStatus("下架");
		houseBean.setLimiteDay(null);
		dao.updateHouse(houseBean);
	}
}
