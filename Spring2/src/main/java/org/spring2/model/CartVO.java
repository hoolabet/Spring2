package org.spring2.model;

public class CartVO {
	private String id;
	private int pno;
	private int b_quantity;
	private String add_date;
	private boolean doOrder;
	private int cptno;
	private ImageVO ivo;
	private BoardVO bvo;
	

	
	public int getCptno() {
		return cptno;
	}
	public void setCptno(int cptno) {
		this.cptno = cptno;
	}
	public String getId() {
		return id;
	}
	
	public boolean isDoOrder() {
		return doOrder;
	}
	public void setDoOrder(boolean doOrder) {
		this.doOrder = doOrder;
	}
	public ImageVO getIvo() {
		return ivo;
	}
	public void setIvo(ImageVO ivo) {
		this.ivo = ivo;
	}
	public BoardVO getBvo() {
		return bvo;
	}
	public void setBvo(BoardVO bvo) {
		this.bvo = bvo;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	
	public int getB_quantity() {
		return b_quantity;
	}
	public void setB_quantity(int b_quantity) {
		this.b_quantity = b_quantity;
	}
	public String getAdd_date() {
		return add_date;
	}
	public void setAdd_date(String add_date) {
		this.add_date = add_date;
	}
	@Override
	public String toString() {
		return "CartVO [id=" + id + ", pno=" + pno + ", b_quantity=" + b_quantity + ", add_date=" + add_date
				+ ", doOrder=" + doOrder + ", cptno=" + cptno + ", ivo=" + ivo + ", bvo=" + bvo + "]";
	}
	
	
}
