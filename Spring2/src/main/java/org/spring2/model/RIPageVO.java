package org.spring2.model;

public class RIPageVO {
	// 시작번호
	private int startPage;
	// 끝번호
	private int endPage;
	// 이전버튼
	private boolean prev;
	// 다음버튼
	private boolean next;
	// CritertaVO를 포함
	private RICriteriaVO cri;
	// board테이블의 전체건수를 저장
	private int total;

	public RIPageVO(RICriteriaVO cri, int total) {
		this.cri = cri;
		this.total = total;

		// 시작번호, 끝번호, 이전버튼, 다음버튼 계산
		this.endPage = (int)(Math.ceil(cri.getPageNum() / 5.0))*5; // 끝번호
		this.startPage = this.endPage - 4; // 시작번호
		
		System.out.println("PageVO="+this.startPage);
		System.out.println("PageVO="+this.endPage);
		
		int realEnd = (int)(Math.ceil((total * 1.0)/cri.getAmount())); // 마지막 끝번호

		if(realEnd < this.endPage) {
			this.endPage=realEnd;
		}
		this.prev = this.startPage > 1; // 이전버튼
		this.next = this.endPage < realEnd;	// 다음버튼


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

	public RICriteriaVO getCri() {
		return cri;
	}

	public void setCri(RICriteriaVO cri) {
		this.cri = cri;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	@Override
	public String toString() {
		return "PageVO [startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next
				+ ", cri=" + cri + ", total=" + total + "]";
	}
	
}
