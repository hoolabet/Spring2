package org.spring2.model;

public class MadeVO {
	private int mno;
	private String id;
	private String kind;
	private String ingre;
	private int len1;
	private int len2;
	private int len3;
	private String color;
	
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getIngre() {
		return ingre;
	}
	public void setIngre(String ingre) {
		this.ingre = ingre;
	}
	public int getLen1() {
		return len1;
	}
	public void setLen1(int len1) {
		this.len1 = len1;
	}
	public int getLen2() {
		return len2;
	}
	public void setLen2(int len2) {
		this.len2 = len2;
	}
	public int getLen3() {
		return len3;
	}
	public void setLen3(int len3) {
		this.len3 = len3;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	@Override
	public String toString() {
		return "MadeVO [mno=" + mno + ", id=" + id + ", kind=" + kind + ", ingre=" + ingre + ", len1=" + len1
				+ ", len2=" + len2 + ", len3=" + len3 + ", color=" + color + "]";
	}
	
	
}
