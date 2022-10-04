package org.spring2.service;

import java.util.ArrayList;

import org.spring2.mapper.ReviewMapper;
import org.spring2.model.BoardVO;
import org.spring2.model.CriteriaVO;
import org.spring2.model.OrderVO;
import org.spring2.model.RICriteriaVO;
import org.spring2.model.ReviewLikeVO;
import org.spring2.model.ReviewVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	ReviewMapper rm;
	
	// 리뷰 리스트 구현
	public ArrayList<ReviewVO> list(CriteriaVO cri){
		System.out.println("리뷰service="+cri);
		return rm.list(cri);
	}
	
	// 리뷰 전체건수 구현
	public int total(CriteriaVO cri) {
		return rm.total(cri);
		
	}
	
	// 리뷰 작성 구현
	public void write(ReviewVO rvo) {
		rm.write(rvo);
	}
	
	// 상품점보 가져오는 구현
	public BoardVO pro(CriteriaVO cri) {
		return rm.pro(cri);
	}
	
	//좋아요 여부 가져오는 구현
	public int findLike(ReviewLikeVO rvo) {
		return rm.findLike(rvo);
	}
	public int likeAdd(ReviewLikeVO rvo) {
		return rm.likeAdd(rvo);
	}
	
	public int likeRemove(ReviewLikeVO rvo) {
		return rm.likeRemove(rvo);
	}
	
	public int likeUpdate(ReviewVO rvo) {
		return rm.likeUpdate(rvo);
	}
	//리뷰삭제
	public int remove(ReviewVO rvo) {
		return rm.remove(rvo);
	}
	//리뷰수정
	public ReviewVO findReview(ReviewVO rvo) {
		return rm.findReview(rvo);
	}
	public void modify(ReviewVO rvo) {
		rm.modify(rvo);
	}
	public ArrayList<OrderVO> reviewable(OrderVO ovo){
		return rm.reviewable(ovo);
	}
}
