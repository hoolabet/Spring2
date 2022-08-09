package org.spring2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {
	// 관리자 페이지 목록
	@RequestMapping(value = "/admin/list", method = RequestMethod.GET)
	public void admin() {
	}
	// 관리자 상품 목록
	@RequestMapping(value = "/admin/productList", method = RequestMethod.GET)
	public void productList() {	
	}
	// 관리자 상품 관리
	@RequestMapping(value = "/admin/productModify", method = RequestMethod.GET)
	public void productModify() {	
	}
	// 관리자 상품 등록
	@RequestMapping(value = "/admin/productAdd", method = RequestMethod.GET)
	public void productAdd() {	
	}
	// 관리자 주문 내역
	@RequestMapping(value = "/admin/orderList", method = RequestMethod.GET)
	public void orderList() {
	}
	// 관리자 주문 상세
	@RequestMapping(value = "/admin/orderDetail", method = RequestMethod.GET)
	public void orderDetail() {
	}
	// 관리자 회원 관리
	@RequestMapping(value = "/admin/memberList", method = RequestMethod.GET)
	public void memberList() {
	}
	// 관리자 회원 상세
	@RequestMapping(value = "/admin/memberDetail", method = RequestMethod.GET)
	public void memberDetail() {
	}
	
}
