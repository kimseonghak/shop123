package com.hot.shop.notice.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hot.shop.member.model.vo.Member;
import com.hot.shop.notice.model.dao.NoticeDAO;
import com.hot.shop.notice.model.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeDAO nDAO;

	//공지사항 리스트
	@Override
	public HashMap<String, Object> noticeList(int currentPage,HashMap<String, Object> searchMap) {
		
		int recordCountPerPage = 10;
		
		//공지사항 리스트 가져오기
		ArrayList<Notice> list = nDAO.noticeList(currentPage,recordCountPerPage,searchMap);
		
		//페이지네비 생성하기
		int naviCountPerPage=5;
		String pageNavi = nDAO.NoticeListPageNavi(recordCountPerPage, currentPage, naviCountPerPage,searchMap);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", list);
		map.put("pageNavi", pageNavi);
		
		return map;
	}

	//공지사항 글쓰기
	@Override
	public int insertWrite(Notice n) {
		// TODO Auto-generated method stub
		return nDAO.insertWrite(n);
	}

	//공지사항 글 보기(뷰)
	@Override
	public Notice NoticeViewPage(int noticeNo) {
		//nDAO.NoticeCountUpdate(noticeNo);
		return nDAO.NoticeViewPage(noticeNo);
	}

	//공지사항 수정
	@Override
	public int updateWrite(Notice n) {
		// TODO Auto-generated method stub
		return nDAO.updateWrite(n);
	}

	//공지사항 삭제
	@Override
	public int noticeDelete(int noticeNo) {
		
		return nDAO.noticeDelete(noticeNo);
	}
}
