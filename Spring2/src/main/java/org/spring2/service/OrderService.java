package org.spring2.service;

import java.util.ArrayList;

import org.spring2.model.CartVO;
import org.spring2.model.CriteriaVO;
import org.spring2.model.OrderVO;
import org.spring2.model.PaymentVO;
import org.spring2.model.PointVO;

public interface OrderService {
	public int orderPay(PaymentVO pvo);

	public CartVO orderList(CartVO cvo);

	public int orderAdd(OrderVO ovo);

	public int orderReady(CartVO cvo);

	public ArrayList<CartVO> orderReadyList(String id);

	public ArrayList<OrderVO> orderCheck(OrderVO ovo);

	public int orderAfter(OrderVO ovo);

	public ArrayList<PaymentVO> payResearch(CriteriaVO cri);

	public int maxNumSearch(CriteriaVO cri);

	public ArrayList<OrderVO> orderDetail(int payno);

	public PaymentVO payment(int payno);
	
	public PointVO researchPoint(PointVO pvo);

	public int usePoint(PaymentVO pvo);
}
