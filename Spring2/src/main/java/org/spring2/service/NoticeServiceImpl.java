package org.spring2.service;

import java.util.ArrayList;

import org.spring2.mapper.NoticeMapper;
import org.spring2.model.CriteriaVO;
import org.spring2.model.NoticeVO;
import org.spring2.model.UploadFileVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	NoticeMapper nm;
	
	public ArrayList<NoticeVO> noList(CriteriaVO cri){
		return nm.noList(cri);
	}
	
	public void noWrite(NoticeVO nvo) {
		nm.noWrite(nvo);
		if(nvo.getUvo() != null) {
			for(UploadFileVO a: nvo.getUvo()) {
				a.setNono(nvo.getNono());
				nm.upload(a);
			}
		}
	}
	
	public NoticeVO noDetail(int nono) {
		return nm.noDetail(nono);
	}
	
	public void noModify(NoticeVO nvo) {
		nm.noModify(nvo);
		if(nvo.getUvo() != null) {
			for(UploadFileVO a: nvo.getUvo()) {
				a.setNono(nvo.getNono());
				nm.upload(a);
			}
		}
	}
	
	public void noRemove(int nono) {
		nm.noRemove(nono);
	}
	
	public int maxNumSearch(CriteriaVO cri) {
		return nm.maxNumSearch(cri);
	}
	
	public ArrayList<UploadFileVO> detailFile(int nono){
		return nm.detailFile(nono);
	}
}
