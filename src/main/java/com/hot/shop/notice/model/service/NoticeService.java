package com.hot.shop.notice.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.hot.shop.member.model.vo.Member;
import com.hot.shop.notice.model.vo.Notice;

public interface NoticeService {

	HashMap<String, Object> noticeList(int currentPage,HashMap<String, Object> searchMap);//공지사항 리스트

	int insertWrite(Notice n);//공지사항 글쓰기

	Notice NoticeViewPage(int noticeNo);//공지사항 글 조회(뷰)

	int updateWrite(Notice n); //공지사항 수정

	int noticeDelete(int noticeNo); //공지사항 삭제

}
