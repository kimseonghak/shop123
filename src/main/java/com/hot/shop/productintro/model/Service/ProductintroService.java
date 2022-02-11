package com.hot.shop.productintro.model.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.hot.shop.productintro.model.vo.LocalProductBoard;
import com.hot.shop.productintro.model.vo.LocalProductFile;
import com.hot.shop.productintro.model.vo.SeasonProductBoard;
import com.hot.shop.productintro.model.vo.SeasonProductFile;

public interface ProductintroService {
	
	HashMap<String, Object> SeasonProductListPage(int currentPage);
	
	int SeasonPhotoAjax(SeasonProductFile seasonPhoto);

	int SeasonWrite(SeasonProductBoard seasonBoard);
	
	SeasonProductBoard SeasonProductView(int seasonProductNo);

	SeasonProductFile deleteFileCheck(int originalSeasonphotoNo);

	int SeasonProductUpdate(SeasonProductBoard seasonBoard);

	HashMap<String, Object> SeasonProductListPage(int currentPage, String seasonProductClassify);

	int seasonDelete(int seasonProductNo);
	
	
	//---------------------------------------------------------------------
	
	
	HashMap<String, Object> LocalProductListPage(int currentPage);

	int localPhotoAjax(LocalProductFile localPhoto);

	int localWrite(LocalProductBoard localBoard);

	LocalProductBoard LocalProductView(int localProductNo);

//	ArrayList<LocalProductBoard> productintroLocalBtn(String localProductClassify);

	HashMap<String, Object> productintroLocalBtn(int currentPage,String localProductClassify);

	LocalProductFile localdeleteFileCheck(int originalLocalphotoNo);

	int localProductUpdate(LocalProductBoard localBoard);

	int localDelete(int localProductNo);














}
