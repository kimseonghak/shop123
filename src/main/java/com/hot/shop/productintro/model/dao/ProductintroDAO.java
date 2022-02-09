package com.hot.shop.productintro.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.hot.shop.productintro.model.vo.LocalProductBoard;
import com.hot.shop.productintro.model.vo.LocalProductFile;

@Repository
public class ProductintroDAO {

	@Autowired
	@Qualifier(value="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;


	
	
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
			sb.append("<a style='color:#5D9A71' class='page-link' href='//productintro/LocalProductListPage.do?currentPage="+(startNavi-1)+"' aria-label='Previous'>");
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
	public ArrayList<LocalProductBoard> productintroLocalBtn(String localProductClassify) {
		// TODO Auto-generated method stub
		return new ArrayList<LocalProductBoard>(sqlSession.selectList("lpBoard.productintroLocalBtn", localProductClassify));
	}
	
	
}
