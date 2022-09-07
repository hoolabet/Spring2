package org.spring2.service;

import java.util.ArrayList;

import org.spring2.model.RICriteriaVO;
import org.spring2.model.InquiryVO;

public interface InquiryService {

	// 문의 리스트 설계
	public ArrayList<InquiryVO> list(RICriteriaVO cri);
	
	// 문의 전체건수 설계
	public int total(RICriteriaVO cri);
	
	// 문의 작성 설계
	public int write(InquiryVO ivo);
}
