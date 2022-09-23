package org.spring2.controller;


import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.spring2.model.CriteriaVO;
import org.spring2.model.InquiryVO;
import org.spring2.model.PageVO;
import org.spring2.service.InquiryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.StaticMessageSource;
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
	
	// 문의리스트 in 디테일
	@RequestMapping(value = "/inquirylist/{pno}", method = RequestMethod.GET)
	public ResponseEntity<ArrayList<InquiryVO>> getList(@PathVariable int pno,HttpSession session,Model model){
		model.addAttribute("userinfo",session.getAttribute("userInfo"));
		return new ResponseEntity<>(is.Ilist(pno),HttpStatus.OK);
	}
	
	
	// 문의 목록, 페이징
	@RequestMapping(value = "/board/inquiry", method = RequestMethod.GET)
	public String list(Model model,CriteriaVO cri,HttpSession session,int pno) {
		System.out.println(pno);
		String n = String.valueOf(pno);
		cri.setSearch(n);
		cri.setAmount(5);
		
		model.addAttribute("list",is.list(cri));
		
		int total = is.total(cri);
		// System.out.println("문의 : "+total);
		
		model.addAttribute("pro",is.pro(cri));
		
		model.addAttribute("paging",new PageVO(cri, total));
		
		model.addAttribute("userinfo",session.getAttribute("userInfo"));
		return "/board/inquiry";
	}
	// 문의 작성(get)
	@RequestMapping(value = "/board/inquirywrite", method = RequestMethod.GET)
	public String writeGet(Model model,CriteriaVO cri,HttpSession session,int pno) {
		System.out.println(pno);
		String n = String.valueOf(pno);
		cri.setSearch(n);
		
		model.addAttribute("userinfo",session.getAttribute("userInfo"));
		model.addAttribute("pro",is.pro(cri));
		System.out.println(is.pro(cri));
		return "/board/inquirywrite";
	}
	// 문의 작성(post)
	@RequestMapping(value = "/board/inquirywrite", method = RequestMethod.POST)
	public ResponseEntity<String> write(@RequestBody InquiryVO ivo){
		int result = is.write(ivo);
		System.out.println("문의작성 controller = "+ivo);
		
		return result==1? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 문의 답변(get)
	@RequestMapping(value = "/board/inquirymodify", method = RequestMethod.GET)
	public String modifyGet(Model model,InquiryVO ivo,HttpSession session,CriteriaVO cri,int pno) {
		System.out.println("문의답변 get ="+pno);
		String n = String.valueOf(pno);
		cri.setSearch(n);
		
		model.addAttribute("userinfo",session.getAttribute("userInfo"));
		model.addAttribute("detail",is.detail(ivo));
		model.addAttribute("pro",is.pro(cri));
		

		int total = is.total(cri);
		model.addAttribute("paging",new PageVO(cri, total));
		
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
	
	// 문의 삭제 
	@RequestMapping(value = "/inquiry/remove/{ino}", method = RequestMethod.DELETE)
	public ResponseEntity<String> inquiryremove(@PathVariable int ino){
		System.out.println("삭제="+ino);
		
		int result = is.remove(ino);
		return result==1? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
