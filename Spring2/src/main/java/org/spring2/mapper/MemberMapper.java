package org.spring2.mapper;

import java.util.ArrayList;

import org.spring2.model.CouponTargetVO;
import org.spring2.model.CriteriaVO;
import org.spring2.model.DestinationVO;
import org.spring2.model.InquiryVO;
import org.spring2.model.MemberVO;
import org.spring2.model.ReviewVO;
import org.springframework.web.bind.annotation.PathVariable;

public interface MemberMapper {
	// 회원가입
	public void signUp(MemberVO member);
	public void createDes(MemberVO member);
	// 로그인
	public MemberVO login(MemberVO member);
	// 아이디 중복확인	
	public MemberVO idchk(String str);
	// 이메일 중복확인
	public MemberVO emchk(String str);
	// 전화번호 중복확인
	public MemberVO phchk(String str);
	// 아이디 비밀번호 찾기
	public MemberVO find(MemberVO member);
	// 개인정보 수정을 위한 비밀번호 확인
	public MemberVO modify(MemberVO member);
	// 이메일 수정
	public int modifyEmail(MemberVO member);
	// 전화번호 수정
	public int modifyPhone(MemberVO member);
	// 비밀번호 수정
	public int modifyPw(MemberVO member);
	// 수정된 회원정보 불러오기
	public MemberVO modifyNewInfo(MemberVO member);
	// 계정삭제
	public int modifyDelete(MemberVO member);
	public int modifyimg(MemberVO member);
	public ArrayList<DestinationVO> destinationGet(String id);
	public int destinationPost(DestinationVO des);
	public int destinationPut(DestinationVO des);
	public int destinationDelete(int dno);
	public ArrayList<MemberVO> memberListGet(MemberVO member);
	public MemberVO memberDetail(String id);
	public MemberVO snsCheck(String id);
	public void snsSignup(MemberVO member);
	public void naverSignup(MemberVO member);
	public void googleSignup(MemberVO member);
	public ArrayList<CouponTargetVO> mypageCouponList(CouponTargetVO coupon);
	public void point(String id);
	public ArrayList<ReviewVO> mypageReviewList(CriteriaVO cri);
	public ArrayList<InquiryVO> mypageQnaList(InquiryVO ivo);
	public int total(CriteriaVO cri);
}
