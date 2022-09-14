package org.spring2.controller;

import java.util.ArrayList;
import java.util.Locale;

import org.spring2.model.BoardVO;
import org.spring2.model.CategoryVO;
import org.spring2.model.CriteriaVO;
import org.spring2.model.ImageVO;
import org.spring2.model.PageVO;
import org.spring2.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class BoardController {
	@Autowired
	BoardService bs;
		
	// 상품목록리스트
	@RequestMapping(value = "/board/list", method = RequestMethod.GET)
	public String BoardList(Model model, CriteriaVO cri, CategoryVO cat) {
		cri.setAmount(12);
		//System.out.println(bs.cat());
		model.addAttribute("list", bs.list(cri));
		int total = bs.total(cri);
		//System.out.println(total);
		model.addAttribute("paging", new PageVO(cri,total));
		model.addAttribute("category", bs.cat());
		System.out.println(bs.caa(cri));
		model.addAttribute("caa", bs.caa(cri));
		return "board/list";
	}

	// 해당게시물의 첨부파일의 데이터를 ajax로 전송
	@RequestMapping(value = "/attachlist", method = RequestMethod.GET)
	public ResponseEntity<ArrayList<ImageVO>> imagelist(int pno) {
		return new ResponseEntity<>(bs.imagelist(pno), HttpStatus.OK);
	}
	
	// 상품상세페이지
	@RequestMapping(value = "/board/detail", method = RequestMethod.GET)
	public void BoardDetail(BoardVO bvo, Model model) {
		model.addAttribute("detail", bs.detail(bvo));
	}

	// 상품등록
	@RequestMapping(value = "/board/write", method = RequestMethod.GET)
	public String BoardWrite() {
		return "/board/write";
	}

	@RequestMapping(value = "/board/write", method = RequestMethod.POST)
	public String BoardWritePost(BoardVO bvo) {
		System.out.println(bvo);
		bs.write(bvo);
		return "redirect:/board/list";
	}
	
	//상품수정
	@RequestMapping(value = "/board/modify", method = RequestMethod.GET)
	public void BoardModify(BoardVO bvo, Model model) {
		model.addAttribute("detail", bs.detail(bvo));
	}
	@RequestMapping(value = "/board/modify", method = RequestMethod.POST)
	public String BoardModifyPost(BoardVO bvo) {
		System.out.println(bvo);
		bs.modify(bvo);
		return "redirect:/board/list";
	}
	//상품삭제
	@RequestMapping(value="/board/remove", method= RequestMethod.POST)
	public String remove(BoardVO bvo) {
	bs.remove(bvo);
	return "redirect:/board/list";
	}
	
	// 상품리뷰
	@RequestMapping(value = "/board/review", method = RequestMethod.GET)
	public void BoardReview() {

	}

	@RequestMapping(value = "/board/review", method = RequestMethod.POST)
	public void BoardReviewPost() {

	}
}
