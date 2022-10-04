package org.spring2.service;

import java.util.ArrayList;

import org.spring2.mapper.CouponMapper;
import org.spring2.model.BoardVO;
import org.spring2.model.CartVO;
import org.spring2.model.CategoryVO;
import org.spring2.model.CouponTargetVO;
import org.spring2.model.CouponVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mysql.cj.xdevapi.Result;

@Service
public class CouponServiceImpl implements CouponService{
	@Autowired
	CouponMapper cm;
	
	public void signUpCoupon(CouponTargetVO cptvo) {
		cm.signUpCoupon(cptvo);
	}
	
	public ArrayList<CouponTargetVO> couponGet(BoardVO bvo){
		return cm.couponGet(bvo);
	}
	
	public int attachCoupon(CartVO cvo) {
		return cm.attachCoupon(cvo);
	}
	
	public CouponTargetVO couponGetOnce(CouponTargetVO cptvo) {
		return cm.couponGetOnce(cptvo);
	}
	
	public int attachCoupon2(CartVO cvo) {
		return cm.attachCoupon2(cvo);
	}
	
	public int removeCoupon(CouponTargetVO cptvo) {
		return cm.removeCoupon(cptvo);
	}
	
	public int createCoupon(CouponVO cpvo) {
		return cm.createCoupon(cpvo);
	}
	
	public ArrayList<CouponVO> viewCoupon(){
		return cm.viewCoupon();
	}
	
	public int deleteCoupon(CouponVO cpvo) {
		return cm.deleteCoupon(cpvo);
	}
	
	public CouponVO couponDetail(int cpno) {
		return cm.couponDetail(cpno);
	}
	
	public ArrayList<CategoryVO> categoryGet(CategoryVO cgvo){
		return cm.categoryGet(cgvo);
	}
	
	public int sendCoupon(CouponTargetVO cptvo) {
		return cm.sendCoupon(cptvo);
	}
	
	public int detachCoupon(CartVO cvo) {
		return cm.detachCoupon(cvo);
	}

	public int detachCoupon2(CartVO cvo) {
		return cm.detachCoupon2(cvo);
	}
	
	public void refreshCoupon() {
		cm.refreshCoupon();
	}
	
}
