package org.spring2.service;

import java.util.ArrayList;

import org.spring2.mapper.MadeMapper;
import org.spring2.model.CartVO;
import org.spring2.model.ImageVO;
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
	
	public ArrayList<MadeVO> madeList(String id){
		return mm.madeList(id);
	}
	
	public int madeAddCart(CartVO cvo) {
		return mm.madeAddCart(cvo);
	}
	
	public void madeAddPimage(ImageVO ivo) {
		mm.madeAddPimage(ivo);
	}
}
