package com.iiiedu105.RentHouse.model;

import java.sql.Timestamp;

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
public class HouseQA {
	private Integer id;
	private String msg;
	private Timestamp dateTime;
	private Integer houseId;
	private String memberId;

	private House houseBean;
	private Member memberBean;
	public HouseQA() {
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Timestamp getDateTime() {
		return dateTime;
	}
	public void setDateTime(Timestamp dateTime) {
		this.dateTime = dateTime;
	}
	@Transient
	public Integer getHouseId() {
		return houseId;
	}
	public void setHouseId(Integer houseId) {
		this.houseId = houseId;
	}
	@Transient
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="House_Id")
	public House getHouseBean() {
		return houseBean;
	}
	public void setHouseBean(House houseBean) {
		this.houseBean = houseBean;
	}
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="Member_Id")
	public Member getMemberBean() {
		return memberBean;
	}
	public void setMemberBean(Member memberBean) {
		this.memberBean = memberBean;
	}
	 
}
