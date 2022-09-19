package org.spring2.model;

public class ReviewLikeVO {
	
	private int rno;
	private String id;
	private ReviewVO rvo;
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public ReviewVO getRvo() {
		return rvo;
	}
	public void setRvo(ReviewVO rvo) {
		this.rvo = rvo;
	}
	@Override
	public String toString() {
		return "ReviewLikeVO [rno=" + rno + ", id=" + id + ", rvo=" + rvo + "]";
	}
	
	
	
}
