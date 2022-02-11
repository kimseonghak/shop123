package com.hot.shop.productintro.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.hot.shop.notice.model.vo.Notice;
import com.hot.shop.productintro.model.vo.LocalProductBoard;
import com.hot.shop.productintro.model.vo.LocalProductFile;
import com.hot.shop.productintro.model.vo.SeasonProductBoard;
import com.hot.shop.productintro.model.vo.SeasonProductFile;

import oracle.net.aso.k;

@Repository
public class ProductintroDAO {

	@Autowired
	@Qualifier(value="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	//제철 특산물 리스트
		public ArrayList<LocalProductBoard> SeasonProductListPage(int currentPage, int recordCountPerPage) {
			// TODO Auto-generated method stub
			int offset = ((currentPage-1)*recordCountPerPage);
			int limit = recordCountPerPage;
			
			RowBounds rb = new RowBounds(offset,limit);
			
			return new ArrayList<LocalProductBoard>(sqlSession.selectList("spBoard.SeasonProductListPage",null,rb));
		}
		
		public String SeasonProductListPageNavi(int recordCountPerPage, int currentPage, int naviCountPerPage) {
			// TODO Auto-generated method stub
			int recordTotalCount = SeasonProductTotalCount();
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
						sb.append("<a style='color:#5D9A71' class='page-link' href='/productintro/SeasonProductSearchListPage.do?currentPage="+(startNavi-1)+"' aria-label='Previous'>");
						sb.append("<span aria-hidden='true'>&laquo;</span>");
						sb.append("</a>");
						sb.append("</li>");
					}
					
					for(int i=startNavi;i<=endNavi;i++)
					{
						
						if(i==currentPage)
						{
							sb.append("<li class='page-item'>");
							sb.append("<a class='page-link' style='color:white; background-color:#48BB78' href='/productintro/SeasonProductSearchListPage.do?currentPage="+ i +"' ><B>"+ i +"</B></a> ");
							sb.append("</li>");
							
						}else
						{	sb.append("<li class='page-item'>");
							sb.append("<a class='page-link' style='color:#5D9A71' href='/productintro/SeasonProductSearchListPage.do?currentPage="+ i +"'>"+ i +"</a> ");
							sb.append("</li>");
						}
					}
					
					if(endNavi != pageTotalCount)	
					{
						sb.append("<li class='page-item'>");
						sb.append("<a class='page-link' style='color:#5D9A71' href='/productintro/SeasonProductSearchListPage.do?currentPage="+(endNavi+1)+"' aria-label='Next'");
						sb.append("<span aria-hidden='true'>&raquo;</span>");
						sb.append("</a>");
						sb.append("</li>");
						sb.append(" </ul>");
						sb.append("</nav>");
					}
					
					return sb.toString();
		}
	
		private int SeasonProductTotalCount() {
			// TODO Auto-generated method stub
			return sqlSession.selectOne("spBoard.SeasonProductTotalCount");
		}
	//제철 특산물 리스트 끝
	
	
		//제철 특산물 글 쓰기 공간
	
		//사진 처리
		public int SeasonPhotoAjax(SeasonProductFile seasonPhoto) {
			// TODO Auto-generated method stub
		return sqlSession.insert("spBoard.SeasonPhotoAjax",seasonPhoto);
		}
			
		//실질적인 글쓰기	
		public int SeasonWrite(SeasonProductBoard seasonBoard) {
			// TODO Auto-generated method stub
			return sqlSession.insert("spBoard.SeasonWrite",seasonBoard);
		}		
	//제철 특산물 글 쓰기 공간 끝

		
	//제철 특산물 조회
		public SeasonProductBoard SeasonProductView(int seasonProductNo) {
			// TODO Auto-generated method stub
			return sqlSession.selectOne("spBoard.SeasonProductView", seasonProductNo);
		}
	
	
		//글 수정 공간
		public SeasonProductFile deleteFileCheck(int originalSeasonphotoNo) {
			// TODO Auto-generated method stub
			sqlSession.update("spBoard.deleteFileUpdate",originalSeasonphotoNo);
			return sqlSession.selectOne("spBoard.deleteFileCheck", originalSeasonphotoNo);
		}
		
		public int SeasonProductUpdate(SeasonProductBoard seasonBoard) {
			// TODO Auto-generated method stub
			return sqlSession.update("spBoard.SeasonProductUpdate",seasonBoard) + sqlSession.update("spBoard.updatePhoto",seasonBoard.getSeasonProductPhotoNo());
		}
	//글 수정 공간 끝
		
		
	
	//지역 특산물 버튼 누를시 월별로 나오는 기능(검색기능과 비슷한 로직)
		public ArrayList<LocalProductBoard> SeasonProductListSearchPage(int currentPage, int recordCountPerPage, String seasonProductClassify) {
			// TODO Auto-generated method stub
			int offset = ((currentPage-1)*recordCountPerPage);
			int limit = recordCountPerPage;
			
			RowBounds rb = new RowBounds(offset,limit);
			
			return new ArrayList<LocalProductBoard>(sqlSession.selectList("spBoard.SeasonProductListSearchPage",seasonProductClassify,rb));
		}
		
		
		public String SeasonProductListPagePageNavi(int currentPage, int recordCountPerPage, String seasonProductClassify,
				int naviCountPerPage) {
			// TODO Auto-generated method stub
			int recordTotalCount = SeasonProductListToTalSearchCount(seasonProductClassify);
			
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
				sb.append("<a style='color:#5D9A71' class='page-link' href='/productintro/SeasonProductSearchListPage.do?currentPage="+(startNavi-1)+"&seasonProductClassify="+seasonProductClassify+"' aria-label='Previous'>");
				sb.append("<span aria-hidden='true'>&laquo;</span>");
				sb.append("</a>");
				sb.append("</li>");
			}
			
			for(int i=startNavi;i<=endNavi;i++)
			{
				
				if(i==currentPage)
				{
					sb.append("<li class='page-item'>");
					sb.append("<a class='page-link' style='color:white; background-color:#48BB78' href='/productintro/SeasonProductSearchListPage.do?currentPage="+ i +"&seasonProductClassify="+seasonProductClassify+"' ><B>"+ i +"</B></a> ");
					sb.append("</li>");
					
				}else
				{	sb.append("<li class='page-item'>");
					sb.append("<a class='page-link' style='color:#5D9A71' href='/productintro/SeasonProductSearchListPage.do?currentPage="+ i +"&seasonProductClassify="+seasonProductClassify+"'>"+ i +"</a> ");
					sb.append("</li>");
				}
			}
			
			if(endNavi != pageTotalCount)	
			{
				sb.append("<li class='page-item'>");
				sb.append("<a class='page-link' style='color:#5D9A71' href='/productintro/SeasonProductSearchListPage.do?currentPage="+(endNavi+1)+"&seasonProductClassify="+seasonProductClassify+"' aria-label='Next'");
				sb.append("<span aria-hidden='true'>&raquo;</span>");
				sb.append("</a>");
				sb.append("</li>");
				sb.append(" </ul>");
				sb.append("</nav>");
			}
			
			return sb.toString();
		}
		
		private int SeasonProductListToTalSearchCount(String seasonProductClassify) {
			// TODO Auto-generated method stub
			return sqlSession.selectOne("spBoard.SeasonProductListToTalSearchCount", seasonProductClassify);
		}
	//지역 특산물 버튼 누를시 월별로 나오는 기능(검색기능과 비슷한 로직) 끝
		
	
		
		
		public int seasonDelete(int seasonProductNo) {
			// TODO Auto-generated method stub
			return sqlSession.update("spBoard.seasonDelete",seasonProductNo);
		}	
		
	//------------------------------------
	




	public ArrayList<LocalProductBoard> LocalProductListPage(int currentPage, int recordCountPerPage) {
		// TODO Auto-generated method stub
		int offset = ((currentPage-1)*recordCountPerPage);
		int limit = recordCountPerPage;
		
		RowBounds rb = new RowBounds(offset,limit);
		
		return new ArrayList<LocalProductBoard>(sqlSession.selectList("lpBoard.LocalProductListPage",null,rb));
	}
	//페이징 처리
	public String LocalProductListPageNavi(int recordCountPerPage, int currentPage, int naviCountPerPage) {
		// TODO Auto-generated method stub
		int recordTotalCount = LocalProductTotalCount();
		
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
			sb.append("<a style='color:#5D9A71' class='page-link' href='/productintro/LocalProductListPage.do?currentPage="+(startNavi-1)+"' aria-label='Previous'>");
			sb.append("<span aria-hidden='true'>&laquo;</span>");
			sb.append("</a>");
			sb.append("</li>");
		}
		
		for(int i=startNavi;i<=endNavi;i++)
		{
			
			if(i==currentPage)
			{
				sb.append("<li class='page-item'>");
				sb.append("<a class='page-link' style='color:white; background-color:#48BB78' href='/productintro/LocalProductListPage.do?currentPage="+ i +"' ><B>"+ i +"</B></a> ");
				sb.append("</li>");
				
			}else
			{	sb.append("<li class='page-item'>");
				sb.append("<a class='page-link' style='color:#5D9A71' href='/productintro/LocalProductListPage.do?currentPage="+ i +"'>"+ i +"</a> ");
				sb.append("</li>");
			}
		}
		
		if(endNavi != pageTotalCount)	
		{
			sb.append("<li class='page-item'>");
			sb.append("<a class='page-link' style='color:#5D9A71' href='/productintro/LocalProductListPage.do?currentPage="+(endNavi+1)+"' aria-label='Next'");
			sb.append("<span aria-hidden='true'>&raquo;</span>");
			sb.append("</a>");
			sb.append("</li>");
			sb.append(" </ul>");
			sb.append("</nav>");
		}
		
		return sb.toString();
	}
	
	//글 숫자
	private int LocalProductTotalCount() {
		return sqlSession.selectOne("lpBoard.LocalProductTotalCount");
	}
	//페이징 처리 끝


	//지역 특산물 사진 올리기
	public int localPhotoAjax(LocalProductFile localPhoto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("lpBoard.localPhotoAjax",localPhoto);
	}


	//지역 특산물 글쓰기
	public int localWrite(LocalProductBoard localBoard) {
		// TODO Auto-generated method stub
		return sqlSession.insert("lpBoard.localWrite",localBoard);
	}


	//지역특산물 글 조회
	public LocalProductBoard LocalProductView(int localProductNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("lpBoard.LocalProductView", localProductNo);
	}
	
//	public ArrayList<LocalProductBoard> productintroLocalBtn(String localProductClassify) {
//		// TODO Auto-generated method stub
//		return new ArrayList<LocalProductBoard>(sqlSession.selectList("lpBoard.productintroLocalBtn", localProductClassify));
//	}
	
	
	//지역특산물 조회2
	public ArrayList<LocalProductBoard> productintroLocalBtn(int currentPage, int recordCountPerPage,
			String localProductClassify) {
		// TODO Auto-generated method stub
		int offset = ((currentPage-1)*recordCountPerPage);
		int limit = recordCountPerPage;
		
		RowBounds rb = new RowBounds(offset,limit);
		
		return new ArrayList<LocalProductBoard>(sqlSession.selectList("lpBoard.productintroLocalBtn",localProductClassify,rb));
	}
	
	//페이지 네비게이션 바
	public String productintroLocalPageNavi(int currentPage, int recordCountPerPage,
			String localProductClassify, int naviCountPerPage) {
		// TODO Auto-generated method stub
		
		// 게시물 개수
		int recordTotalCount = localProductListToTalSearchCount(localProductClassify);
		
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
					sb.append("<a style='color:#5D9A71' class='page-link' href='/productintro/productintroLocalBtn.do?currentPage="+(startNavi-1)+"&localProductClassify="+localProductClassify+"' aria-label='Previous'>");
					sb.append("<span aria-hidden='true'>&laquo;</span>");
					sb.append("</a>");
					sb.append("</li>");
				}
				
				for(int i=startNavi;i<=endNavi;i++)
				{
					
					if(i==currentPage)
					{
						sb.append("<li class='page-item'>");
						sb.append("<a class='page-link' style='color:white; background-color:#48BB78' href='/productintro/productintroLocalBtn.do?currentPage="+ i +"&localProductClassify="+localProductClassify+"' ><B>"+ i +"</B></a> ");
						sb.append("</li>");
						
					}else
					{	sb.append("<li class='page-item'>");
						sb.append("<a class='page-link' style='color:#5D9A71' href='/productintro/productintroLocalBtn.do?currentPage="+ i +"&localProductClassify="+localProductClassify+"'>"+ i +"</a> ");
						sb.append("</li>");
					}
				}
				
				if(endNavi != pageTotalCount)	
				{
					sb.append("<li class='page-item'>");
					sb.append("<a class='page-link' style='color:#5D9A71' href='/productintro/productintroLocalBtn.do?currentPage="+(endNavi+1)+"&localProductClassify="+localProductClassify+"' aria-label='Next'");
					sb.append("<span aria-hidden='true'>&raquo;</span>");
					sb.append("</a>");
					sb.append("</li>");
					sb.append(" </ul>");
					sb.append("</nav>");
				}
				
				return sb.toString();
	}
	
	//검색된 수
	private int localProductListToTalSearchCount(String localProductClassify) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("lpBoard.localProductListToTalSearchCount", localProductClassify);
	}
	
	//지역특산물 조회2 끝
	
	//글 수정 공간
	public int localProductUpdate(LocalProductBoard localBoard) {
		// TODO Auto-generated method stub
		return sqlSession.update("lpBoard.localProductUpdate",localBoard) + sqlSession.update("lpBoard.updatePhoto",localBoard.getLocalProductPhotoNo());
	}
	
	public LocalProductFile localdeleteFileCheck(int originalLocalphotoNo) {
		// TODO Auto-generated method stub
		sqlSession.update("lpBoard.deleteLocalFileUpdate",originalLocalphotoNo);
		return sqlSession.selectOne("lpBoard.localdeleteFileCheck", originalLocalphotoNo);
	}
	//글 수정 공간 끝

	public int localDelete(int localProductNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("lpBoard.localDelete",localProductNo);
	}

	

	

	
}
