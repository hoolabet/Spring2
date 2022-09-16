package org.spring2.service;

import java.util.ArrayList;

import org.spring2.model.CartVO;
import org.spring2.model.OrderVO;
import org.spring2.model.PaymentVO;

public interface OrderService {
	public int orderPay(PaymentVO pvo);

	public CartVO orderList(CartVO cvo);

	public int orderAdd(OrderVO ovo);

	public int orderReady(CartVO cvo);

	public ArrayList<CartVO> orderReadyList(String id);

	public ArrayList<OrderVO> orderCheck(OrderVO ovo);

	public int orderAfter(OrderVO ovo);
}
