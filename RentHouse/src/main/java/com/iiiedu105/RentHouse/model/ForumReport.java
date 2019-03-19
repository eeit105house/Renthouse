package com.iiiedu105.RentHouse.model;

import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Column;
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
public class ForumReport {
	
	private Integer id;
	private Integer forumId;
	private String type;
	private String content;
	private Timestamp datetime;
	private String status;
	
	private Forum forumBean;
	private Member memberBean;
	
	public ForumReport() {
	}



	public ForumReport(Integer id, Integer forumId, String type, String content, Timestamp datetime,String status) {

		this.status = status;

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
	public Integer getForumId() {
		return forumId;
	}


	public void setForumId(Integer forumId) {
		this.forumId = forumId;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}

	@Column(columnDefinition="varchar(max)")
	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
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


	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="Forum_Id")
	public Forum getForumBean() {
		return forumBean;
	}

	public void setForumBean(Forum forumBean) {
		this.forumBean = forumBean;
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
