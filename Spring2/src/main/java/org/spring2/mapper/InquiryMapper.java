package org.spring2.mapper;

import java.util.ArrayList;

import org.spring2.model.RICriteriaVO;
import org.spring2.model.ReviewVO;
import org.spring2.model.InquiryVO;

public interface InquiryMapper {
	
	// 문의 리스트 in 디테일 DB설계
	public ArrayList<InquiryVO> Ilist(int pno);
		
	// 문의 리스트 DB설계
	public ArrayList<InquiryVO> list(RICriteriaVO cri);
	
	// 문의 전체건수 DB설계
	public int total(RICriteriaVO cri);
	
	// 문의 작성 DB설계
	public int write(InquiryVO ivo);
	
	
}
