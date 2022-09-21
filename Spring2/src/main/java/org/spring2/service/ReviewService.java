package org.spring2.service;

import java.util.ArrayList;

import org.spring2.model.BoardVO;
import org.spring2.model.CriteriaVO;
import org.spring2.model.RICriteriaVO;
import org.spring2.model.ReviewLikeVO;
import org.spring2.model.ReviewVO;

public interface ReviewService {
	// 리뷰 리스트 in 디테일 설계
	public ArrayList<ReviewVO> Rlist(int pno);
	
	// 리뷰 리스트 설계
	public ArrayList<ReviewVO> list(CriteriaVO cri);
	
	// 리뷰 전체건수 설계
	public int total(CriteriaVO cri);
	
	// 리뷰 작성 설계
	public void write(ReviewVO rvo);
	
	// 상품정보 가져오는 설계
	public BoardVO pro(CriteriaVO cri);
	
	//좋아요 여부 가져오는 설계
	public int findLike(ReviewLikeVO rvo);

	public int likeAdd(ReviewLikeVO rvo);

	public int likeRemove(ReviewLikeVO rvo);

	public int likeUpdate(ReviewVO rvo); 
	
	//리뷰삭제 설계
	public int remove(ReviewVO rvo);
	//리뷰 수정위한 select
	public ReviewVO findReview(ReviewVO rvo);
	//리뷰수정
	public void modify(ReviewVO rvo);
	
}	
