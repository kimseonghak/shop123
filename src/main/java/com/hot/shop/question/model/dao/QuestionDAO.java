package com.hot.shop.question.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.hot.shop.question.model.vo.QuestionUser;

@Repository
public class QuestionDAO {

	@Autowired
	@Qualifier(value="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	public ArrayList<QuestionUser> selectUserQuestionList() {
		
		return new ArrayList<QuestionUser>(sqlSession.selectList("qUser.selectUserQuestionList"));
	}
}
