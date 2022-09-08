package org.spring2.service;

import java.util.ArrayList;

import org.spring2.model.RICriteriaVO;
import org.spring2.model.ReviewAttachVO;
import org.spring2.model.ReviewVO;

public interface ReviewService {
	// 리뷰 리스트 설계
	public ArrayList<ReviewVO> list(RICriteriaVO cri);
	
	// 리뷰 전체건수 설계
	public int total(RICriteriaVO cri);
	
	// 리뷰 작성 설계
	public void write(ReviewVO rvo);
	
	
	// 평점1 건수  설계
	public int scope1cnt(RICriteriaVO cri);
	// 평점2 건수  설계
	public int scope2cnt(RICriteriaVO cri);
	// 평점3 건수  설계
	public int scope3cnt(RICriteriaVO cri);
	// 평점4 건수  설계
	public int scope4cnt(RICriteriaVO cri);
	// 평점5 건수  설계
	public int scope5cnt(RICriteriaVO cri);
	
	// 평점 평균 건수 설계
	public float scopeavg(RICriteriaVO cri);
	
}	
