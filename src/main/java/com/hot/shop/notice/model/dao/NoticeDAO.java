package com.hot.shop.notice.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.hot.shop.member.model.vo.Member;
import com.hot.shop.notice.model.vo.Notice;

@Repository
public class NoticeDAO {
	@Autowired
	@Qualifier(value="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	//공지사항 리스트
	public ArrayList<Notice> noticeList() {
		// TODO Auto-generated method stub
		return new ArrayList<Notice>(sqlSession.selectList("notice.noticeList"));
	}

	//공지사항 글쓰기
	public int insertWrite(Notice n) {
		// TODO Auto-generated method stub
		return sqlSession.insert("notice.insertWrite", n);
	}

	//공지사항 글 보기(뷰)
	public Notice NoticeViewPage(int noticeNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("notice.NoticeViewPage",noticeNo);
	}
	
	/*
	//공지사항 조회수 업데이트
	public int NoticeCountUpdate(int noticeNo) {
		return sqlSession.update("notice.NoticeCountUpdate",noticeNo);
	}
	*/
}
