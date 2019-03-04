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
public class Reservation {
	private Integer id;
	private Timestamp datetime;
	private String status;
	private String memberId; //[Res_lodger(房客帳號)]
	private Integer houseId;
	private Integer score;
	private String readStatus;
	
	private Member memberBean;
	private House houseBean;
	
	public Reservation() {
	}
	
	
	public Reservation(Integer id, Timestamp datetime, String status, String memberId, Integer houseId, Integer score,
			String readStatus, Member memberBean, House houseBean) {
		super();
		this.id = id;
		this.datetime = datetime;
		this.status = status;
		this.memberId = memberId;
		this.houseId = houseId;
		this.score = score;
		this.readStatus = readStatus;
		this.memberBean = memberBean;
		this.houseBean = houseBean;
	}


	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Timestamp getDatetime() {
		return datetime;
	}

	public void setDatetime(Timestamp datetime) {
		this.datetime = datetime;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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

	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public String getReadStatus() {
		return readStatus;
	}

	public void setReadStatus(String readStatus) {
		this.readStatus = readStatus;
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
