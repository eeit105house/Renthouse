package com.iiiedu105.RentHouse.model;

import java.sql.Blob;
import java.sql.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table
public class Member {
	private String id;
	private String pwd;
	private String name;
	private String phone;
	private Date birthday;
	private String sex;
	private String personID;
	private String email;
	private String active;
	private Blob pic;
	private Double score;
	private String report;
	
	private Set<House> houseBeans = new LinkedHashSet<House>();
	private Set<HouseFavorite> houseFavoritesBeans = new LinkedHashSet<HouseFavorite>();
	private Set<HouseQA> houseQABeans = new LinkedHashSet<HouseQA>();
	private Set<Reservation> reservationBeans = new LinkedHashSet<Reservation>();
	private Set<Furniture> furnitureBeans = new LinkedHashSet<Furniture>();
	private Set<FurnitureFavorite> furnitureFavoriteseans = new LinkedHashSet<FurnitureFavorite>();
	private Set<Message> messageBeans = new LinkedHashSet<Message>(); 
	private Set<Chat> chatBeansSend = new LinkedHashSet<Chat>();
	private Set<Chat> chatBeansRead = new LinkedHashSet<Chat>();
	private Set<EmployeeReport> employeeReportBeans = new LinkedHashSet<EmployeeReport>();
	private Set<Forum> forumBeans = new LinkedHashSet<Forum>();
	private Set<ForumReply> ForumReplyBeans = new LinkedHashSet<ForumReply>();
	private Set<ForumReport> forumReportBeans = new LinkedHashSet<ForumReport>();
	
	public Member() {
	}

	public Member(String id, String pwd, String name, String phone, Date birthday, String sex, String personID,
		String email, String active, Blob pic, Double score, String report) {
	super();
	this.id = id;
	this.pwd = pwd;
	this.name = name;
	this.phone = phone;
	this.birthday = birthday;
	this.sex = sex;
	this.personID = personID;
	this.email = email;
	this.active = active;
	this.pic = pic;
	this.score = score;
	this.report = report;
}

	@Id
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getPwd() {
		return pwd;
	}
	
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getPhone() {
		return phone;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public Date getBirthday() {
		return birthday;
	}
	
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	
	public String getSex() {
		return sex;
	}
	
	public void setSex(String sex) {
		this.sex = sex;
	}
	
	public String getPersonID() {
		return personID;
	}
	
	public void setPersonID(String personID) {
		this.personID = personID;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getActive() {
		return active;
	}
	
	public void setActive(String active) {
		this.active = active;
	}
	
	public Blob getPic() {
		return pic;
	}
	
	public void setPic(Blob pic) {
		this.pic = pic;
	}
	
	
	public Double getScore() {
		return score;
	}

	public void setScore(Double score) {
		this.score = score;
	}

	public String getReport() {
		return report;
	}
	
	public void setReport(String report) {
		this.report = report;
	}
	
	@OneToMany(mappedBy="memberBean",cascade=CascadeType.ALL)
	public Set<House> getHouseBeans() {
		return houseBeans;
	}
	
	public void setHouseBeans(Set<House> houseBeans) {
		this.houseBeans = houseBeans;
	}
	
	@OneToMany(mappedBy="memberBean",cascade=CascadeType.ALL)
	public Set<HouseFavorite> getHouseFavoritesBeans() {
		return houseFavoritesBeans;
	}
	
	public void setHouseFavoritesBeans(Set<HouseFavorite> houseFavoritesBeans) {
		this.houseFavoritesBeans = houseFavoritesBeans;
	}
	
	@OneToMany(mappedBy="memberBean",cascade=CascadeType.ALL)
	public Set<HouseQA> getHouseQABeans() {
		return houseQABeans;
	}
	
	public void setHouseQABeans(Set<HouseQA> houseQABeans) {
		this.houseQABeans = houseQABeans;
	}
	
	@OneToMany(mappedBy="memberBean",cascade=CascadeType.ALL)
	public Set<Reservation> getReservationBeans() {
		return reservationBeans;
	}
	
	public void setReservationBeans(Set<Reservation> reservationBeans) {
		this.reservationBeans = reservationBeans;
	}
	
	@OneToMany(mappedBy="memberBean",cascade=CascadeType.ALL)
	public Set<Furniture> getFurnitureBeans() {
		return furnitureBeans;
	}
	
	public void setFurnitureBeans(Set<Furniture> furnitureBeans) {
		this.furnitureBeans = furnitureBeans;
	}
	
	@OneToMany(mappedBy="memberBean",cascade=CascadeType.ALL)
	public Set<FurnitureFavorite> getFurnitureFavoriteseans() {
		return furnitureFavoriteseans;
	}
	
	public void setFurnitureFavoriteseans(Set<FurnitureFavorite> furnitureFavoriteseans) {
		this.furnitureFavoriteseans = furnitureFavoriteseans;
	}
	
	@OneToMany(mappedBy="memberBean",cascade=CascadeType.ALL)
	public Set<Message> getMessageBeans() {
		return messageBeans;
	}
	
	public void setMessageBeans(Set<Message> messageBeans) {
		this.messageBeans = messageBeans;
	}
	
	@OneToMany(mappedBy="memberBeanSend",cascade=CascadeType.ALL)
	public Set<Chat> getChatBeansSend() {
		return chatBeansSend;
	}
	public void setChatBeansSend(Set<Chat> chatBeansSend) {
		this.chatBeansSend = chatBeansSend;
	}
	@OneToMany(mappedBy="memberBeanRead",cascade=CascadeType.ALL)
	public Set<Chat> getChatBeansRead() {
		return chatBeansRead;
	}
	public void setChatBeansRead(Set<Chat> chatBeansRead) {
		this.chatBeansRead = chatBeansRead;
	}
	@OneToMany(mappedBy="memberBean",cascade=CascadeType.ALL)
	public Set<EmployeeReport> getEmployeeReportBeans() {
		return employeeReportBeans;
	}
	
	public void setEmployeeReportBeans(Set<EmployeeReport> employeeReportBeans) {
		this.employeeReportBeans = employeeReportBeans;
	}
	
	@OneToMany(mappedBy="memberBean",cascade=CascadeType.ALL)
	public Set<Forum> getForumBeans() {
		return forumBeans;
	}
	
	public void setForumBeans(Set<Forum> forumBeans) {
		this.forumBeans = forumBeans;
	}

	@OneToMany(mappedBy="memberBean",cascade=CascadeType.ALL)
	public Set<ForumReply> getForumReplyBeans() {
		return ForumReplyBeans;
	}


	public void setForumReplyBeans(Set<ForumReply> forumReplyBeans) {
		ForumReplyBeans = forumReplyBeans;
	}

	@OneToMany(mappedBy="memberBean",cascade=CascadeType.ALL)
	public Set<ForumReport> getForumReportBeans() {
		return forumReportBeans;
	}

	public void setForumReportBeans(Set<ForumReport> forumReportBeans) {
		this.forumReportBeans = forumReportBeans;
	}

}
