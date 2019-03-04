package com.iiiedu105.RentHouse.model;

import java.sql.Blob;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table
public class HousePic {

	private Integer id;
	private Integer houseId;
	private Blob pic;
	private Integer picNo;

	private House houseBean;
	
	public HousePic() {
	}
	
	
	public HousePic(Integer id, Integer houseId, Blob pic, Integer picNo) {
		super();
		this.id = id;
		this.setHouseId(houseId);
		this.pic = pic;
		this.picNo = picNo;
	}
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	@Transient
	public Integer getHouseId() {
		return houseId;
	}

	public void setHouseId(Integer houseId) {
		this.houseId = houseId;
	}


	public Blob getPic() {
		return pic;
	}

	public void setPic(Blob pic) {
		this.pic = pic;
	}

	public Integer getPicNo() {
		return picNo;
	}

	public void setPicNo(Integer picNo) {
		this.picNo = picNo;
	}

	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="House_Id")
	public House getHouseBean() {
		return houseBean;
	}

	public void setHouseBean(House houseBean) {
		this.houseBean = houseBean;
	}
	
}
