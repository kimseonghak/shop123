package com.hot.shop.question.model.service;


import java.util.ArrayList;
import java.util.HashMap;

import com.hot.shop.member.model.vo.Member;
import com.hot.shop.question.model.vo.QuestionAnswer;
import com.hot.shop.question.model.vo.QuestionFarm;
import com.hot.shop.question.model.vo.QuestionPhoto;
import com.hot.shop.question.model.vo.QuestionUser;

public interface QuestionService {

	HashMap<String, Object> selectUserQuestionList(HashMap<String, Object> map);//1:1문의 리스트(유저)
	
	int insertUserWrite(QuestionUser qUser);//1:1 문의 글쓰기(유저 실질적인 백단)

	int insertWriteFile(QuestionPhoto qp);

	HashMap<String, Object> questionView(int questionUserNo);

	int questionUpdate(QuestionUser quser);

	HashMap<String, Object> buyListCheck(int currentPage, Member member);




	
	//-----------------------------------------농가 문의-----------------------------------------
	ArrayList<QuestionFarm> QuestionFarmPage();

	int questionUserDelete(int questionUserNo,String questionUserCode);

	boolean questionAnswer(QuestionAnswer qAnswer);
	
	
	
}
