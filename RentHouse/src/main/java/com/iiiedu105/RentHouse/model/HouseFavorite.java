package com.iiiedu105.RentHouse.model;

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
public class HouseFavorite {
	
	private Integer id;
	private String memberId;
	private Integer houseId;
	
	private Member memberBean;
	private House houseBean;
	public HouseFavorite() {
	}
	public HouseFavorite(Integer id, String memberId, Integer houseId) {
		super();
		this.id = id;
		this.memberId = memberId;
		this.houseId = houseId;
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
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	@Transient
	public Integer getHouseId() {
		return houseId;
	}
	public void setHouseId(Integer houseId) {
		this.houseId = houseId;
	}
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="Member_Id")
	public Member getMemberBean() {
		return memberBean;
	}
	public void setMemberBean(Member memberBean) {
		this.memberBean = memberBean;
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
