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
public class Chat {
	
	private Integer id;
	private String memberIdSend;
	private String memberIdRead;
	private String msg;
	private Timestamp datetime;

	private Member memberBeanSend;
	private Member memberBeanRead;
	
	public Chat() {
	}

	public Chat(Integer id, String memberIdSend, String memberIdRead, String msg, Timestamp datetime) {
		super();
		this.id = id;
		this.memberIdSend = memberIdSend;
		this.memberIdRead = memberIdRead;
		this.msg = msg;
		this.datetime = datetime;
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
	public String getMemberIdSend() {
		return memberIdSend;
	}

	public void setMemberIdSend(String memberIdSend) {
		this.memberIdSend = memberIdSend;
	}

	@Transient
	public String getMemberIdRead() {
		return memberIdRead;
	}

	public void setMemberIdRead(String memberIdRead) {
		this.memberIdRead = memberIdRead;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Timestamp getDatetime() {
		return datetime;
	}

	public void setDatetime(Timestamp datetime) {
		this.datetime = datetime;
	}

	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="Member_Id_Send")
	public Member getMemberBeanSend() {
		return memberBeanSend;
	}

	public void setMemberBeanSend(Member memberBeanSend) {
		this.memberBeanSend = memberBeanSend;
	}
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="Member_Id_Read")
	public Member getMemberBeanRead() {
		return memberBeanRead;
	}

	public void setMemberBeanRead(Member memberBeanRead) {
		this.memberBeanRead = memberBeanRead;
	}

}
