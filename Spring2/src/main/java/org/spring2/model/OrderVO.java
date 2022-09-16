package org.spring2.model;

public class OrderVO {
	private int ono;
	private int payno;
	private int pno;
	private int quantity;
	private int point;
	private String id;
	private String coupon;
	private String order_date;
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
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
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
	public String getCoupon() {
		return coupon;
	}
	public void setCoupon(String coupon) {
		this.coupon = coupon;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	@Override
	public String toString() {
		return "OrderVO [ono=" + ono + ", payno=" + payno + ", pno=" + pno + ", quantity=" + quantity + ", point="
				+ point + ", id=" + id + ", coupon=" + coupon + ", order_date=" + order_date + "]";
	}
	
	
}
