package org.spring2.service;

import org.spring2.mapper.MemberMapper;
import org.spring2.model.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	MemberMapper mm;
	// 회원가입
	public void signUp(MemberVO member) {
		mm.signUp(member);
		mm.createDes(member);
	}
	// 로그인
	public MemberVO login(MemberVO member) {
		return mm.login(member);
	}
	// 아이디 중복확인
	public MemberVO idchk(MemberVO mvo) {
		return mm.idchk(mvo);
	}
	// 이메일 중복확인
	public MemberVO emchk(MemberVO mvo) {
		return mm.emchk(mvo);
	}
	// 아이디 찾기
	public MemberVO findId(MemberVO member) {
		return mm.findId(member);
	}
	// 개인정보 수정을 위한 비밀번호 확인
	public MemberVO modify(MemberVO member) {
		return mm.modify(member);
	}
	// 이메일 수정
	public int modifyEmail(MemberVO member) {
		return mm.modifyEmail(member);
	}
	// 전화번호 수정
	public int modifyPhone(MemberVO member) {
		return mm.modifyPhone(member);
	}
	// 비밀번호 수정
	public int modifyPw(MemberVO member) {
		return mm.modifyPw(member);
	}
	// 계정삭제
	public int modifyDelete(MemberVO member) {
		return mm.modifyDelete(member);
	}
}
