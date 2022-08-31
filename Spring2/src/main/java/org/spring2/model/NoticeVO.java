package org.spring2.model;

import java.util.ArrayList;

import org.spring2.model.UploadFileVO;

public class NoticeVO {
	private int nono;
	private String title;
	private String content;
	private String regdate;
	private ArrayList<UploadFileVO> uvo;
	
	
	public ArrayList<UploadFileVO> getUvo() {
		return uvo;
	}
	public void setUvo(ArrayList<UploadFileVO> uvo) {
		this.uvo = uvo;
	}
	public int getNono() {
		return nono;
	}
	public void setNono(int nono) {
		this.nono = nono;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "NoticeVO [nono=" + nono + ", title=" + title + ", content=" + content + ", regdate=" + regdate
				+ ", uvo=" + uvo + "]";
	}
	
}
