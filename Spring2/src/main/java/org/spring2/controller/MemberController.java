package org.spring2.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.spring2.model.MemberVO;
import org.spring2.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
		try {
			ms.signUp(member);
			return "member/login";
		}catch (Exception e) {
			e.printStackTrace();
			return "member/signup";
		}
	}
	
	@RequestMapping(value = "/member/signup/{id}", method = RequestMethod.GET)
	public ResponseEntity<String> idchk(@PathVariable String id) {
		try{
			System.out.println(ms.idchk(id).getId());
			return new ResponseEntity<>(ms.idchk(id).getId(),HttpStatus.OK);
		}catch (Exception e) {
			// TODO: handle exception
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	
	
	@RequestMapping(value = "/member/login", method = RequestMethod.GET)
	public String login() {
		return "member/login";
	}
	@RequestMapping(value = "/member/login", method = RequestMethod.POST)
	public String loginPost(MemberVO member,HttpSession session) {
		System.out.println(ms.login(member));
		session.setAttribute("userInfo", ms.login(member));
		System.out.println(session.getAttribute("userInfo"));
		if(session.getAttribute("userInfo") != null) {
			
			return "redirect:/";
		} else {
			return "member/login";
		}		
	}
	
	@RequestMapping(value = "/member/findId", method = RequestMethod.GET)
	public String findIdGet() {
		return "member/findId";
	}
	@RequestMapping(value = "/member/findId", method = RequestMethod.POST)
	public String findIdPost(MemberVO member,Model model) {
		System.out.println(member);
		try {
			ms.findId(member);
			System.out.println(ms.findId(member));
			model.addAttribute("id",ms.findId(member).getId());
			return "member/findId";
		}catch (Exception e) {
			e.printStackTrace();
			return "member/findId";
		}
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
