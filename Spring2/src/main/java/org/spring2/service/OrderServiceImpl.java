package org.spring2.service;

import java.util.ArrayList;

import org.spring2.mapper.OrderMapper;
import org.spring2.model.CartVO;
import org.spring2.model.PaymentVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderServiceImpl implements OrderService{
	@Autowired
	OrderMapper om;
	
	public void orderPay(PaymentVO pvo) {
		om.orderPay(pvo);
	}
	
	public CartVO orderList(CartVO cvo){
		return om.orderList(cvo);
	}
}
