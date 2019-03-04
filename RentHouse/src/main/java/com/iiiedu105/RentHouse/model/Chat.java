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
	private String memberIdA;
	private String memberIdB;
	private String msg;
	private Timestamp datetime;

	private Member memberBeanA;
	private Member memberBeanB;
	
	public Chat() {
	}

	public Chat(Integer id, String memberIdA, String memberIdB, String msg, Timestamp datetime) {
		super();
		this.id = id;
		this.memberIdA = memberIdA;
		this.memberIdB = memberIdB;
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
	public String getMemberIdA() {
		return memberIdA;
	}

	public void setMemberIdA(String memberIdA) {
		this.memberIdA = memberIdA;
	}

	@Transient
	public String getMemberIdB() {
		return memberIdB;
	}

	public void setMemberIdB(String memberIdB) {
		this.memberIdB = memberIdB;
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
	@JoinColumn(name="Member_Id_A")
	public Member getMemberBeanA() {
		return memberBeanA;
	}

	public void setMemberBeanA(Member memberBeanA) {
		this.memberBeanA = memberBeanA;
	}

	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="Member_Id_B")
	public Member getMemberBeanB() {
		return memberBeanB;
	}

	public void setMemberBeanB(Member memberBeanB) {
		this.memberBeanB = memberBeanB;
	}

}
