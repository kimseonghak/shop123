package com.hot.shop.farmENT.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hot.shop.farmENT.model.vo.FarmENTOrder;
import com.hot.shop.farmENT.model.vo.FarmENTProduct;

@Repository
public class FarmENTDAO {

	@Autowired
	private SqlSessionTemplate sql;

	//특정 농가의 낙찰된 상품 목록 가져오기
	public ArrayList<FarmENTProduct> selectFarmENTProductList(int recordCountPerPage, int currentPage,HashMap<String, Object>searchMap) {
		
		
		int offset = ((currentPage-1)*recordCountPerPage);
		int limit = recordCountPerPage;
		
		RowBounds rb = new RowBounds(offset,limit);
		
		return	new ArrayList<FarmENTProduct>(sql.selectList("farmENT.selectProductList", searchMap, rb));
		
	}

	//특정 농가의 낙찰된 상품 목록의 네비 생성
	public String getPageNavi(int recordCountPerPage, int currentPage, int naviCountPerPage,HashMap<String, Object>searchMap) {
		
		//pageNavi를 생성을 위한 전체 게시물의 개수
		int recordTotalCount = totalCount(searchMap);
		
		//pageNavi 개수 계산		
		int pageTotalCount; 
		
		pageTotalCount=(int)Math.ceil(recordTotalCount/(double)recordCountPerPage);
		
		
		int startNavi = ((currentPage-1)/naviCountPerPage) * naviCountPerPage+1;
		int endNavi = startNavi + naviCountPerPage-1;
		
		//endNavi 예외처리
		if(endNavi>pageTotalCount)
		{
			endNavi=pageTotalCount;
		}
		
		
		StringBuilder sb = new StringBuilder();
			
			sb.append("<nav aria-label='Page navigation example'>");
			sb.append("<ul class='pagination'>");

		
		if(startNavi!=1)
			
		{	
			sb.append("<li class='page-item'>");
			sb.append("<a style='color:#5D9A71' class='page-link' href='/farm/farmProductListPage.do?currentPage="+(startNavi-1)+"' aria-label='Previous'>");
			sb.append("<span aria-hidden='true'>&laquo;</span>");
			sb.append("</a>");
			sb.append("</li>");
		}

		
		for(int i=startNavi;i<=endNavi;i++)
		{
			
			if(i==currentPage)
			{
				sb.append("<li class='page-item'>");
				sb.append("<a class='page-link' style='color:white; background-color:#48BB78' href='/farm/farmProductListPage.do?currentPage="+ i +"' ><B>"+ i +"</B></a> ");
				sb.append("</li>");
				
			}else
			{	sb.append("<li class='page-item'>");
				sb.append("<a class='page-link' style='color:#5D9A71' href='/farm/farmProductListPage.do?currentPage="+ i +"'>"+ i +"</a> ");
				sb.append("</li>");
			}
		}
		
		if(endNavi != pageTotalCount)	
		{
			sb.append("<li class='page-item'>");
			sb.append("<a class='page-link' style='color:#5D9A71' href='/farm/farmProductListPage.do?currentPage="+(endNavi+1)+"' aria-label='Next'");
			sb.append("<span aria-hidden='true'>&raquo;</span>");
			sb.append("</a>");
			sb.append("</li>");
			sb.append(" </ul>");
			sb.append("</nav>");
		}
		
			return sb.toString();
		
	}

	//pageNavi를 생성을 위한 전체 게시물의 개수
	private int totalCount(HashMap<String, Object>searchMap) {
		
		return sql.selectOne("farmENT.selectProductTotalCount",searchMap);
		
	}

	//주문 목록 리스트 
	public ArrayList<FarmENTOrder> selectFarmENTOrderList(int recordCountPerPage, int currentPage, HashMap<String, Object> searchMap) {
		
		int offset = ((currentPage-1)*recordCountPerPage);
		int limit = recordCountPerPage;

		
		RowBounds rb = new RowBounds(offset,limit);
		
		return	new ArrayList<FarmENTOrder>(sql.selectList("farmENT.selectOrderList",searchMap,rb));
		
		
		
	}

	public String getOrderListPageNavi(int recordCountPerPage, int currentPage, int naviCountPerPage, HashMap<String, Object> searchMap) {
		
		//해당 농가 주문의 총 게시물 개수
		int recordTotalCount = orderListToTalCount(searchMap);
		
		//pageNavi 계산
		int pageTotalCount = (int)Math.ceil(recordTotalCount/(double)naviCountPerPage);
		
		int startNavi = ((currentPage-1)/naviCountPerPage) * naviCountPerPage+1;
		int endNavi = startNavi + naviCountPerPage-1;
		
		//endNavi 예외처리
		if(endNavi>pageTotalCount)
		{
			endNavi=pageTotalCount;
		}
		
		
		StringBuilder sb = new StringBuilder();
			
			sb.append("<nav aria-label='Page navigation example'>");
			sb.append("<ul class='pagination'>");

		
		if(startNavi!=1)
			
		{	
			sb.append("<li class='page-item'>");
			sb.append("<a style='color:#5D9A71' class='page-link' href='/farm/farmOrdertListPage.do?currentPage="+(startNavi-1)+"' aria-label='Previous'>");
			sb.append("<span aria-hidden='true'>&laquo;</span>");
			sb.append("</a>");
			sb.append("</li>");
		}

		
		for(int i=startNavi;i<=endNavi;i++)
		{
			
			if(i==currentPage)
			{
				sb.append("<li class='page-item'>");
				sb.append("<a class='page-link' style='color:white; background-color:#48BB78' href='/farm/farmOrdertListPage.do?currentPage="+ i +"' ><B>"+ i +"</B></a> ");
				sb.append("</li>");
				
			}else
			{	sb.append("<li class='page-item'>");
				sb.append("<a class='page-link' style='color:#5D9A71' href='/farm/farmOrdertListPage.do?currentPage="+ i +"'>"+ i +"</a> ");
				sb.append("</li>");
			}
		}
		
		if(endNavi != pageTotalCount)	
		{
			sb.append("<li class='page-item'>");
			sb.append("<a class='page-link' style='color:#5D9A71' href='/farm/farmOrdertListPage.do?currentPage="+(endNavi+1)+"' aria-label='Next'");
			sb.append("<span aria-hidden='true'>&raquo;</span>");
			sb.append("</a>");
			sb.append("</li>");
			sb.append(" </ul>");
			sb.append("</nav>");
		}
		
			return sb.toString();
		
		
		
		
	}

	private int orderListToTalCount(HashMap<String, Object> searchMap) {
		
			return	sql.selectOne("farmENT.selectOrderListTotalCount",searchMap);
		
	}
	
}
