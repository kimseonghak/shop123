package com.hot.shop.productintro.model.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.hot.shop.productintro.model.vo.LocalProductBoard;
import com.hot.shop.productintro.model.vo.LocalProductFile;

public interface ProductintroService {
	
	
	//---------------------------------------------------------------------
	HashMap<String, Object> LocalProductListPage(int currentPage);

	int localPhotoAjax(LocalProductFile localPhoto);

	int localWrite(LocalProductBoard localBoard);

	LocalProductBoard LocalProductView(int localProductNo);

	ArrayList<LocalProductBoard> productintroLocalBtn(String localProductClassify);

}
