package com.hot.shop.notice.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
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

	//공지사항 리스트 불러오기
	public ArrayList<Notice> getNoticeList(int recordCountPerPage, HashMap<String, Object> map) {
		int start = (int)map.get("currentPage")*recordCountPerPage-(recordCountPerPage-1);
		int end = (int)map.get("currentPage")*recordCountPerPage;
		
		map.put("start", start);
		map.put("end",end);
		return new ArrayList<Notice>(sqlSession.selectList("notice.noticeList",map));
	}

	//페이지네비
	public String getNoticeNavi(int recordCountPerPage, int naviCountPerPage, HashMap<String, Object> map) {
		
		int recordTotalCount = noticeTotalCount(map);
		int pageTotalCount = (int)Math.ceil(recordTotalCount/(double)recordCountPerPage);
		int currentPage = (int)map.get("currentPage");
		
		int startNavi = ((currentPage-1)/naviCountPerPage) *naviCountPerPage+1;
		int endNavi = startNavi+naviCountPerPage-1;
		
		if(endNavi>pageTotalCount) {
			endNavi=pageTotalCount;
		}
		
		StringBuilder sb = new StringBuilder();
		sb.append("<a href='/notice/noticeListPage.do?currentPage=1&type="+map.get("type")+"&keyword="+map.get("keyword")+"' class='naviArrow'>&lt;&lt;</a>");
		sb.append("<a href='/notice/noticeListPage.do?currentPage="+(currentPage-10)+"' class='naviArrow' id='prev'>&lt;</a>");
		
		for(int i= startNavi; i<=endNavi; i++) {
			if(i==currentPage) {
				sb.append("<a href='/notice/noticeListPage.do?currentPage="+i+"&type="+map.get("type")+"&keyword="+map.get("keyword")+"' id='currentNavi'>"+i+"</a>");
			}else {
				sb.append("<a href='/notice/noticeListPage.do?currentPage="+i+"&type="+map.get("type")+"&keyword="+map.get("keyword")+"' class='otherNavi'>"+i+"</a>");
			}
		}
		
		if((currentPage+10)>pageTotalCount) {
			sb.append("<a href='/notice/noticeListPage.do?currentPage="+pageTotalCount+"&type="+map.get("type")+"&keyword="+map.get("keyword")+"' class='naviArrow' id='next'>&gt;</a>");
		}else {
			sb.append("<a href='/notice/noticeListPage.do?currentPage="+(currentPage+10)+"&type="+map.get("type")+"&keyword="+map.get("keyword")+"' class='naviArrow' id='next'>&gt;</a>");
		}
		sb.append("<a href='/notice/noticeListPage.do?currentPage="+pageTotalCount+"&type="+map.get("type")+"&keyword="+map.get("keyword")+"' class='naviArrow'>&gt;&gt;</a>");

		return sb.toString();
	}

	//페이지 네비 총 갯수
	private int noticeTotalCount(HashMap<String, Object> map) {
		
		return sqlSession.selectOne("notice.selectNoticeListTotalCount",map);
	}

	//공지사항 글쓰기
	public int insertWrite(Notice n) {
		// TODO Auto-generated method stub
		return sqlSession.insert("notice.insertWrite", n);
	}

	//공지사항 글 보기(뷰)
	public HashMap<String, Object> NoticeViewPage(int noticeNo) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("notice", sqlSession.selectOne("notice.noticeView",noticeNo));
		map.put("noticeViewCountResult", sqlSession.update("notice.noticeViewCount",noticeNo));
		return map;
	}

	//공지사항 수정
	public int updateWrite(Notice n) {
		// TODO Auto-generated method stub
		return sqlSession.update("notice.updateNotice", n);
	}

	//공지사항 삭제
	public int noticeDelete(int noticeNo) {
		
		return sqlSession.update("notice.deleteNotice", noticeNo);
	}
}
