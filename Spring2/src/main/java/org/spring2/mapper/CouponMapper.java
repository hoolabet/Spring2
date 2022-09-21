package org.spring2.mapper;

import java.util.ArrayList;

import org.spring2.model.CartVO;
import org.spring2.model.CouponTargetVO;

public interface CouponMapper {
	public void signUpCoupon(CouponTargetVO ctvo);

	public ArrayList<CouponTargetVO> couponGet(CouponTargetVO cptvo);

	public int applyCoupon(CartVO cvo);

	public CouponTargetVO couponGetOnce(CouponTargetVO cptvo);
}
