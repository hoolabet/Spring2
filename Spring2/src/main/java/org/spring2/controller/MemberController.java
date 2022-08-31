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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {
	@Autowired
	MemberService ms;
	// 회원가입
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
	// 아이디 중복체크

	// 이메일 중복체크
	@RequestMapping(value = "/member/signup/{str}", method = RequestMethod.GET)
	public ResponseEntity<String> emchk(@PathVariable String str) {
		try{
			if(str.contains("@")) {
				return new ResponseEntity<>(ms.emchk(str).getEmail(),HttpStatus.OK);
			}else {
				return new ResponseEntity<>(ms.idchk(str).getId(),HttpStatus.OK);
			}
		}catch (Exception e) {
			// TODO: handle exception
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}


	// 로그인
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

	// 아이디찾기
	@RequestMapping(value = "/member/findId", method = RequestMethod.GET)
	public String findIdGet() {
		return "member/findId";
	}
	@RequestMapping(value = "/member/findId", method = RequestMethod.POST)
	public String findIdPost(MemberVO member,Model model) {
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


	// 마이페이지
	@RequestMapping(value = "/member/mypage", method = RequestMethod.GET)
	public String mypage() {
		return "member/mypage";
	}

	// 개인정보 수정 전 비밀번호 확인
	@RequestMapping(value = "/member/modifyInfoPWCheck", method = RequestMethod.GET)
	public String modifyGet() {
		return "member/modifyInfoPWCheck";
	}
	@RequestMapping(value = "/member/modifyInfoPWCheck", method = RequestMethod.POST)
	public String modifyPost(MemberVO member,HttpSession session) {
		System.out.println(ms.modify(member));


		if(ms.modify(member) != null) {

			return "redirect:/member/memInfo";
		} else {
			return "member/modifyInfoPWCheck";
		}
	}
	// 개인정보 수정
	@RequestMapping(value = "/member/memInfo", method = RequestMethod.GET)
	public String memInfoGet() {
		return "member/memInfo";
	}
	// 이메일 수정
	@RequestMapping(value = "/member/modifyEmail", method = RequestMethod.PUT)
	public ResponseEntity<String> modifyEmail(@RequestBody MemberVO member) {
		System.out.println(member);

		int result=ms.modifyEmail(member);
		System.out.println(result);


		return result==1? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// 전화번호 수정
	@RequestMapping(value = "/member/modifyPhone", method = RequestMethod.PUT)
	public ResponseEntity<String> modifyPhone(@RequestBody MemberVO member) {
		System.out.println(member);

		int result=ms.modifyPhone(member);
		System.out.println(result);


		return result==1? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// 비밀번호 수정
	@RequestMapping(value = "/member/modifyPw", method = RequestMethod.PUT)
	public ResponseEntity<String> modifyPw(@RequestBody MemberVO member,HttpSession session) {
		System.out.println(member);

		int result=ms.modifyPw(member);
		System.out.println(result);

		session.invalidate();
		return result==1? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// 계정삭제
	@RequestMapping(value = "/member/modifyDelete", method = RequestMethod.DELETE)
	public ResponseEntity<String> modifyDelete(@RequestBody MemberVO member,HttpSession session) {
		System.out.println(member);

		int result=ms.modifyDelete(member);
		System.out.println(result);

		session.invalidate();
		return result==1? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}



}
