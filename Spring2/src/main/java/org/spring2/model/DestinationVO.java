package org.spring2.model;

public class DestinationVO {
	private String id;
	private int dno;
	private String dname;
	private String name;
	private String phone;
	private String address;
	private String dmemo;
	
	public int getDno() {
		return dno;
	}
	public void setDno(int dno) {
		this.dno = dno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getDmemo() {
		return dmemo;
	}
	public void setDmemo(String dmemo) {
		this.dmemo = dmemo;
	}
	@Override
	public String toString() {
		return "DestinationVO [id=" + id + ", dno=" + dno + ", dname=" + dname + ", name=" + name + ", phone=" + phone
				+ ", address=" + address + ", dmemo=" + dmemo + "]";
	}
	
	
}
