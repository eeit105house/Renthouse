package com.iiiedu105.RentHouse.house.dao;

import java.util.List;

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
	public HousePic getPicById(Integer picId);
	public List<Integer> getPicIdsByHouse(House houseBean);
	public List<House> getHousesByMemberId(String id);
	public void updateHouseDetail(HouseDetail forUpdateDetailBean,Integer houseId);
	public void updatePicture(HousePic housePicBean);
	public HousePic getPictureIdByHouseAndPicNo(House houseBean,Integer picNo);
}
