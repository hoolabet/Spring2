package org.spring2.mapper;

import java.util.ArrayList;

import org.spring2.model.BoardVO;
import org.spring2.model.CartVO;
import org.spring2.model.ImageVO;

public interface CartMapper {
	public int cartAdd(CartVO cvo);

	public ArrayList<CartVO> cartList(String id);

	public int cartUpdate(CartVO cvo);

	public CartVO cartCheck(CartVO cvo);

	public int cartRemove(CartVO cvo);

}
