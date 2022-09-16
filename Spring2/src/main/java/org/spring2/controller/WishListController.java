package org.spring2.controller;


import java.util.ArrayList;

import org.spring2.model.WishListVO;
import org.spring2.service.WishListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class WishListController {
	@Autowired
	WishListService ws;
	
	@RequestMapping(value = "/member/wishList", method = RequestMethod.GET)
	public void wish() {
	}
	// 찜목록
	@RequestMapping(value = "/member/wishList/{id}", method = RequestMethod.GET)
	public ResponseEntity<ArrayList<WishListVO>> wishList(@PathVariable String id) {

		return new ResponseEntity<>(ws.wishList(id),HttpStatus.OK);
	}
	//찜목록 추가
	@RequestMapping(value = "/wishListadd", method = RequestMethod.POST)
	public ResponseEntity<String> wishListAdd(@RequestBody WishListVO wvo){
		int result=ws.wishListAdd(wvo);
		
		return result==1? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	// 찜목록 중복확인
	@RequestMapping(value = "/wishListcheck", method = RequestMethod.GET)
	public ResponseEntity<WishListVO> wishListcheck(WishListVO wvo){
		System.out.println(wvo);
		return new ResponseEntity<>(ws.wishListcheck(wvo),HttpStatus.OK);
		
	}
	// 찜목록에서 삭제
	@RequestMapping(value = "/wishListremove", method = RequestMethod.DELETE)
	public ResponseEntity<String> wishListRemove(@RequestBody WishListVO wvo){
		int result=ws.wishListRemove(wvo);
		
		return result==1? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	
	
	
}
