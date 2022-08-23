package org.spring2.mapper;

import org.spring2.model.MemberVO;

public interface MemberMapper {
	public void signUp(MemberVO member);

	public MemberVO login(MemberVO member);
	
	public MemberVO idchk(String id);
}
