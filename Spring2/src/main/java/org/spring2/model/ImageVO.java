package org.spring2.model;

public class ImageVO {
	private String uuid;
	private String uploadPath;
	private String fileName;
	private String fullPath;
	private boolean image;
	private int pno;
	
	public String getFullPath() {
		return fullPath;
	}
	public void setFullPath(String fullPath) {
		this.fullPath = fullPath;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public String getUploadPath() {
		return uploadPath;
	}
	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public boolean isImage() {
		return image;
	}
	public void setImage(boolean image) {
		this.image = image;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	@Override
	public String toString() {
		return "ImageVO [uuid=" + uuid + ", uploadPath=" + uploadPath + ", fileName=" + fileName + ", fullPath=" + fullPath + ", image=" + image + ", pno=" + pno + "]";
	}
	
	
}
