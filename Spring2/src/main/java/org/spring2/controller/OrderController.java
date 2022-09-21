package org.spring2.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.spring2.model.CartVO;
import org.spring2.model.CriteriaVO;
import org.spring2.model.MemberVO;
import org.spring2.model.OrderVO;
import org.spring2.model.PageVO;
import org.spring2.model.PaymentVO;
import org.spring2.service.CartService;
import org.spring2.service.MemberService;
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
public class OrderController {
	@Autowired
	CartService cs;
	
	@Autowired
	MemberService ms;
	
	@Autowired
	OrderService os;
	
	@RequestMapping(value = "/orderready", method = RequestMethod.PUT)
	public ResponseEntity<String> orderReady(@RequestBody CartVO cvo) {
		System.out.println(cvo);
		int result=os.orderReady(cvo);

		return result==1? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(value = "/order/ready", method = RequestMethod.GET)
	public void order(HttpSession session,Model model) {
		MemberVO mvo = new MemberVO();
		mvo = (MemberVO)session.getAttribute("userInfo");
		System.out.println(ms.destinationGet(mvo.getId()));
		model.addAttribute("cart",os.orderReadyList(mvo.getId()));
		model.addAttribute("des",ms.destinationGet(mvo.getId()));
	}
	
	@RequestMapping(value = "/order/complete", method = RequestMethod.GET)
	public void orderComplete() {
		
	}
	
	@RequestMapping(value = "/orderpayment", method = RequestMethod.POST)
	public ResponseEntity<String> orderPay(@RequestBody PaymentVO pvo) {
		System.out.println(pvo);
		int result=os.orderPay(pvo);

		return result==1? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(value = "/orderlist", method = RequestMethod.GET)
	public ResponseEntity<CartVO> orderList(CartVO cvo) {
		return new ResponseEntity<>(os.orderList(cvo),HttpStatus.OK);
	}
	
	@RequestMapping(value = "/orderadd", method = RequestMethod.POST)
	public ResponseEntity<String> orderAdd(@RequestBody OrderVO ovo) {
		int result=os.orderAdd(ovo);
		
		return result==1? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(value = "/ordercheck", method = RequestMethod.GET)
	public ResponseEntity<ArrayList<OrderVO>> orderCheck(OrderVO ovo) {
		return new ResponseEntity<>(os.orderCheck(ovo),HttpStatus.OK);
	}
	
	@RequestMapping(value = "/orderafter", method = RequestMethod.PUT)
	public ResponseEntity<String> orderAfter(@RequestBody OrderVO ovo) {
		int result=os.orderAfter(ovo);
		
		return result==1? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(value = "/order/research", method = RequestMethod.GET)
	public void orderResearch(HttpSession session,Model model, CriteriaVO cri) {
		MemberVO mvo = new MemberVO();
		mvo = (MemberVO)session.getAttribute("userInfo");
		cri.setSearch(mvo.getId());
		cri.setAmount(20);
		model.addAttribute("payment",os.payResearch(cri));
		model.addAttribute("paging",new PageVO(cri, os.maxNumSearch(cri)));
	}
	
	@RequestMapping(value = "/order/detail", method = RequestMethod.GET)
	public void orderDetail(Model model, int payno) {
		model.addAttribute("detail",os.orderDetail(payno));
		model.addAttribute("payment",os.payment(payno));
	}
}
