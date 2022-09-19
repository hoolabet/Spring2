package org.spring2.model;


public class ReviewVO {
	
	private int rno;	// 리뷰번호
	private int pno;	// 상품번호
	private String id;	// 아이디
	private String content;	// 내용
	private float scope;	// 별점
	private String regdate;	// 등록일
	private int likeNum;
	private String uuid; // uuid
	private String uploadpath; // 파일경로
	private String filename; // 파일명
	private boolean image; // 이미지여부
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public float getScope() {
		return scope;
	}
	public void setScope(float scope) {
		this.scope = scope;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public String getUploadpath() {
		return uploadpath;
	}
	public void setUploadpath(String uploadpath) {
		this.uploadpath = uploadpath;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public boolean isImage() {
		return image;
	}
	public void setImage(boolean image) {
		this.image = image;
	}
	public int getLikeNum() {
		return likeNum;
	}
	public void setLikeNum(int likeNum) {
		this.likeNum = likeNum;
	}
	@Override
	public String toString() {
		return "ReviewVO [rno=" + rno + ", pno=" + pno + ", id=" + id + ", content=" + content + ", scope=" + scope
				+ ", regdate=" + regdate + ", likeNum=" + likeNum + ", uuid=" + uuid + ", uploadpath=" + uploadpath
				+ ", filename=" + filename + ", image=" + image + "]";
	}
}
