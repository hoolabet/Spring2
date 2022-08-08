package org.spring2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {
	@RequestMapping(value = "/member/signup", method = RequestMethod.GET)
	public String signup() {
		return "member/signup";
	}
	@RequestMapping(value = "/member/signup", method = RequestMethod.POST)
	public void signupin(String id, String pw, String name, String email, String phone, String add) {
		System.out.println(id);
		System.out.println(pw);
		System.out.println(name);
		System.out.println(email);
		System.out.println(phone);
		System.out.println(add);
	}
	
	
	@RequestMapping(value = "/member/login", method = RequestMethod.GET)
	public String login() {
		return "member/login";
	}
	@RequestMapping(value = "/member/login", method = RequestMethod.POST)
	public void loginin(String id,String pw) {
		System.out.println(id);
		System.out.println(pw);
	}
	
	
	@RequestMapping(value = "/member/mypage", method = RequestMethod.GET)
	public String mypage() {
		return "member/mypage";
	}
	
	
	@RequestMapping(value = "/member/memInfo", method = RequestMethod.GET)
	public String memInfo() {
		return "member/memInfo";
	}
	@RequestMapping(value = "/member/memInfo", method = RequestMethod.POST)
	public void modify(String id,String pw) {
		System.out.println(id);
		System.out.println(pw);
	}
	
	
	@RequestMapping(value = "/member/shippingAdd", method = RequestMethod.GET)
	public String shippingAdd() {
		return "member/shippingAdd";
	}
	@RequestMapping(value = "/member/shippingAdd", method = RequestMethod.POST)
	public void shippingAddin(String id,String pw) {
		System.out.println(id);
		System.out.println(pw);
	}
	
	
	@RequestMapping(value = "/member/modifyAdd", method = RequestMethod.GET)
	public String modifyAdd() {
		return "member/modifyAdd";
	}
	@RequestMapping(value = "/member/modifyAdd", method = RequestMethod.POST)
	public void modifyAddid(String id,String pw) {
		System.out.println(id);
		System.out.println(pw);
	}
}
