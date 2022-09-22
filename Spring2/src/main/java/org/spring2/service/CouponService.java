package org.spring2.service;

import java.util.ArrayList;

import org.spring2.model.CartVO;
import org.spring2.model.CouponTargetVO;
import org.spring2.model.CouponVO;

public interface CouponService {
	public void signUpCoupon(CouponTargetVO cptvo);

	public ArrayList<CouponTargetVO> couponGet(CouponTargetVO cptvo);

	public int applyCoupon(CartVO cvo);

	public CouponTargetVO couponGetOnce(CouponTargetVO cptvo);

	public int applyCoupon2(CartVO cvo);

	public int removeCoupon(CouponTargetVO cptvo);
}
