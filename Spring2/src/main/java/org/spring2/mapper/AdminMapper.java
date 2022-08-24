package org.spring2.mapper;

import java.util.ArrayList;

import org.spring2.model.MemberVO;
import org.spring2.model.QnAVO;

public interface AdminMapper {
	// 제품등록 DB설계
	public void add(); 
	// 회원목록 DB설계
	public ArrayList<MemberVO> memberlist();
	// QnA목록 DB설계
	public ArrayList<QnAVO> qnalist();
}
