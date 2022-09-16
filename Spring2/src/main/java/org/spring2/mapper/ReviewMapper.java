package org.spring2.mapper;

import java.util.ArrayList;

import org.spring2.model.BoardVO;
import org.spring2.model.RICriteriaVO;
import org.spring2.model.ReviewVO;

public interface ReviewMapper {
	
	// 리뷰 리스트 in 디테일 DB설계
	public ArrayList<ReviewVO> Rlist(int pno);
	
	// 리뷰 리스트 DB설계
	public ArrayList<ReviewVO> list(RICriteriaVO cri);
	
	// 리뷰 전체건수 DB설계
	public int total(RICriteriaVO cri);
	
	// 리뷰 작성 DB설계
	public void write(ReviewVO rvo);
	
	// 상품정보 가져오는 DB설계
	public BoardVO pro(RICriteriaVO cri);
	
	// 이미지 업로드 DB설계
//	public void uploadimg(ReviewVO rvo);
	
	
	
}
