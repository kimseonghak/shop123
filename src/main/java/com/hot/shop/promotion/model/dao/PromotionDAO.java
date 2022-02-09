package com.hot.shop.promotion.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.hot.shop.promotion.model.vo.Promotion;
import com.hot.shop.question.model.vo.QuestionUser;

@Repository
public class PromotionDAO {

	@Autowired
	@Qualifier(value="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	//홍보게시판 검색, 페이징한 리스트 가져오는 메소드
	public ArrayList<Promotion> getPromotionList(int recordCountPerPage, HashMap<String, Object> map) {
		int start = (int)map.get("currentPage")*recordCountPerPage-(recordCountPerPage-1);
		int end = (int)map.get("currentPage")*recordCountPerPage;
		
		map.put("start", start);
		map.put("end",end);
		return new ArrayList<Promotion>(sqlSession.selectList("promotion.promotionList",map));
	}

	//페이지 네비 처리하는 메소드
	public String getPromotionNavi(int recordCountPerPage, int naviCountPerPage, HashMap<String, Object> map) {
		int recordTotalCount = promotionTotalCount(map);
		int pageTotalCount = (int)Math.ceil(recordTotalCount/(double)recordCountPerPage);
		int currentPage = (int)map.get("currentPage");
		
		int startNavi = ((currentPage-1)/naviCountPerPage) *naviCountPerPage+1;
		int endNavi = startNavi+naviCountPerPage-1;
		
		if(endNavi>pageTotalCount) {
			endNavi=pageTotalCount;
		}
		
		StringBuilder sb = new StringBuilder();
		sb.append("<a href='/promotion/promotionListPage.do?currentPage=1&type="+map.get("type")+"&keyword="+map.get("keyword")+"' class='naviArrow'>&lt;&lt;</a>");
		sb.append("<a href='/promotion/promotionListPage.do?currentPage="+(currentPage-10)+"' class='naviArrow' id='prev'>&lt;</a>");
		
		for(int i= startNavi; i<=endNavi; i++) {
			if(i==currentPage) {
				sb.append("<a href='/promotion/promotionListPage.do?currentPage="+i+"&type="+map.get("type")+"&keyword="+map.get("keyword")+"' id='currentNavi'>"+i+"</a>");
			}else {
				sb.append("<a href='/promotion/promotionListPage.do?currentPage="+i+"&type="+map.get("type")+"&keyword="+map.get("keyword")+"' class='otherNavi'>"+i+"</a>");
			}
		}
		
		if((currentPage+10)>pageTotalCount) {
			sb.append("<a href='/promotion/promotionListPage.do?currentPage="+pageTotalCount+"&type="+map.get("type")+"&keyword="+map.get("keyword")+"' class='naviArrow' id='next'>&gt;</a>");
		}else {
			sb.append("<a href='/promotion/promotionListPage?currentPage="+(currentPage+10)+"&type="+map.get("type")+"&keyword="+map.get("keyword")+"' class='naviArrow' id='next'>&gt;</a>");
		}
		sb.append("<a href='/promotion/promotionListPage?currentPage="+pageTotalCount+"&type="+map.get("type")+"&keyword="+map.get("keyword")+"' class='naviArrow'>&gt;&gt;</a>");

		return sb.toString();
	}
	
	//총 페이지 네비 갯수
	private int promotionTotalCount(HashMap<String, Object> map) {
		return sqlSession.selectOne("promotion.promotionTotalCount",map);
	}

}
