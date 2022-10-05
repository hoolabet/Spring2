package org.spring2.mapper;

import java.util.ArrayList;

import org.spring2.model.CriteriaVO;
import org.spring2.model.NoticeVO;
import org.spring2.model.UploadFileVO;

public interface NoticeMapper {
	
	public ArrayList<NoticeVO> noList(CriteriaVO cri);
	
	public void noWrite(NoticeVO nvo);
	
	public NoticeVO noDetail(int nono);
	
	public void noModify(NoticeVO nvo);
	
	public void noRemove(int nono);
	
	public int maxNumSearch(CriteriaVO cri);
	
}
