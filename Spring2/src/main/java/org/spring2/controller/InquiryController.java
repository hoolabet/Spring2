package org.spring2.controller;

import org.spring2.model.RICriteriaVO;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.spring2.model.InquiryVO;
import org.spring2.model.RIPageVO;
import org.spring2.service.InquiryService;
import org.spring2.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class InquiryController {
	
	@Autowired
	InquiryService is;
	@Autowired
	ReviewService rs;
	
	// 문의리스트 in 디테일
	@RequestMapping(value = "/inquirylist/{pno}", method = RequestMethod.GET)
	public ResponseEntity<ArrayList<InquiryVO>> getList(@PathVariable int pno,HttpSession session,Model model){
		model.addAttribute("userinfo",session.getAttribute("userInfo"));
		return new ResponseEntity<>(is.Ilist(pno),HttpStatus.OK);
	}
	
	
	// 문의 목록, 페이징
	@RequestMapping(value = "/board/inquiry", method = RequestMethod.GET)
	public String list(Model model,RICriteriaVO cri,HttpSession session) {
		model.addAttribute("list",is.list(cri));
		int total = is.total(cri);
		// System.out.println("문의 : "+total);
		model.addAttribute("pro",rs.pro(cri));
		model.addAttribute("paging",new RIPageVO(cri, total));
		model.addAttribute("userinfo",session.getAttribute("userInfo"));
		return "/board/inquiry";
	}
	// 문의 작성(get)
	@RequestMapping(value = "/board/inquirywrite", method = RequestMethod.GET)
	public String writeGet(Model model,RICriteriaVO cri,HttpSession session) {
		model.addAttribute("userinfo",session.getAttribute("userInfo"));
		model.addAttribute("pro",rs.pro(cri));
		return "/board/inquirywrite";
	}
	// 문의 작성(post)
	@RequestMapping(value = "/board/inquirywrite", method = RequestMethod.POST)
	public ResponseEntity<String> write(@RequestBody InquiryVO ivo){
		int result = is.write(ivo);
		
		
		return result==1? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 문의 수정, 답변(get)
	@RequestMapping(value = "/board/inquirymodify", method = RequestMethod.GET)
	public String modifyGet(Model model,InquiryVO ivo,HttpSession session,RICriteriaVO cri) {
		model.addAttribute("userinfo",session.getAttribute("userInfo"));
		model.addAttribute("detail",is.detail(ivo));
		model.addAttribute("pro",rs.pro(cri));
		System.out.println("sdfe");
		return "/board/inquirymodify";
	}
	// 문의 답변 작성(post)
	@RequestMapping(value = "/board/inquirymodify", method = RequestMethod.POST)
	public ResponseEntity<String> modifyPost(@RequestBody InquiryVO ivo){
		
		System.out.println("con : "+ivo);
		
		int result = is.answer(ivo);
		System.out.println("답변 is.answer(ivo) = "+is.answer(ivo));
		System.out.println("답변  result = "+result);
		return result==1? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
}
