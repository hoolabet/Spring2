package org.spring2.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.spring2.model.CartVO;
import org.spring2.model.MemberVO;
import org.spring2.model.PaymentVO;
import org.spring2.service.CartService;
import org.spring2.service.MemberService;
import org.spring2.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class OrderController {
	@Autowired
	CartService cs;
	
	@Autowired
	MemberService ms;
	
	@Autowired
	OrderService os;
	
	@RequestMapping(value = "/order/ready", method = RequestMethod.GET)
	public void order(HttpSession session,Model model) {
		MemberVO mvo = new MemberVO();
		mvo = (MemberVO)session.getAttribute("userInfo");
		System.out.println(ms.destinationGet(mvo.getId()));
		model.addAttribute("cart",cs.cartList(mvo.getId()));
		model.addAttribute("des",ms.destinationGet(mvo.getId()));
	}
	
	@RequestMapping(value = "/order/end", method = RequestMethod.POST)
	public void orderPay(PaymentVO pvo) {
		try {
			os.orderPay(pvo);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/orderlist", method = RequestMethod.GET)
	public ResponseEntity<CartVO> orderPay(CartVO cvo) {
		System.out.println(cvo);
		return new ResponseEntity<>(os.orderList(cvo),HttpStatus.OK);
	}
	
}
