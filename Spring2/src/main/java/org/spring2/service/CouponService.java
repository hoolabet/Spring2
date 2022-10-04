package org.spring2.service;

import java.util.ArrayList;

import org.spring2.model.BoardVO;
import org.spring2.model.CartVO;
import org.spring2.model.CategoryVO;
import org.spring2.model.CouponTargetVO;
import org.spring2.model.CouponVO;

public interface CouponService {
	public void signUpCoupon(CouponTargetVO cptvo);

	public ArrayList<CouponTargetVO> couponGet(BoardVO bvo);

	public int attachCoupon(CartVO cvo);

	public CouponTargetVO couponGetOnce(CouponTargetVO cptvo);

	public int attachCoupon2(CartVO cvo);

	public int removeCoupon(CouponTargetVO cptvo);

	public int createCoupon(CouponVO cpvo);

	public ArrayList<CouponVO> viewCoupon();

	public int deleteCoupon(CouponVO cpvo);

	public CouponVO couponDetail(int cpno);

	public ArrayList<CategoryVO> categoryGet(CategoryVO cgvo);

	public int sendCoupon(CouponTargetVO cptvo);

	public int detachCoupon(CartVO cvo);

	public int detachCoupon2(CartVO cvo);

	public void refreshCoupon();
}
