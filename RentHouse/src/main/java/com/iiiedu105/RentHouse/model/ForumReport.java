package com.iiiedu105.RentHouse.model;

import java.sql.Clob;
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
	private Clob content;
	private Timestamp datetime;
	private String status;
	
	private Forum forumBean;
	private Member memberBean;
	
	public ForumReport() {
	}
	public ForumReport(Integer id, Integer forumId, String type, Clob content, Timestamp datetime, String status,
			Forum forumBean, Member memberBean) {
		super();
		this.id = id;
		this.forumId = forumId;
		this.type = type;
		this.content = content;
		this.datetime = datetime;
		this.status = status;
		this.forumBean = forumBean;
		this.memberBean = memberBean;
	}
	public ForumReport(Integer id, Integer forumId, String type, Clob content, Timestamp datetime, String status) {
		super();
		this.id = id;
		this.forumId = forumId;
		this.type = type;
		this.content = content;
		this.datetime = datetime;
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

	public Timestamp getDatetime() {
		return datetime;
	}


	public Clob getContent() {
		return content;
	}
	public void setContent(Clob content) {
		this.content = content;
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
