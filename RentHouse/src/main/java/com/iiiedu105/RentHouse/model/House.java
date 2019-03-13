package com.iiiedu105.RentHouse.model;

import java.sql.Timestamp;
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
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table
public class House {

	private Integer id;
	private String addr;
	private Integer sqft;
	private String build;
	private Integer floor;
	private Integer topFloor;
	private String type;
	private String layout;
	private String memberId;
	private String status; //審核，上架、下架
	private String city;
	private String boroughs;
	private Float lat;
	private Float lon;
	private Timestamp launched;
	private String category;
	private Timestamp limiteDay;
	private Integer pay; //0：普通 1：VIP 2：高級VIP
	
	private Member memberBean;
	private HouseDetail detailBean;
	private Set<HousePic> pictureBeans = new LinkedHashSet<HousePic>();
	private Set<HouseQA> qaBeans = new LinkedHashSet<HouseQA>();
	private HouseDeal dealBean;
	private Set<Reservation> reservationBeans = new LinkedHashSet<Reservation>();
	private Set<HouseFavorite> houseFavoriteBeans = new LinkedHashSet<HouseFavorite>();
	
	
	public House() {
	}

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}
	public House(Integer id, String addr, Integer sqft, String build, Integer floor, Integer topFloor, String type,
			String layout, String memberId, String status, String city, String boroughs, Float lat, Float lon,
			Timestamp launched, String category, Timestamp limiteDay, Integer pay) {
		super();
		this.id = id;
		this.addr = addr;
		this.sqft = sqft;
		this.build = build;
		this.floor = floor;
		this.topFloor = topFloor;
		this.type = type;
		this.layout = layout;
		this.memberId = memberId;
		this.status = status;
		this.city = city;
		this.boroughs = boroughs;
		this.lat = lat;
		this.lon = lon;
		this.launched = launched;
		this.category = category;
		this.limiteDay = limiteDay;
		this.pay = pay;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public Integer getSqft() {
		return sqft;
	}
	public void setSqft(Integer sqft) {
		this.sqft = sqft;
	}
	public String getBuild() {
		return build;
	}
	public void setBuild(String build) {
		this.build = build;
	}
	public Integer getFloor() {
		return floor;
	}
	public void setFloor(Integer floor) {
		this.floor = floor;
	}
	public Integer getTopFloor() {
		return topFloor;
	}
	public void setTopFloor(Integer topFloor) {
		this.topFloor = topFloor;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getLayout() {
		return layout;
	}
	public void setLayout(String layout) {
		this.layout = layout;
	}
	@Transient
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getBoroughs() {
		return boroughs;
	}
	public void setBoroughs(String boroughs) {
		this.boroughs = boroughs;
	}
	public Float getLat() {
		return lat;
	}
	public void setLat(Float lat) {
		this.lat = lat;
	}
	public Float getLon() {
		return lon;
	}
	public void setLon(Float lon) {
		this.lon = lon;
	}
	public Timestamp getLaunched() {
		return launched;
	}
	public void setLaunched(Timestamp launched) {
		this.launched = launched;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Timestamp getLimiteDay() {
		return limiteDay;
	}
	public void setLimiteDay(Timestamp limiteDay) {
		this.limiteDay = limiteDay;
	}

	public Integer getPay() {
		return pay;
	}

	public void setPay(Integer pay) {
		this.pay = pay;
	}

	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="Member_Id")
	public Member getMemberBean() {
		return memberBean;
	}
	
	public void setMemberBean(Member memberBean) {
		this.memberBean = memberBean;
	}
	
	@OneToMany(mappedBy="houseBean",cascade=CascadeType.ALL)
	public Set<HousePic> getPictureBean() {
		return pictureBeans;
	}
	
	public void setPictureBean(Set<HousePic> pictureBean) {
		this.pictureBeans = pictureBean;
	}
	
	@OneToMany(mappedBy="houseBean",cascade=CascadeType.ALL)
	public Set<HouseQA> getQaBean() {
		return qaBeans;
	}
	
	public void setQaBean(Set<HouseQA> qaBean) {
		this.qaBeans = qaBean;
	}
	
	@OneToOne(mappedBy="houseBean",cascade=CascadeType.ALL)
	public HouseDetail getDetailBean() {
		return detailBean;
	}
	
	public void setDetailBean(HouseDetail detailBean) {
		this.detailBean = detailBean;
	}
	
	@OneToOne(mappedBy="houseBean",cascade=CascadeType.ALL)
	public HouseDeal getDealBean() {
		return dealBean;
	}
	
	public void setDealBean(HouseDeal dealBean) {
		this.dealBean = dealBean;
	}
	
	@OneToMany(mappedBy="houseBean",cascade=CascadeType.ALL)
	public Set<Reservation> getReservationBeans() {
		return reservationBeans;
	}
	
	public void setReservationBeans(Set<Reservation> reservationBeans) {
		this.reservationBeans = reservationBeans;
	}
	
	@OneToMany(mappedBy="houseBean",cascade=CascadeType.ALL)
	public Set<HouseFavorite> getHouseFavoriteBeans() {
		return houseFavoriteBeans;
	}
	
	public void setHouseFavoriteBeans(Set<HouseFavorite> houseFavoriteBeans) {
		this.houseFavoriteBeans = houseFavoriteBeans;
	}
	
}
