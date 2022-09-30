package org.spring2.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.spring2.model.BoardVO;
import org.spring2.model.CartVO;
import org.spring2.model.ImageVO;
import org.spring2.model.MemberVO;
import org.spring2.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CartController {
	@Autowired
	CartService cs;
	
	@RequestMapping(value = "/cart/list", method = RequestMethod.GET)
	public void Cart() {
	}
	
	@RequestMapping(value = "/cartlist/{id}", method = RequestMethod.GET)
	public ResponseEntity<ArrayList<CartVO>> cartList(@PathVariable String id) {

		return new ResponseEntity<>(cs.cartList(id),HttpStatus.OK);
	}
	
	@RequestMapping(value = "/cartadd", method = RequestMethod.POST)
	public ResponseEntity<String> cartAdd(@RequestBody CartVO cvo) {
		if(!cvo.isDoOrder()) {
			cvo.setDoOrder(false);
		}
		System.out.println("cvo="+cvo);
		int result=cs.cartAdd(cvo);
		
		return result==1? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(value = "/cartupdate", method = RequestMethod.PUT)
	public ResponseEntity<String> cartUpdate(@RequestBody CartVO cvo) {
		int result=cs.cartUpdate(cvo);

		return result==1? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(value = "/cartremove", method = RequestMethod.DELETE)
	public ResponseEntity<String> cartRemove(@RequestBody CartVO cvo) {
		int result=cs.cartRemove(cvo);
		
		return result==1? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(value = "/cartcheck", method = RequestMethod.GET)
	public ResponseEntity<CartVO> cartCheck(CartVO cvo) {
		return new ResponseEntity<>(cs.cartCheck(cvo), HttpStatus.OK);
	}
	
	
	@RequestMapping(value = "/cart/payment", method = RequestMethod.GET)
	public void payment() {
	}
}
