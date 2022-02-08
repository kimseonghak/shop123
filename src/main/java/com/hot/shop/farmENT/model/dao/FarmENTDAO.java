package com.hot.shop.farmENT.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hot.shop.farmENT.model.vo.FarmENTDeliveryStatus;
import com.hot.shop.farmENT.model.vo.FarmENTOrder;
import com.hot.shop.farmENT.model.vo.FarmENTProduct;
import com.hot.shop.farmENT.model.vo.FarmENTQna;
import com.hot.shop.farmENT.model.vo.FarmENTRefund;
import com.hot.shop.member.model.vo.Member;
import com.hot.shop.notice.model.vo.Notice;


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
			if(searchMap.get("keyWord")!=null)
			{
				sb.append("<a style='color:#5D9A71' class='page-link' href='/farm/farmProductListPage.do?currentPage="+(startNavi-1)+"&type="+searchMap.get("type")+"&keyWord="+searchMap.get("keyWord")+"' aria-label='Previous'>");
			}else
			{
				sb.append("<a style='color:#5D9A71' class='page-link' href='/farm/farmProductListPage.do?currentPage="+(startNavi-1)+"' aria-label='Previous'>");
			}
			sb.append("<span aria-hidden='true'>&laquo;</span>");
			sb.append("</a>");
			sb.append("</li>");
		}

		
		for(int i=startNavi;i<=endNavi;i++)
		{
			
			if(i==currentPage)
			{
				sb.append("<li class='page-item'>");
				
				if(searchMap.get("keyWord")!=null)
				{
					sb.append("<a class='page-link' style='color:white; background-color:#48BB78' href='/farm/farmProductListPage.do?currentPage="+ i +"&type="+searchMap.get("type")+"&keyWord="+searchMap.get("keyWord")+"' ><B>"+ i +"</B></a> ");
				}else {
					sb.append("<a class='page-link' style='color:white; background-color:#48BB78' href='/farm/farmProductListPage.do?currentPage="+ i +"' ><B>"+ i +"</B></a> ");	
				}
				sb.append("</li>");
				
			}else
			{	sb.append("<li class='page-item'>");
			
				if(searchMap.get("keyWord")!=null)
				{
					sb.append("<a class='page-link' style='color:#5D9A71' href='/farm/farmProductListPage.do?currentPage="+ i +"&type="+searchMap.get("type")+"&keyWord="+searchMap.get("keyWord")+"'>"+ i +"</a> ");
				}else {
					sb.append("<a class='page-link' style='color:#5D9A71' href='/farm/farmProductListPage.do?currentPage="+ i +"'>"+ i +"</a> ");
				}
				sb.append("</li>");
			}
		}
		
		if(endNavi != pageTotalCount)	
		{
			sb.append("<li class='page-item'>");
			if(searchMap.get("keyWord")!=null)
			{
				sb.append("<a class='page-link' style='color:#5D9A71' href='/farm/farmProductListPage.do?currentPage="+(endNavi+1)+"&type="+searchMap.get("type")+"&keyWord="+searchMap.get("keyWord")+"' aria-label='Next'");
			}else
			{
				sb.append("<a class='page-link' style='color:#5D9A71' href='/farm/farmProductListPage.do?currentPage="+(endNavi+1)+"' aria-label='Next'");
			}
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
		int pageTotalCount = (int)Math.ceil(recordTotalCount/(double)recordCountPerPage);
		
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
			if(searchMap.get("keyWord")!=null)
			{
				sb.append("<a style='color:#5D9A71' class='page-link' href='/farm/farmOrdertListPage.do?currentPage="+(startNavi-1)+"&type="+searchMap.get("type")+"&keyWord="+searchMap.get("keyWord")+"' aria-label='Previous'>");
			}else
			{
				sb.append("<a style='color:#5D9A71' class='page-link' href='/farm/farmOrdertListPage.doo?currentPage="+(startNavi-1)+"' aria-label='Previous'>");
			}
			sb.append("<span aria-hidden='true'>&laquo;</span>");
			sb.append("</a>");
			sb.append("</li>");
		}

		
		for(int i=startNavi;i<=endNavi;i++)
		{
			
			if(i==currentPage)
			{
				sb.append("<li class='page-item'>");
				if(searchMap.get("keyWord")!=null)
				{
					sb.append("<a class='page-link' style='color:white; background-color:#48BB78' href='/farm/farmOrdertListPage.do?currentPage="+ i +"&type="+searchMap.get("type")+"&keyWord="+searchMap.get("keyWord")+"' ><B>"+ i +"</B></a> ");
				}else {
					sb.append("<a class='page-link' style='color:white; background-color:#48BB78' href='/farm/farmOrdertListPage.do?currentPage="+ i +"' ><B>"+ i +"</B></a> ");	
				}
				sb.append("</li>");
				
			}else
			{	sb.append("<li class='page-item'>");
				if(searchMap.get("keyWord")!=null)
				{
					sb.append("<a class='page-link' style='color:#5D9A71' href='/farm/farmOrdertListPage.do?currentPage="+ i +"&type="+searchMap.get("type")+"&keyWord="+searchMap.get("keyWord")+"'>"+ i +"</a> ");
				}else {
					sb.append("<a class='page-link' style='color:#5D9A71' href='/farm/farmOrdertListPage.do?currentPage="+ i +"'>"+ i +"</a> ");
				}
				sb.append("</li>");
			}
		}
		
		if(endNavi != pageTotalCount)	
		{
			sb.append("<li class='page-item'>");
			if(searchMap.get("keyWord")!=null)
			{
				sb.append("<a class='page-link' style='color:#5D9A71' href='/farm/farmOrdertListPage.do?currentPage="+(endNavi+1)+"&type="+searchMap.get("type")+"&keyWord="+searchMap.get("keyWord")+"' aria-label='Next'");
			}else
			{
				sb.append("<a class='page-link' style='color:#5D9A71' href='/farm/farmOrdertListPage.do?currentPage="+(endNavi+1)+"' aria-label='Next'");
			}
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
	//회원정보
	public ArrayList<Member> selectOneMember(int userNo) {
		
			return new ArrayList<Member>(sql.selectList("farmENT.selectOneMember",userNo));
		
	}

	//상품정보
	public ArrayList<FarmENTProduct> selectOneProduct(String productName, int farmNo) {
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("productName", productName);
		data.put("farmNo", farmNo);
		
		return new ArrayList<FarmENTProduct> (sql.selectList("farmENT.selectOneProduct",data));
	}
	
	//배송상태 입력
	public int farmDeliveryInput(HashMap<String, Object> map) {
		
		return  sql.insert("farmENT.insertDeliveryStatus",map) + sql.update("farmENT.updatePurchaselist",map);
		
		
	}

	public ArrayList<FarmENTDeliveryStatus> selectDeliveryInputData(int buyNo) {

		RowBounds rb = new RowBounds(0,1);
		
		return new ArrayList<FarmENTDeliveryStatus>(sql.selectList("farmENT.selectDeliveryInputData",buyNo,rb));
		
		
	}

	//공지사항 질문리스트
	public ArrayList<Notice> selectNoticeList(int currentPage,int recordCountPerPage,HashMap<String, Object> searchMap) {
		
		int offset = ((currentPage-1)*recordCountPerPage);
		int limit = recordCountPerPage;
		
		RowBounds rb = new RowBounds(offset,limit);
		
		return	new ArrayList<Notice>(sql.selectList("farmENT.selectNoticeList",searchMap,rb));
		
	}

	public String getNoticeListPageNavi(int recordCountPerPage, int currentPage, int naviCountPerPage,HashMap<String, Object> searchMap) {
		
		//공지사항 총 게시물 개수
		int recordTotalCount = noticeListToTalCount(searchMap);
		
		//pageNavi 계산
		int pageTotalCount = (int)Math.ceil(recordTotalCount/(double)recordCountPerPage);
		
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
			if(searchMap.get("keyWord")!=null)
			{
				sb.append("<a style='color:#5D9A71' class='page-link' href='/farm/farmNoticePage.do?currentPage="+(startNavi-1)+"&type="+searchMap.get("type")+"&keyWord="+searchMap.get("keyWord")+"' aria-label='Previous'>");
			}else
			{
				sb.append("<a style='color:#5D9A71' class='page-link' href='/farm/farmNoticePage.do?currentPage="+(startNavi-1)+"' aria-label='Previous'>");
			}
			sb.append("<span aria-hidden='true'>&laquo;</span>");
			sb.append("</a>");
			sb.append("</li>");
		}
	
		
		for(int i=startNavi;i<=endNavi;i++)
		{
			
			if(i==currentPage)
			{
				sb.append("<li class='page-item'>");
				if(searchMap.get("keyWord")!=null)
				{
					sb.append("<a class='page-link' style='color:white; background-color:#48BB78' href='/farm/farmNoticePage.do?currentPage="+ i +"&type="+searchMap.get("type")+"&keyWord="+searchMap.get("keyWord")+"' ><B>"+ i +"</B></a> ");
				}else {
					sb.append("<a class='page-link' style='color:white; background-color:#48BB78' href='/farm/farmNoticePage.do?currentPage="+ i +"' ><B>"+ i +"</B></a> ");	
				}
				sb.append("</li>");
				
			}else
			{	sb.append("<li class='page-item'>");
				if(searchMap.get("keyWord")!=null)
				{
					sb.append("<a class='page-link' style='color:#5D9A71' href='/farm/farmNoticePage.do?currentPage="+ i +"&type="+searchMap.get("type")+"&keyWord="+searchMap.get("keyWord")+"'>"+ i +"</a> ");
				}else {
					sb.append("<a class='page-link' style='color:#5D9A71' href='/farm/farmNoticePage.do?currentPage="+ i +"'>"+ i +"</a> ");
				}
				sb.append("</li>");
			}
		}
		
		if(endNavi != pageTotalCount)	
		{
			sb.append("<li class='page-item'>");
			if(searchMap.get("keyWord")!=null)
			{
				sb.append("<a class='page-link' style='color:#5D9A71' href='/farm/farmNoticePage.do?currentPage="+(endNavi+1)+"&type="+searchMap.get("type")+"&keyWord="+searchMap.get("keyWord")+"' aria-label='Next'");
			}else
			{
				sb.append("<a class='page-link' style='color:#5D9A71' href='/farm/farmNoticePage.do?currentPage="+(endNavi+1)+"' aria-label='Next'");
			}
			sb.append("<span aria-hidden='true'>&raquo;</span>");
			sb.append("</a>");
			sb.append("</li>");
			sb.append(" </ul>");
			sb.append("</nav>");
		}
		
			return sb.toString();
	}
	
	//공지사항 총 게시물 개수
	private int noticeListToTalCount(HashMap<String, Object> searchMap) {
		
		return sql.selectOne("farmENT.selectNoticeListTotalCount",searchMap);
		
	}

	//문의사항 게시물 리스트
	public ArrayList<FarmENTQna> selectFarmQnaList(int recordCountPerPage, int currentPage, HashMap<String, Object> searchMap) {
		
		int offset = ((currentPage-1)*recordCountPerPage);
		int limit = recordCountPerPage;
		
		RowBounds rb = new RowBounds(offset,limit);
		
		return new ArrayList<FarmENTQna>(sql.selectList("farmENT.selectQnaList",searchMap,rb));
		
	}

	//문의사항 pageNavi
	public String getQnaListNavi(int recordCountPerPage, int naviCountPerPage, int currentPage, HashMap<String, Object> searchMap) {
		
		
		//총 게시물 개수	
		int recordTotalCount=qnaListTotal(searchMap);
		
		//page Navi 계산
		int pageTotalCount =(int)Math.ceil(recordTotalCount/(double)recordCountPerPage);
		
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
			if(searchMap.get("keyWord")!=null)
			{
				sb.append("<a style='color:#5D9A71' class='page-link' href='/farm/farmQnaPage.do?currentPage="+(startNavi-1)+"&type="+searchMap.get("type")+"&keyWord="+searchMap.get("keyWord")+"' aria-label='Previous'>");
			}else
			{
				sb.append("<a style='color:#5D9A71' class='page-link' href='/farm/farmQnaPage.do?currentPage="+(startNavi-1)+"' aria-label='Previous'>");
			}
			sb.append("<span aria-hidden='true'>&laquo;</span>");
			sb.append("</a>");
			sb.append("</li>");
		}
	
		
		for(int i=startNavi;i<=endNavi;i++)
		{
			
			if(i==currentPage)
			{
				sb.append("<li class='page-item'>");
				if(searchMap.get("keyWord")!=null)
				{
					sb.append("<a class='page-link' style='color:white; background-color:#48BB78' href='/farm/farmQnaPage.do?currentPage="+ i +"&type="+searchMap.get("type")+"&keyWord="+searchMap.get("keyWord")+"' ><B>"+ i +"</B></a> ");
				}else {
					sb.append("<a class='page-link' style='color:white; background-color:#48BB78' href='/farm/farmQnaPage.do?currentPage="+ i +"' ><B>"+ i +"</B></a> ");	
				}
				sb.append("</li>");
				
			}else
			{	sb.append("<li class='page-item'>");
				if(searchMap.get("keyWord")!=null)
				{
					sb.append("<a class='page-link' style='color:#5D9A71' href='/farm/farmQnaPage.do?currentPage="+ i +"&type="+searchMap.get("type")+"&keyWord="+searchMap.get("keyWord")+"'>"+ i +"</a> ");
				}else {
					sb.append("<a class='page-link' style='color:#5D9A71' href='/farm/farmQnaPage.do?currentPage="+ i +"'>"+ i +"</a> ");
				}
				sb.append("</li>");
			}
		}
		
		if(endNavi != pageTotalCount)	
		{
			sb.append("<li class='page-item'>");
			if(searchMap.get("keyWord")!=null)
			{
				sb.append("<a class='page-link' style='color:#5D9A71' href='/farm/farmQnaPage.do?currentPage="+(endNavi+1)+"&type="+searchMap.get("type")+"&keyWord="+searchMap.get("keyWord")+"' aria-label='Next'");
			}else
			{
				sb.append("<a class='page-link' style='color:#5D9A71' href='/farm/farmQnaPage.do?currentPage="+(endNavi+1)+"' aria-label='Next'");
			}
			sb.append("<span aria-hidden='true'>&raquo;</span>");
			sb.append("</a>");
			sb.append("</li>");
			sb.append(" </ul>");
			sb.append("</nav>");
		}
		
			return sb.toString();
		
		
	}

	private int qnaListTotal(HashMap<String, Object> searchMap) {
		
		return sql.selectOne("farmENT.selectQnaListTotalCount",searchMap);
			
	}

	//환불 리스트
	public ArrayList<FarmENTRefund> selectRefundList(int recordCountPerPage, int currentPage,HashMap<String, Object> searchMap) {
		
		int offset = ((currentPage-1)*recordCountPerPage);
		int limit = recordCountPerPage;
		
		RowBounds rb = new RowBounds(offset,limit);
		
		return new ArrayList<FarmENTRefund> (sql.selectList("farmENT.selectRefundList",searchMap, rb));
		
		
	}
	//환불 리스트 페이지 네비
	public String getRefundListNavi(int recordCountPerPage, int naviCountPerPage, int currentPage, HashMap<String, Object> searchMap) {
		
		//환불 게시물 총 개수
		int recordTotalCount=refundListTotal(searchMap);
		
		//page Navi 계산
		int pageTotalCount =(int)Math.ceil(recordTotalCount/(double)recordCountPerPage);
		
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
			
			if(searchMap.get("keyWord")!=null)
			{
				sb.append("<a style='color:#5D9A71' class='page-link' href='/farm/farmRefundList.do?currentPage="+(startNavi-1)+"&type="+searchMap.get("type")+"&keyWord="+searchMap.get("keyWord")+"' aria-label='Previous'>");
			}else
			{
				sb.append("<a style='color:#5D9A71' class='page-link' href='/farm/farmRefundList.do?currentPage="+(startNavi-1)+"' aria-label='Previous'>");
			}
			sb.append("<span aria-hidden='true'>&laquo;</span>");
			sb.append("</a>");
			sb.append("</li>");
		}
	
		
		for(int i=startNavi;i<=endNavi;i++)
		{
			
			if(i==currentPage)
			{
				sb.append("<li class='page-item'>");
				
				if(searchMap.get("keyWord")!=null)
				{
					sb.append("<a class='page-link' style='color:white; background-color:#48BB78' href='/farm/farmRefundList.do?currentPage="+ i +"&type="+searchMap.get("type")+"&keyWord="+searchMap.get("keyWord")+"' ><B>"+ i +"</B></a> ");
				}else {
					sb.append("<a class='page-link' style='color:white; background-color:#48BB78' href='/farm/farmRefundList.do?currentPage="+ i +"' ><B>"+ i +"</B></a> ");	
				}
				sb.append("</li>");
				
			}else
			{	sb.append("<li class='page-item'>");
			
				if(searchMap.get("keyWord")!=null)
				{
					sb.append("<a class='page-link' style='color:#5D9A71' href='/farm/farmRefundList.do?currentPage="+ i +"&type="+searchMap.get("type")+"&keyWord="+searchMap.get("keyWord")+"'>"+ i +"</a> ");
				}else {
					sb.append("<a class='page-link' style='color:#5D9A71' href='/farm/farmRefundList.do?currentPage="+ i +"'>"+ i +"</a> ");
				}
				
				sb.append("</li>");
			}
		}
		
		if(endNavi != pageTotalCount)	
		{
			sb.append("<li class='page-item'>");
			if(searchMap.get("keyWord")!=null)
			{
				sb.append("<a class='page-link' style='color:#5D9A71' href='/farm/farmRefundList.do?currentPage="+(endNavi+1)+"&type="+searchMap.get("type")+"&keyWord="+searchMap.get("keyWord")+"' aria-label='Next'");
			}else
			{
				sb.append("<a class='page-link' style='color:#5D9A71' href='/farm/farmRefundList.do?currentPage="+(endNavi+1)+"' aria-label='Next'");
			}
			sb.append("<span aria-hidden='true'>&raquo;</span>");
			sb.append("</a>");
			sb.append("</li>");
			sb.append(" </ul>");
			sb.append("</nav>");
		}
		
			return sb.toString();
		
		
	}

	private int refundListTotal(HashMap<String, Object> searchMap) {
		
		return	sql.selectOne("farmENT.selectRefundListTotalCount",searchMap);
		
	}

	//환불게시판-주문상세
	public ArrayList<FarmENTOrder> selectOrdertDetailInfo(String orderNo) {
		
		return new ArrayList<FarmENTOrder>(sql.selectList("farmENT.selectOrdertDetailInfo",orderNo));
	}
	
	//환불 승인 및 환불 접수 취소
	public int updateRefund(HashMap<String, Object> dataMap) {
		
		return	sql.insert("farmENT.updateRefund",dataMap);
		
	}

	//대시보드-공지사항
	public ArrayList<Notice> selectNoticeDashBoard() {
		
		RowBounds rb = new RowBounds(0,5);
		
		return new ArrayList<Notice>(sql.selectList("farmENT.selectNoticeDashBoard",null,rb));
		
	}

	//대시보드-문의사항
	public ArrayList<FarmENTQna> selectQnaDashBoard(int farmNo) {
		
		RowBounds rb = new RowBounds(0,5);
		
		return new ArrayList<FarmENTQna>(sql.selectList("farmENT.selectQnaDashBoard",farmNo,rb));
	}

	//대시보드-환불접수
	public ArrayList<FarmENTRefund> selectRefundBoard(int farmNo) {
		
		RowBounds rb = new RowBounds(0,5);
			
		return new ArrayList<FarmENTRefund>(sql.selectList("farmENT.selectRefundBoard",farmNo,rb));
		
	}




	
}
