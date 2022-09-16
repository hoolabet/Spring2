package org.spring2.model;

public class WishListVO {
	private String id;
	private int pno;
	private String add_date;
//	private String pname;
//	private String price;
//	private String fullPath;
	private BoardVO bvo;
	private ImageVO ivo;
	
	public BoardVO getBvo() {
		return bvo;
	}
	public void setBvo(BoardVO bvo) {
		this.bvo = bvo;
	}
	public ImageVO getIvo() {
		return ivo;
	}
	public void setIvo(ImageVO ivo) {
		this.ivo = ivo;
	}
	public String getId() {
		return id;
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
	public String getAdd_date() {
		return add_date;
	}
	public void setAdd_date(String add_date) {
		this.add_date = add_date;
	}
@Override
	public String toString() {
		return "WishListVO [id=" + id + ", pno=" + pno + ", add_date=" + add_date + ", bvo=" + bvo + ", ivo=" + ivo
				+ "]";
	}
	
}
