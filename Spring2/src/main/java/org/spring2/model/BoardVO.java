package org.spring2.model;

import java.util.ArrayList;

public class BoardVO {
	private int pno;
	private int price;
	private String pname;
	private String content;
	private int quantity;
	private int s_quantity;
	private String regdate;
	private String delivery;
	private String quality;
	private int t_estimate;
	private String refund;
	private int category_area;
	private int category_type;
	private int wishNum;
	private ArrayList<ImageVO> image;
	private ImageVO img;
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getS_quantity() {
		return s_quantity;
	}
	public void setS_quantity(int s_quantity) {
		this.s_quantity = s_quantity;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getDelivery() {
		return delivery;
	}
	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}
	public String getQuality() {
		return quality;
	}
	public void setQuality(String quality) {
		this.quality = quality;
	}
	public int getT_estimate() {
		return t_estimate;
	}
	public void setT_estimate(int t_estimate) {
		this.t_estimate = t_estimate;
	}
	public String getRefund() {
		return refund;
	}
	public void setRefund(String refund) {
		this.refund = refund;
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
	public ArrayList<ImageVO> getImage() {
		return image;
	}
	public void setImage(ArrayList<ImageVO> image) {
		this.image = image;
	}
	
	public int getWishNum() {
		return wishNum;
	}
	public void setWishNum(int wishNum) {
		this.wishNum = wishNum;
	}
	public ImageVO getImg() {
		return img;
	}
	public void setImg(ImageVO img) {
		this.img = img;
	}
	@Override
	public String toString() {
		return "BoardVO [pno=" + pno + ", price=" + price + ", pname=" + pname + ", content=" + content + ", quantity="
				+ quantity + ", s_quantity=" + s_quantity + ", regdate=" + regdate + ", delivery=" + delivery
				+ ", quality=" + quality + ", t_estimate=" + t_estimate + ", refund=" + refund + ", category_area="
				+ category_area + ", category_type=" + category_type + ", wishNum=" + wishNum + ", image=" + image
				+ ", img=" + img + "]";
	}
	
	
}
