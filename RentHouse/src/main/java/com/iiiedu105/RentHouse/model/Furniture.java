package com.iiiedu105.RentHouse.model;

import java.sql.Blob;
import java.sql.Clob;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table
public class Furniture {
	
	private Integer id;
	private String title;
	private String type;
	private Integer price;
	private Clob info;
	private Blob photo;
	private String status;
	private String memberId;
	private String addr;
	private String delvery;
	
	private Member memberBean;	
	private Set<FurnitureFavorite> furnitureFavoriteBeans = new LinkedHashSet<FurnitureFavorite>();
	
	public Furniture() {
	}

	public Furniture(Integer id, String title, String type, Integer price, Clob info, Blob photo, String status,
			String memberId, String addr, String delvery) {
		super();
		this.id = id;
		this.title = title;
		this.type = type;
		this.price = price;
		this.info = info;
		this.photo = photo;
		this.status = status;
		this.memberId = memberId;
		this.addr = addr;
		this.delvery = delvery;
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Clob getInfo() {
		return info;
	}

	public void setInfo(Clob info) {
		this.info = info;
	}

	public Blob getPhoto() {
		return photo;
	}

	public void setPhoto(Blob photo) {
		this.photo = photo;
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

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getDelvery() {
		return delvery;
	}

	public void setDelvery(String delvery) {
		this.delvery = delvery;
	}

	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="Member_Id")
	public Member getMemberBean() {
		return memberBean;
	}

	public void setMemberBean(Member memberBean) {
		this.memberBean = memberBean;
	}

	@OneToMany(mappedBy="furnitureBean",cascade=CascadeType.ALL)
	public Set<FurnitureFavorite> getFurnitureFavoriteBeans() {
		return furnitureFavoriteBeans;
	}

	public void setFurnitureFavoriteBeans(Set<FurnitureFavorite> furnitureFavoriteBeans) {
		this.furnitureFavoriteBeans = furnitureFavoriteBeans;
	}
	
}
