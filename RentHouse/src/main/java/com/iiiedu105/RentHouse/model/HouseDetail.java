package com.iiiedu105.RentHouse.model;

import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table
public class HouseDetail {
	private Integer id;
	private String title;
	private String info;
	private Integer deposit;
	private Integer hoaFee;
	private Date movingIn;
	private String shortest;
	private Integer appliance;
	private Integer furniture;
	private Integer include;
	private Integer le;
	private Integer indetity;
	private Integer price;
	
	private House houseBean;
	
	public HouseDetail() {
	}

	public HouseDetail(Integer id, String title, String info, Integer deposit, Integer hoaFee, Date movingIn,
			String shortest, Integer appliance, Integer furniture, Integer include, Integer le, Integer indetity,
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

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
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

	public Integer getAppliance() {
		return appliance;
	}

	public void setAppliance(Integer appliance) {
		this.appliance = appliance;
	}

	public Integer getFurniture() {
		return furniture;
	}

	public void setFurniture(Integer furniture) {
		this.furniture = furniture;
	}

	public Integer getInclude() {
		return include;
	}

	public void setInclude(Integer include) {
		this.include = include;
	}

	public Integer getLe() {
		return le;
	}

	public void setLe(Integer le) {
		this.le = le;
	}

	public Integer getIndetity() {
		return indetity;
	}

	public void setIndetity(Integer indetity) {
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
