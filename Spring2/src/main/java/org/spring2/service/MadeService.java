package org.spring2.service;

import java.util.ArrayList;

import org.spring2.model.CartVO;
import org.spring2.model.ImageVO;
import org.spring2.model.MadeVO;

public interface MadeService {
	public void madeOrder(MadeVO mvo);

	public ArrayList<MadeVO> madeList(String id);

	public int madeAddCart(CartVO cvo);
	
	public void madeAddPimage(ImageVO ivo);
}
