package org.spring2.mapper;

import java.util.ArrayList;

import org.spring2.model.BoardVO;
import org.spring2.model.CriteriaVO;

public interface BoardMapper {
	public void write(BoardVO bvo);
	//상품리스트 DB설계
	public ArrayList<BoardVO> list(CriteriaVO cri);
	//상품상세페이지 DB설계
	public BoardVO detail(BoardVO bvo);
	//상품페이지 수정
	public void modify(BoardVO bvo);
	//상품페이지 삭제
	public void remove(BoardVO bvo);
	//board테이블 전체건수 해당되는 DB설계
	public int total(CriteriaVO cri);
}
