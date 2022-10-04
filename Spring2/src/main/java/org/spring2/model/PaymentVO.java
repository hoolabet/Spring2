package org.spring2.model;

public class PaymentVO {
	private int payno;
	private int price;
	private String name;
	private String id;
	private String address;
	private String phone;
	private String dmemo;
	private String state;
	private int delivery_cost;
	private String payment_date;
	private int use_point;
	
	
	public int getUse_point() {
		return use_point;
	}
	public void setUse_point(int use_point) {
		this.use_point = use_point;
	}
	
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
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
	
	public String getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(String payment_date) {
		this.payment_date = payment_date;
	}
	@Override
	public String toString() {
		return "PaymentVO [payno=" + payno + ", price=" + price + ", name=" + name + ", id=" + id + ", address="
				+ address + ", phone=" + phone + ", dmemo=" + dmemo + ", state=" + state + ", delivery_cost="
				+ delivery_cost + ", payment_date=" + payment_date + ", use_point=" + use_point + "]";
	}
	
}
