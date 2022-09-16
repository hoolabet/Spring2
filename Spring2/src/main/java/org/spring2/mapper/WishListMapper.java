package org.spring2.mapper;

import java.util.ArrayList;

import org.spring2.model.WishListVO;

public interface WishListMapper {

	public ArrayList<WishListVO> wishList(String id);

	public int wishListAdd(WishListVO wvo);
	
	public int wishListRemove(WishListVO wvo);

	public WishListVO wishListcheck(WishListVO wvo);

}
