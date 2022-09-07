package org.spring2.model;

public class ReviewAttachVO {

	private String uuid; // uuid
	private String uploadpath; // 파일경로
	private String filename; // 파일명
	private boolean image; // 이미지여부
	private int rno; // 리뷰번호
	
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
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	@Override
	public String toString() {
		return "ReviewAttachVO [uuid=" + uuid + ", uploadpath=" + uploadpath + ", filename=" + filename + ", image="
				+ image + ", rno=" + rno + "]";
	}
	
	
}
  