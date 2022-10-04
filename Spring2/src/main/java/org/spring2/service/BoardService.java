package org.spring2.service;

import java.util.ArrayList;

import org.spring2.model.BoardVO;
import org.spring2.model.CategoryVO;
import org.spring2.model.Category_AreaVO;
import org.spring2.model.CriteriaVO;
import org.spring2.model.ImageVO;
import org.spring2.model.PaymentVO;

public interface BoardService {
	//홈 상품불러오기
	public ArrayList<BoardVO> homeImage();
	//상품게시판글쓰기
	public void write(BoardVO bvo);
	//상품리스트
	public ArrayList<BoardVO> list(CriteriaVO cri);
	//상품이미지리스트
	public ArrayList<ImageVO> imagelist(int pno);
	//상품상세페이지
	public BoardVO detail(BoardVO bvo);
	//상품 게시판 수정
	public void modify(BoardVO bvo);
	//상품 게시판 삭제
	public void remove(BoardVO bvo);
	//상품테이블 전체건수
	public int total(CriteriaVO cri);
	//카테고리리스트
	public ArrayList<CategoryVO> cat();
	//장소카테고리 리스트
	public Category_AreaVO caa(CriteriaVO cri);
	//구매자확인
	public ArrayList<PaymentVO> findPay(BoardVO bvo);
	//위시업데이트
	public int wishNumUpdate(BoardVO bvo);
	
}
