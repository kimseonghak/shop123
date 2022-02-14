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
		public HashMap<String, Object> selectNoticeList(HashMap<String, Object> map) {
			int recordCountPerPage=10;
			ArrayList<Notice> list = nDAO.getNoticeList(recordCountPerPage,map);
			int naviCountPerPage=10;
			String pageNavi = nDAO.getNoticeNavi(recordCountPerPage,naviCountPerPage,map);
			HashMap<String, Object> returnMap = new HashMap<String, Object>();
			returnMap.put("list", list);
			returnMap.put("pageNavi",pageNavi);
			return returnMap;
		}

		//공지사항 글쓰기
		@Override
		public int insertWrite(Notice n) {
			// TODO Auto-generated method stub
			return nDAO.insertWrite(n);
		}

		//공지사항 글 보기(뷰)
		@Override
		public HashMap<String, Object> NoticeViewPage(int noticeNo) {
			
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
