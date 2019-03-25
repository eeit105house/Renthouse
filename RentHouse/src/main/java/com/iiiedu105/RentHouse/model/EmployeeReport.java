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
public class EmployeeReport {
	
	private Integer id;
	private String memberId;
	private String employeeId;
	private String type;
	private String title;
	private Clob content;
	private Timestamp datetime;
	private String status;
	private Clob reply;
	
	private Member memberBean;
	private Employee employeeBean;
	
	public EmployeeReport() {
	}


	public EmployeeReport(Integer id, String memberId, String employeeId, String type, String title, Clob content,
			Timestamp datetime, String status, Clob reply) {
		super();
		this.id = id;
		this.memberId = memberId;
		this.employeeId = employeeId;
		this.type = type;
		this.title = title;
		this.content = content;
		this.datetime = datetime;
		this.status = status;
		this.reply = reply;
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

	
	@Transient
	public String getEmployeeId() {
		return employeeId;
	}


	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
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

	public Clob getReply() {
		return reply;
	}


	public void setReply(Clob reply) {
		this.reply = reply;
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
	@JoinColumn(name="Employee_Id")
	public Employee getEmployeeBean() {
		return employeeBean;
	}


	public void setEmployeeBean(Employee employeeBean) {
		this.employeeBean = employeeBean;
	}

	
}
