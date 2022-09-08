package org.spring2.service;

import java.util.ArrayList;

import org.spring2.mapper.ReviewMapper;
import org.spring2.model.RICriteriaVO;
import org.spring2.model.ReviewAttachVO;
import org.spring2.model.ReviewVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	ReviewMapper rm;
	
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
		// System.out.println("리뷰서비스 impl");
		rm.write(rvo);
	
		// System.out.println("attach : "+rvo.getAttach());
		rvo.getAttach().forEach(attach->{
			// System.out.println("이미지업로드 impl :"+rvo.getRno());
			attach.setRno(rvo.getRno());
			rm.uploadimg(attach);
		});
			
	}
	// 평점1 건수 구현
	public int scope1cnt(RICriteriaVO cri) {
//		System.out.println("serviceimpl 평점1 건수 : "+cri);
		return rm.scope1cnt(cri);
	}
	// 평점2 건수 구현
	public int scope2cnt(RICriteriaVO cri) {
		return rm.scope2cnt(cri);
	}
	// 평점3 건수 구현
	public int scope3cnt(RICriteriaVO cri) {
		return rm.scope3cnt(cri);
	}
	// 평점4 건수 구현
	public int scope4cnt(RICriteriaVO cri) {
		return rm.scope4cnt(cri);
	}
	// 평점5 건수 구현
	public int scope5cnt(RICriteriaVO cri) {
		return rm.scope5cnt(cri);
	}
	
	// 평점 평균 건수 구현
	public float scopeavg(RICriteriaVO cri){
		return rm.scopeavg(cri);
	}
	
}
