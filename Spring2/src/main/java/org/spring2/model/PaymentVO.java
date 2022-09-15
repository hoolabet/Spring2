package org.spring2.model;

public class PaymentVO {
	private int payno;
	private int price;
	private String name;
	private String id;
	private String address;
	private int phone;
	private String dmemo;
	private String state;
	private int delivery_cost;
	private String coupon;
	private int point;
	private String order_date;
	
	
	public int getPhone() {
		return phone;
	}
	public void setPhone(int phone) {
		this.phone = phone;
	}
	public String getDmemo() {
		return dmemo;
	}
	public void setDmemo(String dmemo) {
		this.dmemo = dmemo;
	}
	public int getPayno() {
		return payno;
	}
	public void setPayno(int payno) {
		this.payno = payno;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getDelivery_cost() {
		return delivery_cost;
	}
	public void setDelivery_cost(int delivery_cost) {
		this.delivery_cost = delivery_cost;
	}
	public String getCoupon() {
		return coupon;
	}
	public void setCoupon(String coupon) {
		this.coupon = coupon;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	@Override
	public String toString() {
		return "PaymentVO [payno=" + payno + ", price=" + price + ", name=" + name + ", id=" + id + ", address="
				+ address + ", phone=" + phone + ", dmemo=" + dmemo + ", state=" + state + ", delivery_cost="
				+ delivery_cost + ", coupon=" + coupon + ", point=" + point + ", order_date=" + order_date + "]";
	}
	
}
