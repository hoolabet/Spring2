package org.spring2.service;

import java.util.ArrayList;

import org.spring2.model.CartVO;
import org.spring2.model.PaymentVO;

public interface OrderService {
	public void orderPay(PaymentVO pvo);

	public CartVO orderList(CartVO cvo);
}
