package org.spring2.model;

public class PointVO {
	private String id;
	private int point;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	@Override
	public String toString() {
		return "PointVO [id=" + id + ", point=" + point + "]";
	}
	
	
}
