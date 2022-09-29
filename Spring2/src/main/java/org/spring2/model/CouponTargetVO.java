package org.spring2.model;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class CouponTargetVO {
	private String id;
	private int cptno;
	private int cpno;
	private int category_area;
	private int category_type;
	private int doApply;
	private boolean used;
	private String exp_date;
	private CouponVO cpvo;
	
	public CouponTargetVO() {
	}

	public CouponTargetVO(String id) {
		this.id = id;
		this.cpno = 1;
		this.category_area = 0;
		this.category_type = 0;
		LocalDateTime ldt = LocalDateTime.now();
		
		this.exp_date = ldt.plusMonths(3).format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
	}
	
	
	

	public boolean isUsed() {
		return used;
	}

	public void setUsed(boolean used) {
		this.used = used;
	}

	public int getCptno() {
		return cptno;
	}

	public void setCptno(int cptno) {
		this.cptno = cptno;
	}

	

	public int getDoApply() {
		return doApply;
	}

	public void setDoApply(int doApply) {
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
	
	


	public int getTarget_area() {
		return category_area;
	}

	public void setTarget_area(int target_area) {
		this.category_area = target_area;
	}

	

	public int getCategory_area() {
		return category_area;
	}

	public void setCategory_area(int category_area) {
		this.category_area = category_area;
	}

	public int getCategory_type() {
		return category_type;
	}

	public void setCategory_type(int category_type) {
		this.category_type = category_type;
	}

	public String getExp_date() {
		return exp_date;
	}
	public void setExp_date(String exp_date) {
		this.exp_date = exp_date;
	}
	@Override
	public String toString() {
		return "CouponTargetVO [id=" + id + ", cptno=" + cptno + ", cpno=" + cpno + ", category_area=" + category_area
				+ ", category_type=" + category_type + ", doApply=" + doApply + ", used=" + used + ", exp_date="
				+ exp_date + ", cpvo=" + cpvo + "]";
	}
	
	
}
