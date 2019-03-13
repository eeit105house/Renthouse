package com.iiiedu105.RentHouse.model;

import java.sql.Blob;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
@Entity
@Table
public class Employee {

	private String id;
	private String pwd;
	private String name;
	private String level;
	private Blob pic;
	
	
	private Set<EmployeeReport> employeeReportBeans = new LinkedHashSet<EmployeeReport>();
	
	public Employee() {
	}

	public Employee(String id, String pwd, String name, String level,Blob pic) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.level = level;
		this.pic = pic;
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

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}
	
	public Blob getPic() {
		return pic;
	}

	public void setPic(Blob pic) {
		this.pic = pic;
	}

	@OneToMany(mappedBy="employeeBean",cascade=CascadeType.ALL)
	public Set<EmployeeReport> getEmployeeReportBeans() {
		return employeeReportBeans;
	}

	public void setEmployeeReportBeans(Set<EmployeeReport> employeeReportBeans) {
		this.employeeReportBeans = employeeReportBeans;
	}

}
