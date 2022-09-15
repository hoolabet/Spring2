package org.spring2.model;

public class CartVO {
	private String id;
	private int pno;
	private int quantity;
	private String add_date;
//	private String pname;
//	private String price;
//	private String fullPath;
	private ImageVO ivo;
	private BoardVO bvo;
	
//	public String getPname() {
//		return pname;
//	}
//	public void setPname(String pname) {
//		this.pname = pname;
//	}
//	public String getPrice() {
//		return price;
//	}
//	public void setPrice(String price) {
//		this.price = price;
//	}
//	public String getFullPath() {
//		return fullPath;
//	}
//	public void setFullPath(String fullPath) {
//		this.fullPath = fullPath;
//	}
	
	public String getId() {
		return id;
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
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getAdd_date() {
		return add_date;
	}
	public void setAdd_date(String add_date) {
		this.add_date = add_date;
	}
	@Override
	public String toString() {
		return "CartVO [id=" + id + ", pno=" + pno + ", quantity=" + quantity + ", add_date=" + add_date + ", ivo="
				+ ivo + ", bvo=" + bvo + "]";
	}
	
	
}
