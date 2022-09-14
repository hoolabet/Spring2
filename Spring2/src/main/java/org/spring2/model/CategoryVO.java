package org.spring2.model;

public class CategoryVO {
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
		return "CategoryVO [cno=" + cno + ", cname=" + cname + "]";
	}
	
}
