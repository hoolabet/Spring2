package org.spring2.service;

import org.spring2.model.MemberVO;

public interface MemberService {
	// 회원가입
	public void signUp(MemberVO member);
	// 로그인
	public MemberVO login(MemberVO member);
	// 아이디 중복확인
	public MemberVO idchk(MemberVO mvo);
	// 이메일 중복확인
	public MemberVO emchk(MemberVO mvo);
	// 아이디 찾기
	public MemberVO findId(MemberVO member);
	// 개인정보 수정을 위한 비밀번호 확인
	public MemberVO modify(MemberVO member);
	// 이메일 수정
	public int modifyEmail(MemberVO member);
	// 전화번호 수정
	public int modifyPhone(MemberVO member);
	// 비밀번호 수정
	public int modifyPw(MemberVO member);
	// 계정삭제
	public int modifyDelete(MemberVO member);
	
}
