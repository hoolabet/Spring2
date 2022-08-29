package org.spring2.service;

import org.spring2.model.MemberVO;

public interface MemberService {

	public void signUp(MemberVO member);

	public MemberVO login(MemberVO member);
	
	public MemberVO idchk(String id);

	public MemberVO findId(MemberVO member);
}
