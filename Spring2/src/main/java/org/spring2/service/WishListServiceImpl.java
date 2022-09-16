package org.spring2.service;

import java.util.ArrayList;

import org.spring2.mapper.WishListMapper;
import org.spring2.model.WishListVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WishListServiceImpl implements WishListService{
	@Autowired
	WishListMapper wm;
	
	
	public ArrayList<WishListVO> wishList(String id){
		return wm.wishList(id);
	}
	
	public int wishListAdd(WishListVO wvo) {
		return wm.wishListAdd(wvo);
	}
	
	public int wishListRemove(WishListVO wvo) {
		return wm.wishListRemove(wvo);
	}
	
	public WishListVO wishListcheck(WishListVO wvo) {
		return wm.wishListcheck(wvo);
	}
}
