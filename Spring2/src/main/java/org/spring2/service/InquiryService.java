package org.spring2.service;

import java.util.ArrayList;

import org.spring2.model.BoardVO;
import org.spring2.model.CriteriaVO;
import org.spring2.model.InquiryVO;

public interface InquiryService {

	// 문의 리스트 in 디테일 설계
	public ArrayList<InquiryVO> Ilist(int pno);
	
	// 문의 리스트 설계
	public ArrayList<InquiryVO> list(CriteriaVO cri);
	
	// 문의 전체건수 설계
	public int total(CriteriaVO cri);
	
	// 상품정보 가져오는 설계
	public BoardVO pro(CriteriaVO cri);
	
	// 문의 작성 설계
	public int write(InquiryVO ivo);
	
	// 문의 디테일 설계
	public InquiryVO detail(InquiryVO ivo);
	
	// 문의 답변 설계
	public int answer(InquiryVO ivo);
	
	// 문의 삭제 설계
	public int remove(int ino);
}
