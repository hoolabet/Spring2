package org.spring2.model;

public class InquiryVO {
	private int ino;	// 문의번호
	private int pno;	// 상품번호
	private String id;	// 아이디
	private String question;	// 문의내용
	private String answer;	// 답변
	private String regdate;	// 등록일
	public int getIno() {
		return ino;
	}
	public void setIno(int ino) {
		this.ino = ino;
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
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "InquiryVO [ino=" + ino + ", pno=" + pno + ", id=" + id + ", question=" + question + ", answer=" + answer
				+ ", regdate=" + regdate + "]";
	}
	
	
}
