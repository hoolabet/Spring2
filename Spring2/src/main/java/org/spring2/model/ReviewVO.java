package org.spring2.model;

import java.util.ArrayList;

public class ReviewVO {
	
	private int rno;	// 리뷰번호
	private int pno;	// 상품번호
	private String id;	// 아이디
	private String content;	// 내용
	private float scope;	// 별점
	private String regdate;	// 등록일
	
	private ArrayList<ReviewAttachVO> attach;
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public float getScope() {
		return scope;
	}
	public void setScope(float scope) {
		this.scope = scope;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	public ArrayList<ReviewAttachVO> getAttach() {
		return attach;
	}
	public void setAttach(ArrayList<ReviewAttachVO> attach) {
		this.attach = attach;
	}
	@Override
	public String toString() {
		return "ReviewVO [rno=" + rno + ", pno=" + pno + ", id=" + id + ", content=" + content + ", scope=" + scope
				+ ", regdate=" + regdate + ", attach=" + attach + "]";
	}
}
