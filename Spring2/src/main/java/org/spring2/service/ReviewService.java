package org.spring2.service;

import java.util.ArrayList;

import org.spring2.model.BoardVO;
import org.spring2.model.RICriteriaVO;
import org.spring2.model.ReviewVO;

public interface ReviewService {
	// 리뷰 리스트 in 디테일 설계
	public ArrayList<ReviewVO> Rlist(int pno);
	
	// 리뷰 리스트 설계
	public ArrayList<ReviewVO> list(RICriteriaVO cri);
	
	// 리뷰 전체건수 설계
	public int total(RICriteriaVO cri);
	
	// 리뷰 작성 설계
	public void write(ReviewVO rvo);
	
	// 상품정보 가져오는 설계
	public BoardVO pro(RICriteriaVO cri);
	

	
}	
