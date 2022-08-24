package org.spring2.controller;

import org.spring2.model.MemberVO;
import org.spring2.model.QnAVO;
import org.spring2.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {
	
	@Autowired
	AdminService as;
	
	// 관리자 페이지
	@RequestMapping(value = "/admin/main", method = RequestMethod.GET)
	public void admin() {
	}
	// 관리자 제품 목록
	@RequestMapping(value = "/admin/productList", method = RequestMethod.GET)
	public void productList() {	
		
	}
	// 관리자 제품 상세
	@RequestMapping(value = "/admin/productDetail", method = RequestMethod.GET)
	public void productDetail() {	
	}
	// 관리자 제품 관리
	@RequestMapping(value = "/admin/productModify", method = RequestMethod.GET)
	public void productModify() {	
	}
	
	// 관리자 제품 등록(화면)
	@RequestMapping(value = "/admin/productAdd", method = RequestMethod.GET)
	public void productAddGet() {	
	}
	// 관리자 제품 등록(insert)
	@RequestMapping(value = "/admin/productAdd", method = RequestMethod.POST)
	public void productAddPost() {	
		
	}
	
	// 관리자 주문 내역
	@RequestMapping(value = "/admin/orderList", method = RequestMethod.GET)
	public void orderList() {
	}
	// 관리자 주문 상세
	@RequestMapping(value = "/admin/orderDetail", method = RequestMethod.GET)
	public void orderDetail() {
	}
	// 관리자 회원 목록
	@RequestMapping(value = "/admin/memberList", method = RequestMethod.GET)
	public void memberList(Model model, MemberVO member) {
		model.addAttribute("memberlist",as.memberlist());
	}
	// 관리자 회원 상세
	@RequestMapping(value = "/admin/memberDetail", method = RequestMethod.GET)
	public void memberDetail() {
	}
	// QnA 목록
	@RequestMapping(value = "/admin/qnaList", method = RequestMethod.GET)
	public void qnalist(Model model, QnAVO qna) {
		model.addAttribute("qnalist",as.qnalist());
	}
	
}
