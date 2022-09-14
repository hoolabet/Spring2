package org.spring2.model;

public class Category_AreaVO {
	private int cno;
	private String cname;
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	@Override
	public String toString() {
		return "Category_AreaVO [cno=" + cno + ", cname=" + cname + "]";
	}
	
}
