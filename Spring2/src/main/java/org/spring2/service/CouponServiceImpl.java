package org.spring2.service;

import org.spring2.mapper.CouponMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CouponServiceImpl implements CouponService{
	@Autowired
	CouponMapper cm;
	
	public void signUpCoupon(String id) {
		cm.signUpCoupon(id);
	}
}
