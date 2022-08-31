package org.spring2.model;

public class CriteriaVO {
	private int pageNum;
	private int amount;
	private String search;
	private String type;
	
	public CriteriaVO() {
		pageNum = 1;
		amount = 10;
		search = "";
	}
	public CriteriaVO(String search) {
		this();
		this.search = search;
	}
	public CriteriaVO(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	
	
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
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
	@Override
	public String toString() {
		return "CriteriaVO [pageNum=" + pageNum + ", amount=" + amount + ", search=" + search + ", type=" + type + "]";
	}
	
	
	
	
}
