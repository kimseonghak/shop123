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

@Service
public class ProductintroServiceImpl implements ProductintroService{

	@Autowired
	private ProductintroDAO piDAO;

	
	
	//------------------------------------------------------------------------------
	
	//지역특산물 리스트
	@Override
	public HashMap<String, Object> LocalProductListPage(int currentPage) {
		// TODO Auto-generated method stub
		
		//페이지당 보여줄 글
		int recordCountPerPage = 4;
		
		//공지사항 리스트
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
	public ArrayList<LocalProductBoard> productintroLocalBtn(String localProductClassify) {
		// TODO Auto-generated method stub
		return piDAO.productintroLocalBtn(localProductClassify);
	}

}
