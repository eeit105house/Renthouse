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
public class FurnitureFavorite {
	
	private Integer id;
	private String memberId;
	private Integer furnitureId;
	
	private Member memberBean;
	private Furniture furnitureBean;
	public FurnitureFavorite() {
	}
	public FurnitureFavorite(Integer id, String memberId, Integer furnitureId) {
		super();
		this.id = id;
		this.memberId = memberId;
		this.furnitureId = furnitureId;
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
	public Integer getfurnitureId() {
		return furnitureId;
	}
	public void setfurnitureId(Integer furnitureId) {
		this.furnitureId = furnitureId;
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
	@JoinColumn(name="Furniture_Id")
	public Furniture getFurnitureBean() {
		return furnitureBean;
	}
	public void setFurnitureBean(Furniture furnitureBean) {
		this.furnitureBean = furnitureBean;
	}

}
