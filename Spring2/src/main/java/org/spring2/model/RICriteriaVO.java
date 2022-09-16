package org.spring2.model;

public class RICriteriaVO {
	private int pageNum;	// 페이지번호
	private int amount;		// 한 페이지당 게시물 갯수
	private int pno;
	
		// 생성자
		public RICriteriaVO() {
			this(1,5);
		}
		public RICriteriaVO(int pageNum, int amount) {
			this.pageNum = pageNum;
			this.amount = amount;
		}
	
	
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	@Override
	public String toString() {
		return "RICriteriaVO [pageNum=" + pageNum + ", amount=" + amount + ", pno=" + pno + "]";
	}
	
	
}
