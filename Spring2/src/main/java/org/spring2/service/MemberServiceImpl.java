package org.spring2.service;

import org.spring2.mapper.MemberMapper;
import org.spring2.model.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	MemberMapper mm;
	public void signUp(MemberVO member) {
		mm.signUp(member);
	}
}
