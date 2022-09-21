package org.spring2.service;

import java.util.ArrayList;

import org.spring2.mapper.CouponMapper;
import org.spring2.model.CartVO;
import org.spring2.model.CouponTargetVO;
import org.spring2.model.CouponVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CouponServiceImpl implements CouponService{
	@Autowired
	CouponMapper cm;
	
	public void signUpCoupon(CouponTargetVO cptvo) {
		cm.signUpCoupon(cptvo);
	}
	
	public ArrayList<CouponTargetVO> couponGet(CouponTargetVO cptvo){
		return cm.couponGet(cptvo);
	}
	
	public int applyCoupon(CartVO cvo) {
		return cm.applyCoupon(cvo);
	}
	
	public CouponTargetVO couponGetOnce(CouponTargetVO cptvo) {
		return cm.couponGetOnce(cptvo);
	}
}