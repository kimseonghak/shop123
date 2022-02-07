package com.hot.shop.question.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.hot.shop.admin.model.vo.BID;
import com.hot.shop.member.model.vo.Member;
import com.hot.shop.question.model.vo.QuestionPhoto;
import com.hot.shop.question.model.vo.QuestionUser;

@Repository
public class QuestionDAO {

	@Autowired
	@Qualifier(value="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	//1:1문의 리스트(유저)
	public ArrayList<QuestionUser> selectUserQuestionList() {
		return new ArrayList<QuestionUser>(sqlSession.selectList("qUser.selectUserQuestionList"));
	}

	//1:1문의 글쓰기(유저 실질적인 백단)
	public int insertUserWrite(QuestionUser qUser) {
		return sqlSession.insert("qUser.insertUserWrite", qUser) + sqlSession.update("qUser.updateQPhote",qUser.getQuestionphotoNo());
	}

	//1:1문의 사진 넣기
	public int insertWriteFile(QuestionPhoto qp) {
		return sqlSession.insert("qUser.insertWriteFile", qp);
	}

	//1:1문의 조회(사용자)
	public QuestionUser questionView(int questionUserNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("qUser.questionView", questionUserNo);
	}

	//글 수정
	public int questionUpdate(QuestionUser quser) {
		// TODO Auto-generated method stub
		return sqlSession.update("qUser.questionUpdate", quser) + sqlSession.update("qUser.questionPhotoUpdate", quser.getQuestionphotoNo());
	}

	public ArrayList<Member> getBuyList(int currentPage, Member member, int recordCountPerPage) {
		int start = currentPage*recordCountPerPage-(recordCountPerPage-1);
		int end = currentPage*recordCountPerPage;
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end",end);
		map.put("userNo", member.getUserNo());
		return new ArrayList<Member>(sqlSession.selectList("qUser.buyCheckList",map));
	}

}
