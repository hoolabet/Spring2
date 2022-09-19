package org.spring2.service;

import java.util.ArrayList;

import org.spring2.mapper.OrderMapper;
import org.spring2.model.CartVO;
import org.spring2.model.CriteriaVO;
import org.spring2.model.OrderVO;
import org.spring2.model.PaymentVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderServiceImpl implements OrderService{
	@Autowired
	OrderMapper om;
	
	public int orderPay(PaymentVO pvo) {
		return om.orderPay(pvo);
	}
	
	public CartVO orderList(CartVO cvo){
		return om.orderList(cvo);
	}
	
	public int orderAdd(OrderVO ovo) {
		return om.orderAdd(ovo);
	}
	
	public int orderReady(CartVO cvo) {
		return om.orderReady(cvo);
	}
	
	public ArrayList<CartVO> orderReadyList(String id){
		return om.orderReadyList(id);
	}
	
	public ArrayList<OrderVO> orderCheck(OrderVO ovo) {
		return om.orderCheck(ovo);
	}
	
	public int orderAfter(OrderVO ovo) {
		return om.orderAfter(ovo);
	}
	
	public ArrayList<PaymentVO> payResearch(CriteriaVO cri){
		return om.payResearch(cri);
	}
	
	public int maxNumSearch(CriteriaVO cri) {
		return om.maxNumSearch(cri);
	}
	
	public ArrayList<OrderVO> orderDetail(int payno){
		return om.orderDetail(payno);
	}
	
	public PaymentVO payment(int payno) {
		return om.payment(payno);
	}
}
