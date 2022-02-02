package com.hot.shop.notice.model.service;

import java.util.ArrayList;

import com.hot.shop.member.model.vo.Member;
import com.hot.shop.notice.model.vo.Notice;

public interface NoticeService {

	ArrayList<Notice> noticeList();//공지사항 리스트

	int insertWrite(Notice n);//공지사항 글쓰기

	ArrayList<Notice> NoticeViewPage();//공지사항 글 조회(뷰)

}
