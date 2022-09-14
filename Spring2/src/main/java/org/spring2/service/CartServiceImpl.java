package org.spring2.service;

import java.util.ArrayList;

import org.spring2.mapper.CartMapper;
import org.spring2.model.BoardVO;
import org.spring2.model.CartVO;
import org.spring2.model.ImageVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartServiceImpl implements CartService{
	@Autowired
	CartMapper cm;

	public int cartAdd(CartVO cvo) {
		return cm.cartAdd(cvo);
	}

	public ArrayList<CartVO> cartList(String id){
		return cm.cartList(id);
	}

	public int cartUpdate(CartVO cvo) {
		return cm.cartUpdate(cvo);
	}
	
	public CartVO cartCheck(CartVO cvo) {
		return cm.cartCheck(cvo);
	}
	
	public int cartRemove(CartVO cvo) {
		return cm.cartRemove(cvo);
	}
}
