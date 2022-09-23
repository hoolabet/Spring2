package org.spring2.service;

import java.util.ArrayList;

import org.spring2.mapper.InquiryMapper;
import org.spring2.model.BoardVO;
import org.spring2.model.CriteriaVO;
import org.spring2.model.InquiryVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InquiryServiceImpl implements InquiryService {
	
	@Autowired
	InquiryMapper im;
	
	// 문의 리스트 in 디테일 구현
	public ArrayList<InquiryVO> Ilist(int pno){
		return im.Ilist(pno);
	}
	
	// 문의 리스트 구현
	public ArrayList<InquiryVO> list(CriteriaVO cri) {
		System.out.println("문의 service="+cri);
		return im.list(cri);
	}
	// 문의 전체건수 구현
	public int total(CriteriaVO cri) {
		return im.total(cri);
	}
	
	// 상품점보 가져오는 구현
	public BoardVO pro(CriteriaVO cri) {
		return im.pro(cri);
	}
		
	// 리뷰 작성 구현
	public int write(InquiryVO ivo) {
		System.out.println("문의작성 serviceimpl = "+im.write(ivo));
		return im.write(ivo);
	}
	
	// 문의 디테일 구현
	public InquiryVO detail(InquiryVO ivo){
		return im.detail(ivo);
	}
	
	// 문의 답변 구현
	public int answer(InquiryVO ivo) {
		return im.answer(ivo);
	}
	
	// 문의 삭제 구현
	public int remove(int ino) {
		System.out.println("remove serviceimpl connection");
		return im.remove(ino);
	}
}
