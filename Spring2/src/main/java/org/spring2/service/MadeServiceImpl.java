package org.spring2.service;

import org.spring2.mapper.MadeMapper;
import org.spring2.model.MadeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MadeServiceImpl implements MadeService{
	@Autowired
	MadeMapper mm;
	
	public void madeOrder(MadeVO mvo) {
		mm.madeOrder(mvo);
	}
}
