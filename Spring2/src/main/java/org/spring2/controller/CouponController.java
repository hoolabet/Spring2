package org.spring2.controller;

import javax.servlet.http.HttpSession;

import org.spring2.model.BoardVO;
import org.spring2.model.CartVO;
import org.spring2.model.CouponTargetVO;
import org.spring2.model.MemberVO;
import org.spring2.service.BoardService;
import org.spring2.service.CouponService;
import org.spring2.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CouponController {
	@Autowired
	CouponService cs;
	@Autowired
	OrderService os;
	@Autowired
	BoardService bs;
	
	@RequestMapping(value = "/coupon/coupon", method = RequestMethod.GET)
	public void couponGet(HttpSession session,Model model,int pno) {
		MemberVO mvo = new MemberVO();
		mvo = (MemberVO)session.getAttribute("userInfo");
		BoardVO bvo = new BoardVO();
		bvo.setPno(pno);
		bvo = bs.detail(bvo);
		bvo.setPname(mvo.getId());
		CartVO cvo = new CartVO();
		cvo.setId(mvo.getId());
		cvo.setPno(pno);
		model.addAttribute("coupon",cs.couponGet(bvo));
		model.addAttribute("cart",os.orderList(cvo));
	}
	
	@RequestMapping(value = "/applycoupon", method = RequestMethod.PUT)
	public ResponseEntity<String> applyCoupon(@RequestBody CartVO cvo) {
		System.out.println(cvo);
		int result=cs.applyCoupon(cvo) + cs.applyCoupon2(cvo);
		return result==2? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(value = "/getcoupon", method = RequestMethod.GET)
	public ResponseEntity<CouponTargetVO> orderList(CouponTargetVO cptvo) {
		System.out.println(cptvo);
		return new ResponseEntity<>(cs.couponGetOnce(cptvo),HttpStatus.OK);
	}
	
	@RequestMapping(value = "/removecoupon", method = RequestMethod.DELETE)
	public ResponseEntity<String> removeCoupon(@RequestBody CouponTargetVO cptvo) {
		int result=cs.removeCoupon(cptvo);
		return result==1? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
