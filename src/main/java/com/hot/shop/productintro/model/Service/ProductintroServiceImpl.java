package com.hot.shop.productintro.model.Service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hot.shop.productintro.model.dao.ProductintroDAO;
import com.hot.shop.productintro.model.vo.LocalProductBoard;

@Service
public class ProductintroServiceImpl implements ProductintroService{

	@Autowired
	private ProductintroDAO piDAO;

	
	
	//------------------------------------------------------------------------------
	
	@Override
	public ArrayList<LocalProductBoard> LocalProductListPage() {
		// TODO Auto-generated method stub
		return piDAO.LocalProductListPage();
	}
}
