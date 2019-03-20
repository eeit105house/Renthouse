package com.iiiedu105.RentHouse.house.service;

import java.util.List;

import com.iiiedu105.RentHouse.model.House;
import com.iiiedu105.RentHouse.model.HouseDetail;
import com.iiiedu105.RentHouse.model.HousePic;
import com.iiiedu105.RentHouse.model.Member;

public interface HouseService {
	public House findById(Integer houseId);
	public void insertHouse(House houseBean);
	public void insertDetail(HouseDetail detailBean);
	public void insertPicture(HousePic housePicBean);

	public Member getMemberById(String id);
	public HousePic getPicById(Integer picId);
	public List<Integer> getPicIdsByHouse(House houseBean);
	public List<House> getHousesByMemberId(String id);
	public void updateHouseDetail(HouseDetail detailBean,Integer houseId);
	public void updatePictureByHouseIdAndPicNo(HousePic housePicBean);
}
