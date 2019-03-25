package com.iiiedu105.RentHouse.model;

import java.sql.Clob;
import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table
public class HouseDetail {
	private Integer id;
	private String title;
	private Clob info;
	private Integer deposit;
	private Integer hoaFee;
	private Date movingIn;
	private String shortest;
	private String appliance;
	private String furniture;
	private String include;
	private String le;
	private String indetity;
	private Integer price;
	
	
	private House houseBean;
	
	public HouseDetail() {
	}
	

	public HouseDetail(Integer id, String title,  Clob info, Integer deposit, Integer hoaFee, Date movingIn,
			String shortest, String appliance, String furniture, String include, String le, String indetity,
			Integer price) {
		super();
		this.id = id;
		this.title = title;
		this.info = info;
		this.deposit = deposit;
		this.hoaFee = hoaFee;
		this.movingIn = movingIn;
		this.shortest = shortest;
		this.appliance = appliance;
		this.furniture = furniture;
		this.include = include;
		this.le = le;
		this.indetity = indetity;
		this.price = price;
	}

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Clob getInfo() {
		return info;
	}


	public void setInfo(Clob info) {
		this.info = info;
	}


	public Integer getDeposit() {
		return deposit;
	}

	public void setDeposit(Integer deposit) {
		this.deposit = deposit;
	}

	public Integer getHoaFee() {
		return hoaFee;
	}

	public void setHoaFee(Integer hoaFee) {
		this.hoaFee = hoaFee;
	}

	public Date getMovingIn() {
		return movingIn;
	}

	public void setMovingIn(Date movingIn) {
		this.movingIn = movingIn;
	}

	public String getShortest() {
		return shortest;
	}

	public void setShortest(String shortest) {
		this.shortest = shortest;
	}

	public String getAppliance() {
		return appliance;
	}

	public void setAppliance(String appliance) {
		this.appliance = appliance;
	}

	public String getFurniture() {
		return furniture;
	}

	public void setFurniture(String furniture) {
		this.furniture = furniture;
	}

	public String getInclude() {
		return include;
	}

	public void setInclude(String include) {
		this.include = include;
	}

	public String getLe() {
		return le;
	}

	public void setLe(String le) {
		this.le = le;
	}

	public String getIndetity() {
		return indetity;
	}

	public void setIndetity(String indetity) {
		this.indetity = indetity;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="House_Id")
	public House getHouseBean() {
		return houseBean;
	}

	public void setHouseBean(House houseBean) {
		this.houseBean = houseBean;
	}
	
	
}
