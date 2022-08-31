package org.spring2.model;

public class PageVO {
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private CriteriaVO cri;
	private int total;
	private int realEnd;
	public PageVO(CriteriaVO cri, int total) {
		this.cri = cri;
		this.total = total;
		this.endPage = (int)Math.ceil(cri.getPageNum()/10.0)*10;
		this.startPage = this.endPage - 9;
		this.realEnd = (int)Math.ceil((double)total/cri.getAmount());
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
	
	
	public int getRealEnd() {
		return realEnd;
	}


	public void setRealEnd(int realEnd) {
		this.realEnd = realEnd;
	}


	public CriteriaVO getCri() {
		return cri;
	}


	public void setCri(CriteriaVO cri) {
		this.cri = cri;
	}


	public int getTotal() {
		return total;
	}


	public void setTotal(int total) {
		this.total = total;
	}


	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}


	@Override
	public String toString() {
		return "PageVO [startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next
				+ ", cri=" + cri + ", total=" + total + ", realEnd=" + realEnd + "]";
	}


	
	
	
}
