package org.spring2.service;

import java.util.ArrayList;

import org.spring2.model.MemberVO;
import org.spring2.model.QnAVO;

public interface AdminService {
	// 제품등록 설계
	public void add();
	// 회원목록 설계
	public ArrayList<MemberVO> memberlist();
	// QnA 목록 설계
	public ArrayList<QnAVO> qnalist();
}
