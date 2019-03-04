package com.iiiedu105.RentHouse.model;

import java.sql.Blob;
import java.sql.Date;

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
public class HouseDeal {
	
	private Integer id;
	private Integer houseId;
	private Date dealDate;
	private Date leaseDate;
	private Integer dealPrice;
	private Blob pdf;
	
	private House houseBean;

	public HouseDeal() {
	}
	
	
	public HouseDeal(Integer id, Integer houseId, Date dealDate, Date leaseDate, Integer dealPrice, Blob pdf) {
		super();
		this.id = id;
		this.houseId = houseId;
		this.dealDate = dealDate;
		this.leaseDate = leaseDate;
		this.dealPrice = dealPrice;
		this.pdf = pdf;
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

	public Date getDealDate() {
		return dealDate;
	}

	public void setDealDate(Date dealDate) {
		this.dealDate = dealDate;
	}

	public Date getLeaseDate() {
		return leaseDate;
	}

	public void setLeaseDate(Date leaseDate) {
		this.leaseDate = leaseDate;
	}

	public Integer getDealPrice() {
		return dealPrice;
	}

	public void setDealPrice(Integer dealPrice) {
		this.dealPrice = dealPrice;
	}

	public Blob getPdf() {
		return pdf;
	}

	public void setPdf(Blob pdf) {
		this.pdf = pdf;
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
