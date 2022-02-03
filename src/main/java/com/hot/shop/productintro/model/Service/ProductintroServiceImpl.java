package com.hot.shop.productintro.model.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hot.shop.productintro.model.dao.ProductintroDAO;

@Service
public class ProductintroServiceImpl implements ProductintroService{

	@Autowired
	private ProductintroDAO piDAO;
}
