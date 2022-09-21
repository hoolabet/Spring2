package org.spring2.model;

public class CouponVO {
	private int cpno;
	private String cptype;
	private String cpname;
	private int cpvalue;
	private int cpmax;
	private int cpreq;
	public int getCpno() {
		return cpno;
	}
	public void setCpno(int cpno) {
		this.cpno = cpno;
	}
	public String getCptype() {
		return cptype;
	}
	public void setCptype(String cptype) {
		this.cptype = cptype;
	}
	public String getCpname() {
		return cpname;
	}
	public void setCpname(String cpname) {
		this.cpname = cpname;
	}
	public int getCpvalue() {
		return cpvalue;
	}
	public void setCpvalue(int cpvalue) {
		this.cpvalue = cpvalue;
	}
	public int getCpmax() {
		return cpmax;
	}
	public void setCpmax(int cpmax) {
		this.cpmax = cpmax;
	}
	public int getCpreq() {
		return cpreq;
	}
	public void setCpreq(int cpreq) {
		this.cpreq = cpreq;
	}
	@Override
	public String toString() {
		return "CouponVO [cpno=" + cpno + ", cptype=" + cptype + ", cpname=" + cpname + ", cpvalue=" + cpvalue
				+ ", cpmax=" + cpmax + ", cpreq=" + cpreq + "]";
	}
	
	
}
