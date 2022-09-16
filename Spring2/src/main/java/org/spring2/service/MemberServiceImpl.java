package org.spring2.service;

import java.util.ArrayList;

import org.spring2.mapper.MemberMapper;
import org.spring2.model.DestinationVO;
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
	}
	// 로그인
	public MemberVO login(MemberVO member) {
		return mm.login(member);
	}
	// 아이디 중복확인
	public MemberVO idchk(String str) {
		return mm.idchk(str);
	}
	// 이메일 중복확인
	public MemberVO emchk(String str) {
		return mm.emchk(str);
	}
	// 전화번호 중복확인
	public MemberVO phchk(String str) {
		return mm.phchk(str);
	}
	// 아이디 비밀번호 찾기
	public MemberVO find(MemberVO member) {
		return mm.find(member);
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
	// 수정된 회원정보 불러오기
	public MemberVO modifyNewInfo(MemberVO member) {
		return mm.modifyNewInfo(member);
	}
	public int modifyimg(MemberVO member) {
		return mm.modifyimg(member);
	}
	public ArrayList<DestinationVO> destinationGet(String id){
		return mm.destinationGet(id);
	}
	public int destinationPost(DestinationVO des) {
		return mm.destinationPost(des);
	}
	public int destinationPut(DestinationVO des) {
		return mm.destinationPut(des);
	}
	public int destinationDelete(int dno) {
		return mm.destinationDelete(dno);
	}
	public ArrayList<MemberVO> memberListGet(MemberVO member){
		return mm.memberListGet(member);
	}
	public MemberVO memberDetail(String id) {
		return mm.memberDetail(id);
	}
}
