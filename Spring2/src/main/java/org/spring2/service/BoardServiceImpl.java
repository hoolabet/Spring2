package org.spring2.service;

import java.util.ArrayList;

import org.spring2.mapper.BoardImageMapper;
import org.spring2.mapper.BoardMapper;
import org.spring2.model.BoardVO;
import org.spring2.model.CategoryVO;
import org.spring2.model.Category_AreaVO;
import org.spring2.model.CriteriaVO;
import org.spring2.model.ImageVO;
import org.spring2.model.PaymentVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	BoardMapper bm;
	
	@Autowired
	BoardImageMapper bim;
	//홈 상품불러오기
	public ArrayList<BoardVO> homeImage(){
			return bm.homeImage();
	}
	//글쓰기페이지
	public void write(BoardVO bvo) {
		bm.write(bvo);
		bvo.getImage().forEach(image->{
			image.setPno(bvo.getPno());
			bim.insert(image);
		});
	}
	//상품목록페이지
	public ArrayList<BoardVO> list(CriteriaVO cri){
		return bm.list(cri);
	}
	public ArrayList<ImageVO> imagelist(int pno){
		return bim.imagelist(pno);
	}
	//상세페이지
	public BoardVO detail(BoardVO bvo) {
		return bm.detail(bvo);
	}
	//수정페이지
	public void modify(BoardVO bvo) {
		 bm.modify(bvo);
		 bvo.getImage().forEach(image->{
				image.setPno(bvo.getPno());
				bim.modify(image);
			});
	}
	//삭제페이지
	public void remove(BoardVO bvo) {
		bm.remove(bvo);
		bim.remove(bvo.getPno());
	}
	//total가져오기
	public int total(CriteriaVO cri) {
		return bm.total(cri);
	}
	public ArrayList<CategoryVO> cat(){
		return bm.category();
	}
	public Category_AreaVO caa(CriteriaVO cri){
		return bm.caa(cri);
	}
	public ArrayList<PaymentVO> findPay(BoardVO bvo){
		return bm.findPay(bvo);
	}
	public int wishNumUpdate(BoardVO bvo) {
		return bm.wishNumUpdate(bvo);
	}
}
