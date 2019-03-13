package com.iiiedu105.RentHouse.house.dao;

import com.iiiedu105.RentHouse.model.House;
import com.iiiedu105.RentHouse.model.HouseDetail;
import com.iiiedu105.RentHouse.model.HousePic;
import com.iiiedu105.RentHouse.model.Member;

public interface HouseDao {
	public House findById(Integer houseId);
	public void insertHouse(House houseBean);
	public void insertDetail(HouseDetail detailBean);
	public void insertPicture(HousePic housePicBean);
	public Member getMemberById(String id);
}
