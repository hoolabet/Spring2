package org.spring2.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.spring2.model.BoardVO;
import org.spring2.model.CartVO;
import org.spring2.model.CategoryVO;
import org.spring2.model.CouponTargetVO;
import org.spring2.model.CouponVO;
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
	
	@RequestMapping(value = "/attachcoupon", method = RequestMethod.PUT)
	public ResponseEntity<String> attachCoupon(@RequestBody CartVO cvo) {
		System.out.println(cvo);
		System.out.println(cvo.getCptno());
		int result = 0;
		
		if(cvo.getCptno() == 0) {
			result = cs.detachCoupon(cvo) + cs.detachCoupon2(cvo) + 1;
		}else {
			result=cs.attachCoupon(cvo) + cs.attachCoupon2(cvo);
		}
		return result==2? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(value = "/detachcoupon", method = RequestMethod.PUT)
	public ResponseEntity<String> detachCoupon(@RequestBody CartVO cvo) {
		System.out.println(cvo);
		int result=cs.detachCoupon(cvo) + cs.detachCoupon2(cvo);
		return result==2? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(value = "/getcoupon", method = RequestMethod.GET)
	public ResponseEntity<CouponTargetVO> orderList(CouponTargetVO cptvo) {
		System.out.println(cptvo);
		return new ResponseEntity<>(cs.couponGetOnce(cptvo),HttpStatus.OK);
	}
	
	@RequestMapping(value = "/removecoupon", method = RequestMethod.PUT)
	public ResponseEntity<String> removeCoupon(@RequestBody CouponTargetVO cptvo) {
		int result=cs.removeCoupon(cptvo);
		return result==1? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(value = "/coupon/create", method = RequestMethod.GET)
	public void couponCreate() {
		
	}
	
	@RequestMapping(value = "/createcoupon", method = RequestMethod.POST)
	public ResponseEntity<String> createCoupon(@RequestBody CouponVO cpvo) {
		int result=cs.createCoupon(cpvo);
		return result==1? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(value = "/viewcoupon", method = RequestMethod.GET)
	public ResponseEntity<ArrayList<CouponVO>> viewCoupon() {
		return new ResponseEntity<>(cs.viewCoupon(),HttpStatus.OK);
	}
	
	@RequestMapping(value = "/deletecoupon", method = RequestMethod.DELETE)
	public ResponseEntity<String> removeCoupon(@RequestBody CouponVO cpvo) {
		int result=cs.deleteCoupon(cpvo);
		return result==1? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(value = "/coupon/send", method = RequestMethod.GET)
	public void couponSend(int cpno, Model model) {
		model.addAttribute("detail",cs.couponDetail(cpno));
	}
	
	@RequestMapping(value = "/categoryget", method = RequestMethod.GET)
	public ResponseEntity<ArrayList<CategoryVO>> categoryGet(CategoryVO cgvo) {
		return new ResponseEntity<>(cs.categoryGet(cgvo),HttpStatus.OK);
	}

	@RequestMapping(value = "/sendcoupon", method = RequestMethod.POST)
	public ResponseEntity<String> sendCoupon(@RequestBody CouponTargetVO cptvo) {
		cptvo.setExp_date(LocalDateTime.now().plusMonths(3).format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
		
		int result=cs.sendCoupon(cptvo);
		return result==1? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
