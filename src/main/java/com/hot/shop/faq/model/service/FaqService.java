package com.hot.shop.faq.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.hot.shop.faq.model.vo.FAQ;

public interface FaqService {

	ArrayList<FAQ> selectFAQList();

	int deleteFaqBoard(int boardNo);

	int insertfaqBoard(HashMap<String, String> dataMap);

	ArrayList<FAQ> selectFaqOneBoard(int boardNo);

	int updateFaqBoard(HashMap<String, Object> dataMap);

}
