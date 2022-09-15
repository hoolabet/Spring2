package org.spring2.mapper;

import java.util.ArrayList;

import org.spring2.model.CartVO;
import org.spring2.model.PaymentVO;

public interface OrderMapper {

	public void orderPay(PaymentVO pvo);

	public CartVO orderList(CartVO cvo);

}
