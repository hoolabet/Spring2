package org.spring2.service;

import java.util.ArrayList;

import org.spring2.mapper.InquiryMapper;
import org.spring2.model.RICriteriaVO;
import org.spring2.model.ReviewVO;
import org.spring2.model.InquiryVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InquiryServiceImpl implements InquiryService {
	
	@Autowired
	InquiryMapper im;
	
	// 문의 리스트 in 디테일 구현
	public ArrayList<InquiryVO> Ilist(int pno){
		System.out.println("Ilist service="+pno);
		return im.Ilist(pno);
	}
	
	// 문의 리스트 구현
	public ArrayList<InquiryVO> list(RICriteriaVO cri) {
		// System.out.println("문의service="+cri);
		return im.list(cri);
	}
	// 문의 전체건수 구현
	public int total(RICriteriaVO cri) {
		return im.total(cri);
	}
	// 리뷰 작성 구현
	public int write(InquiryVO ivo) {
		System.out.println("문의서비스 impl" + ivo);
		return im.write(ivo);
	}
}
