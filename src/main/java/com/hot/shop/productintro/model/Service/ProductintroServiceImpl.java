package com.hot.shop.productintro.model.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hot.shop.productintro.model.dao.ProductintroDAO;
import com.hot.shop.productintro.model.vo.LocalProductBoard;
import com.hot.shop.productintro.model.vo.LocalProductFile;
import com.hot.shop.productintro.model.vo.SeasonProductBoard;
import com.hot.shop.productintro.model.vo.SeasonProductFile;

@Service
public class ProductintroServiceImpl implements ProductintroService{

	@Autowired
	private ProductintroDAO piDAO;
	
	//제철 특산물 리스트
	@Override
	public HashMap<String, Object> SeasonProductListPage(int currentPage) {
		// TODO Auto-generated method stub
		//페이지당 보여줄 글
		int recordCountPerPage = 3;
				
		//제철 리스트
		ArrayList<LocalProductBoard> list = piDAO.SeasonProductListPage(currentPage,recordCountPerPage);
		
		//페이지 네비
		int naviCountPerPage=5;
		String pageNavi = piDAO.SeasonProductListPageNavi(recordCountPerPage,currentPage,naviCountPerPage);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("pageNavi", pageNavi);
		
		return map;
	}

	//제철 특산물 글쓰기 공간
		//이미지 처리
		@Override
		public int SeasonPhotoAjax(SeasonProductFile seasonPhoto) {
			// TODO Auto-generated method stub
			return piDAO.SeasonPhotoAjax(seasonPhoto);
		}
		//실질적 글쓰기
		@Override
		public int SeasonWrite(SeasonProductBoard seasonBoard) {
			// TODO Auto-generated method stub
			return piDAO.SeasonWrite(seasonBoard);
		}
	//제철 특산물 글쓰기 공간 끝
	
		
	//제철 특산물 조회
		@Override
		public SeasonProductBoard SeasonProductView(int seasonProductNo) {
			// TODO Auto-generated method stub
			return piDAO.SeasonProductView(seasonProductNo);
		}
	
	//제철특산물 글수정 공간
		@Override
		public SeasonProductFile deleteFileCheck(int originalSeasonphotoNo) {
			// TODO Auto-generated method stub
			return piDAO.deleteFileCheck(originalSeasonphotoNo);
		}
		
		@Override
		public int SeasonProductUpdate(SeasonProductBoard seasonBoard) {
			// TODO Auto-generated method stub
			return piDAO.SeasonProductUpdate(seasonBoard);
		}
		
	//제철특산물 글수정 공간 끝
		
		
		//검색기능 처리
		@Override
		public HashMap<String, Object> SeasonProductListPage(int currentPage, String seasonProductClassify) {
			// TODO Auto-generated method stub
			int recordCountPerPage = 3;
			
			//지역 특산물 리스트
			ArrayList<LocalProductBoard> list = piDAO.SeasonProductListSearchPage(currentPage,recordCountPerPage,seasonProductClassify);
			
			//페이지 네비게이션
			int naviCountPerPage=5;
			String pageNavi = piDAO.SeasonProductListPagePageNavi(currentPage,recordCountPerPage,seasonProductClassify,naviCountPerPage);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("list", list);
			map.put("pageNavi", pageNavi);
			return map;
		}
		//검색기능 처리 완료
		
		
		
		@Override
		public int seasonDelete(int seasonProductNo) {
			// TODO Auto-generated method stub
			return piDAO.seasonDelete(seasonProductNo);
		}
	
	//------------------------------------------------------------------------------
	
	//지역특산물 리스트
	@Override
	public HashMap<String, Object> LocalProductListPage(int currentPage) {
		// TODO Auto-generated method stub
		
		//페이지당 보여줄 글
		int recordCountPerPage = 3;
		
		//지역 리스트
		ArrayList<LocalProductBoard> list = piDAO.LocalProductListPage(currentPage,recordCountPerPage);
		
		//페이지 네비
		int naviCountPerPage=5;
		String pageNavi = piDAO.LocalProductListPageNavi(recordCountPerPage,currentPage,naviCountPerPage);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", list);
		map.put("pageNavi", pageNavi);
		
		return map;
	}


	//지역특산물 파일 올리기
	@Override
	public int localPhotoAjax(LocalProductFile localPhoto) {
		// TODO Auto-generated method stub
		return piDAO.localPhotoAjax(localPhoto);
	}

	//지역특산물 글쓰기
	@Override
	public int localWrite(LocalProductBoard localBoard) {
		// TODO Auto-generated method stub
		return piDAO.localWrite(localBoard);
	}


	
	//지역특산물 조회
	@Override
	public LocalProductBoard LocalProductView(int localProductNo) {
		// TODO Auto-generated method stub
		return piDAO.LocalProductView(localProductNo);
	}


	@Override
	public HashMap<String, Object> productintroLocalBtn(int currentPage,
			String localProductClassify) {
		// TODO Auto-generated method stub
		int recordCountPerPage = 3;
		
		//지역 특산물 리스트
		ArrayList<LocalProductBoard> list = piDAO.productintroLocalBtn(currentPage,recordCountPerPage,localProductClassify);
		
		//페이지 네비게이션
		int naviCountPerPage=5;
		String pageNavi = piDAO.productintroLocalPageNavi(currentPage,recordCountPerPage,localProductClassify,naviCountPerPage);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("pageNavi", pageNavi);
		return map;
	}


	
//글 수정 공간
	@Override
	public int localProductUpdate(LocalProductBoard localBoard) {
		// TODO Auto-generated method stub
		return piDAO.localProductUpdate(localBoard);
	}

	@Override
	public LocalProductFile localdeleteFileCheck(int originalLocalphotoNo) {
		// TODO Auto-generated method stub
		return piDAO.localdeleteFileCheck(originalLocalphotoNo);
	}
//글 수정 공간 끝

	
	
	@Override
	public int localDelete(int localProductNo) {
		// TODO Auto-generated method stub
		return piDAO.localDelete(localProductNo);
	}

	


	

	


	


	

//	@Override
//	public ArrayList<LocalProductBoard> productintroLocalBtn(String localProductClassify) {
//		// TODO Auto-generated method stub
//		return piDAO.productintroLocalBtn(localProductClassify);
//	}

}
