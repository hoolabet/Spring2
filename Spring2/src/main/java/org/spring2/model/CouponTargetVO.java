package org.spring2.model;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class CouponTargetVO {
	private String id;
	private int cpno;
	private int pno;
	private String exp_date;
	
	public CouponTargetVO(String id) {
		this.id = id;
		this.cpno = 1;
		this.pno = 0;
		LocalDateTime ldt = LocalDateTime.now();
		ldt.plusMonths(3);
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm:ss");
		
		this.exp_date = ldt.format(dtf.BASIC_ISO_DATE);
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getCpno() {
		return cpno;
	}
	public void setCpno(int cpno) {
		this.cpno = cpno;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getExp_date() {
		return exp_date;
	}
	public void setExp_date(String exp_date) {
		this.exp_date = exp_date;
	}
	@Override
	public String toString() {
		return "CouponTargetVO [id=" + id + ", cpno=" + cpno + ", pno=" + pno + ", exp_date=" + exp_date + "]";
	}
	
	
}
