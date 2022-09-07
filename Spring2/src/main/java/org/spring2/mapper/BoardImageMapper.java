package org.spring2.mapper;

import java.util.ArrayList;

import org.spring2.model.ImageVO;

public interface BoardImageMapper {
	//이미지테이블 insert
	public void insert(ImageVO image);
	//이미지테이블 리스트
	public ArrayList<ImageVO> imagelist(int pno);
	//이미지테이블 수정
	public void modify(ImageVO image);
	//이미지테이블 삭제
	public void remove(int bno);
}
