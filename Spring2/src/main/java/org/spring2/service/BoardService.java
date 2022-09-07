package org.spring2.service;

import java.util.ArrayList;

import org.spring2.model.BoardVO;
import org.spring2.model.CriteriaVO;
import org.spring2.model.ImageVO;

public interface BoardService {
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
}
