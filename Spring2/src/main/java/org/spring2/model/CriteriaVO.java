package org.spring2.model;

public class CriteriaVO {
	private int pageNum;
	private int amount;
	private String search;
	private String type;
	private String array;
	private int category_area;
	private int category_type;
	
	public CriteriaVO() {
		pageNum = 1;
		amount = 10;
		search = "";
		array = "last";
		category_area = 0;
		category_type = 0;
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
	
	public String getArray() {
		return array;
	}
	public void setArray(String array) {
		this.array = array;
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
	@Override
	public String toString() {
		return "CriteriaVO [pageNum=" + pageNum + ", amount=" + amount + ", search=" + search + ", type=" + type
				+ ", array=" + array + ", category_area=" + category_area + ", category_type=" + category_type + "]";
	}
	
	
	
	
}
