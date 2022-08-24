package org.spring2.service;

import java.util.ArrayList;

import org.spring2.mapper.AdminMapper;
import org.spring2.model.MemberVO;
import org.spring2.model.QnAVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	AdminMapper am;
	
	// 제품등록 구현
	public void add() {
		
	}
	// 회원목록 구현
	public ArrayList<MemberVO> memberlist() {
		return am.memberlist();
	}
	// QnA목록 구현
	public ArrayList<QnAVO> qnalist() {
		return am.qnalist();
	}
}
