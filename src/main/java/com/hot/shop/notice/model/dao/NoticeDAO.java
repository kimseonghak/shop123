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

	//공지사항 리스트
	public ArrayList<Notice> noticeList(int currentPage, int recordCountPerPage, HashMap<String, Object> searchMap) {
		
		int offset = ((currentPage-1)*recordCountPerPage);
		int limit = recordCountPerPage;
		
		RowBounds rb = new RowBounds(offset,limit);
		
		return new ArrayList<Notice>(sqlSession.selectList("notice.noticeList",searchMap,rb));
	}

	//페이지네비
	public String NoticeListPageNavi(int recordCountPerPage, int currentPage, int naviCountPerPage,HashMap<String, Object> searchMap) {
			
		//공지사항 총 게시물 개수
		int recordTotalCount = noticeListToTalCount(searchMap);
		
		//pageNavi 계산
		int pageTotalCount = (int)Math.ceil(recordTotalCount/(double)recordCountPerPage);
		
		int startNavi = ((currentPage-1)/naviCountPerPage) * naviCountPerPage+1;
		int endNavi = startNavi + naviCountPerPage-1;
		
		//endNavi 예외처리
		if(endNavi>pageTotalCount){
			endNavi=pageTotalCount;
		}
		
		StringBuilder sb = new StringBuilder();
		
		sb.append("<nav aria-label='Page navigation example'>");
		sb.append("<ul class='pagination'>");
		
		if(startNavi!=1)
		{	
			sb.append("<li class='page-item'>");
			sb.append("<a style='color:#5D9A71' class='page-link' href='/farm/farmNoticePage.do?currentPage="+(startNavi-1)+"' aria-label='Previous'>");
			sb.append("<span aria-hidden='true'>&laquo;</span>");
			sb.append("</a>");
			sb.append("</li>");
		}
		
		for(int i=startNavi;i<=endNavi;i++)
		{
			
			if(i==currentPage)
			{
				sb.append("<li class='page-item'>");
				sb.append("<a class='page-link' style='color:white; background-color:#48BB78' href='/farm/farmNoticePage.do?currentPage="+ i +"' ><B>"+ i +"</B></a> ");
				sb.append("</li>");
				
			}else
			{	sb.append("<li class='page-item'>");
				sb.append("<a class='page-link' style='color:#5D9A71' href='/farm/farmNoticePage.do?currentPage="+ i +"'>"+ i +"</a> ");
				sb.append("</li>");
			}
		}
		
		if(endNavi != pageTotalCount)	
		{
			sb.append("<li class='page-item'>");
			sb.append("<a class='page-link' style='color:#5D9A71' href='/farm/farmNoticePage.do?currentPage="+(endNavi+1)+"' aria-label='Next'");
			sb.append("<span aria-hidden='true'>&raquo;</span>");
			sb.append("</a>");
			sb.append("</li>");
			sb.append(" </ul>");
			sb.append("</nav>");
		}
		
		return sb.toString();
	};
	
	private int noticeListToTalCount(HashMap<String, Object> searchMap) {
		
		return sqlSession.selectOne("notice.selectNoticeListTotalCount",searchMap);
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

	//공지사항 수정
	public int updateWrite(Notice n) {
		// TODO Auto-generated method stub
		return sqlSession.update("notice.updateNotice", n);
	}

	//공지사항 삭제
	public int noticeDelete(int noticeNo) {
		
		return sqlSession.update("notice.deleteNotice", noticeNo);
	}

	
	
	/*
	//공지사항 조회수 업데이트
	public int NoticeCountUpdate(int noticeNo) {
		return sqlSession.update("notice.NoticeCountUpdate",noticeNo);
	}
	*/
}
