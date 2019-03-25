package com.iiiedu105.RentHouse.model;

import java.sql.Clob;
import java.sql.Timestamp;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
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
public class Forum {
	private Integer id;
	private String title;
	private Clob content;
	private String sort;	
	private Timestamp datetime;
	private String status;
	private String memberId;
//	private Integer frId; //[FR_id(回文關聯主鍵)]
	
	private Member memberBean;
	private Forum forumBean;
	private Set<ForumReply> forumReplyBeans = new LinkedHashSet<ForumReply>();
	private Set<ForumReport> forumReportBeans = new LinkedHashSet<ForumReport>();
	
	public Forum() {
	}

	public Forum(Integer id, String title, Clob content, Timestamp datetime, String sort, String status, String memberId) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.datetime = datetime;
		this.sort = sort;
		this.status = status;
		this.memberId = memberId;
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

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public Timestamp getDatetime() {
	
		return datetime;
	}

	public void setDatetime(Timestamp datetime) {
		datetime = datetime;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	
	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="Member_Id")
	public Member getMemberBean() {
		return memberBean;
	}

	public void setMemberBean(Member memberBean) {
		this.memberBean = memberBean;
	}
	
	@OneToMany(mappedBy="forumBean",cascade=CascadeType.ALL)
	public Set<ForumReply> getForumReplyBeans() {
		return forumReplyBeans;
	}

	public void setForumReplyBeans(Set<ForumReply> forumReplyBeans) {
		this.forumReplyBeans = forumReplyBeans;
	}
	
	@OneToMany(mappedBy="forumBean",cascade=CascadeType.ALL)
	public Set<ForumReport> getForumReportBeans() {
		return forumReportBeans;
	}

	public void setForumReportBeans(Set<ForumReport> forumReportBeans) {
		this.forumReportBeans = forumReportBeans;
	}
	@OneToMany(mappedBy="forumBean",cascade=CascadeType.ALL)
	public Forum getForumBeans(Forum forumBeans) {
		return forumBeans;
	}
	
	public void setForumBeans(Forum forumBeans) {		
		this.forumBean = forumBeans;
	}
	
}
