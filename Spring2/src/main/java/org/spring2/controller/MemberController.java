package org.spring2.controller;

import org.spring2.model.MemberVO;
import org.spring2.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {
	@Autowired
	MemberService ms;
	
	@RequestMapping(value = "/member/signup", method = RequestMethod.GET)
	public String signup() {
		return "member/signup";
	}
	@RequestMapping(value = "/member/signup", method = RequestMethod.POST)
	public String signupin(MemberVO member) {
		ms.signUp(member);
		return "member/login";
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
	
	

}
