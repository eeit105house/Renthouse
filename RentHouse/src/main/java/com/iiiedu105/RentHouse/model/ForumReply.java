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
public class ForumReply {
	private Integer id;
	private String title;
	private Clob content;
	private Timestamp datetime;
	private String status;
	private String memberId;
	private Integer frId; //[FR_id(回文關聯主鍵)]
	
	private Forum forumBean;
	private Member memberBean;

	public ForumReply(Integer id, String title, Clob content, Timestamp datetime, String status,
			String memberId, Integer frId) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.datetime = datetime;
		this.status = status;
		this.memberId = memberId;
		this.frId = frId;
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

	public Clob getContent() {
		return content;
	}
	public void setContent(Clob content) {
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
	@Transient
	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Transient
	public Integer getFrId() {
		return frId;
	}

	public void setFrId(Integer frId) {
		this.frId = frId;
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
