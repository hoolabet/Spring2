package org.spring2.service;

import java.util.ArrayList;

import org.spring2.mapper.QnAMapper;
import org.spring2.model.QnAVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QnAServiceImpl implements QnAService{
	@Autowired
	QnAMapper qm;
	
	public ArrayList<QnAVO> qnaList(){
		return qm.qnaList();
	}
}
