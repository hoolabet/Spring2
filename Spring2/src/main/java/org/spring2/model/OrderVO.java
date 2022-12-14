package org.spring2.model;

public class OrderVO {
	private int ono;
	private int payno;
	private int pno;
	private int b_quantity;
	private int point;
	private String id;
	private int cptno;
	private String order_date;
	private ImageVO ivo;
	private BoardVO bvo;
	private CouponVO cpvo;
	private CouponTargetVO cptvo;
	
	
	public CouponTargetVO getCptvo() {
		return cptvo;
	}
	public void setCptvo(CouponTargetVO cptvo) {
		this.cptvo = cptvo;
	}
	public CouponVO getCpvo() {
		return cpvo;
	}
	public void setCpvo(CouponVO cpvo) {
		this.cpvo = cpvo;
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
	public int getOno() {
		return ono;
	}
	public void setOno(int ono) {
		this.ono = ono;
	}
	public int getPayno() {
		return payno;
	}
	public void setPayno(int payno) {
		this.payno = payno;
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
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getCptno() {
		return cptno;
	}
	public void setCptno(int cptno) {
		this.cptno = cptno;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	@Override
	public String toString() {
		return "OrderVO [ono=" + ono + ", payno=" + payno + ", pno=" + pno + ", b_quantity=" + b_quantity + ", point="
				+ point + ", id=" + id + ", cptno=" + cptno + ", order_date=" + order_date + ", ivo=" + ivo + ", bvo="
				+ bvo + ", cpvo=" + cpvo + ", cptvo=" + cptvo + "]";
	}
	
	
}
