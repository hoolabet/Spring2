package org.spring2.service;

import java.util.ArrayList;

import org.spring2.mapper.ReviewMapper;
import org.spring2.model.BoardVO;
import org.spring2.model.RICriteriaVO;
import org.spring2.model.ReviewVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	ReviewMapper rm;
	
	// 리뷰 리스트 in 디테일 구현
	public ArrayList<ReviewVO> Rlist(int pno){
		System.out.println("Rlist service="+pno);
		return rm.Rlist(pno);
	}
	
	// 리뷰 리스트 구현
	public ArrayList<ReviewVO> list(RICriteriaVO cri){
		System.out.println("리뷰service="+cri);
		return rm.list(cri);
	}
	
	// 리뷰 전체건수 구현
	public int total(RICriteriaVO cri) {
		return rm.total(cri);
		
	}
	
	// 리뷰 작성 구현
	public void write(ReviewVO rvo) {
		rm.write(rvo);
	}
	
	// 상품점보 가져오는 구현
	public BoardVO pro(RICriteriaVO cri) {
		return rm.pro(cri);
	}
	
	
	
	
}
