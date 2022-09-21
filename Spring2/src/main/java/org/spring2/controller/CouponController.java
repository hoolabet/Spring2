package org.spring2.controller;

import javax.servlet.http.HttpSession;

import org.spring2.model.CartVO;
import org.spring2.model.CouponTargetVO;
import org.spring2.model.MemberVO;
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
	
	@RequestMapping(value = "/coupon/coupon", method = RequestMethod.GET)
	public void couponGet(HttpSession session,Model model,int pno) {
		MemberVO mvo = new MemberVO();
		mvo = (MemberVO)session.getAttribute("userInfo");
		CouponTargetVO cptvo = new CouponTargetVO();
		cptvo.setId(mvo.getId());
		cptvo.setPno(pno);
		System.out.println(cptvo);
		CartVO cvo = new CartVO();
		cvo.setId(mvo.getId());
		cvo.setPno(pno);
		model.addAttribute("coupon",cs.couponGet(cptvo));
		model.addAttribute("cart",os.orderList(cvo));
	}
	
	@RequestMapping(value = "/applycoupon", method = RequestMethod.PUT)
	public ResponseEntity<String> applyCoupon(@RequestBody CartVO cvo) {
		int result=cs.applyCoupon(cvo);

		return result==1? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(value = "/getcoupon", method = RequestMethod.GET)
	public ResponseEntity<CouponTargetVO> orderList(CouponTargetVO cptvo) {
		System.out.println(cptvo);
		return new ResponseEntity<>(cs.couponGetOnce(cptvo),HttpStatus.OK);
	}
	
}
