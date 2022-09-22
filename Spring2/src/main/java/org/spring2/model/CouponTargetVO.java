package org.spring2.model;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class CouponTargetVO {
	private String id;
	private int cpno;
	private int pno;
	private boolean doApply;
	private String exp_date;
	private CouponVO cpvo;
	
	public CouponTargetVO() {
	}

	public CouponTargetVO(String id) {
		this.id = id;
		this.cpno = 1;
		this.pno = 0;
		LocalDateTime ldt = LocalDateTime.now();
		
		this.exp_date = ldt.plusMonths(3).format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
	}
	
	
	

	public boolean isDoApply() {
		return doApply;
	}

	public void setDoApply(boolean doApply) {
		this.doApply = doApply;
	}

	public CouponVO getCpvo() {
		return cpvo;
	}
	
	public void setCpvo(CouponVO cpvo) {
		this.cpvo = cpvo;
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
		return "CouponTargetVO [id=" + id + ", cpno=" + cpno + ", pno=" + pno + ", doApply=" + doApply + ", exp_date="
				+ exp_date + ", cpvo=" + cpvo + "]";
	}
	
	
}
