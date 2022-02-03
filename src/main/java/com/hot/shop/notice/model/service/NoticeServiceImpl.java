package com.hot.shop.notice.model.service;

import java.util.ArrayList;

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
	public ArrayList<Notice> noticeList() {
		// TODO Auto-generated method stub
		return nDAO.noticeList();
	}

	//공지사항 글쓰기
	@Override
	public int insertWrite(Notice n) {
		// TODO Auto-generated method stub
		return nDAO.insertWrite(n);
	}

	//공지사항 글 보기(뷰)
	@Override
	public ArrayList<Notice> NoticeViewPage() {
		// TODO Auto-generated method stub
		return nDAO.NoticeViewPage();
	}
}
