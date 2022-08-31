package org.spring2.model;

public class UploadFileVO {
	private String path;
	private String fileName;
	private String uuid;
	private String fullPath;
	private boolean checkI;
	private int nono;
	

	
	public String getFullPath() {
		return fullPath;
	}
	public void setFullPath(String fullPath) {
		this.fullPath = fullPath;
	}
	
	public int getNono() {
		return nono;
	}
	public void setNono(int nono) {
		this.nono = nono;
	}

	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	
	public boolean getCheckI() {
		return checkI;
	}
	public void setCheckI(boolean checkI) {
		this.checkI = checkI;
	}
	@Override
	public String toString() {
		return "UploadFileVO [path=" + path + ", fileName=" + fileName + ", uuid=" + uuid + ", fullPath=" + fullPath
				+ ", checkI=" + checkI + ", nono=" + nono + "]";
	}
	
	
	
}
