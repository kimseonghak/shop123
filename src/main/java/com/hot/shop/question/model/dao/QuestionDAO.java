package com.hot.shop.question.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.hot.shop.admin.model.vo.BID;
import com.hot.shop.auction.model.vo.Purchaselist;
import com.hot.shop.member.model.vo.Member;
import com.hot.shop.question.model.vo.QuestionFarm;
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
		Purchaselist pur = sqlSession.selectOne("qUser.selectPurchaselist",qUser);
		return sqlSession.insert("qUser.insertUserWrite", qUser) + sqlSession.update("qUser.updateQPhote",qUser.getQuestionphotoNo()) + sqlSession.insert("qUser.refund",pur);
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

	public ArrayList<Purchaselist> getBuyList(int currentPage, Member member, int recordCountPerPage) {
		int start = currentPage*recordCountPerPage-(recordCountPerPage-1);
		int end = currentPage*recordCountPerPage;
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end",end);
		map.put("userNo", member.getUserNo());
		return new ArrayList<Purchaselist>(sqlSession.selectList("qUser.buyCheckList",map));
	}

	public String getBuyPageNavi(int recordCountPerPage, int currentPage, int naviCountPerPage, Member member) {
		int recordTotalCount = buyTotalCount(member);
		int pageTotalCount = (int)Math.ceil(recordTotalCount/(double)recordCountPerPage);
		
		int startNavi = ((currentPage-1)/naviCountPerPage) *naviCountPerPage+1;
		int endNavi = startNavi+naviCountPerPage-1;
		
		if(endNavi>pageTotalCount) {
			endNavi=pageTotalCount;
		}
		
		StringBuilder sb = new StringBuilder();
		sb.append("<a href='/question/buyListCheck.do?currentPage=1' class='naviArrow'>&lt;&lt;</a>");
		sb.append("<a href='/question/buyListCheck.do?currentPage="+(currentPage-10)+"' class='naviArrow' id='prev'>&lt;</a>");
		for(int i= startNavi; i<=endNavi; i++) {
			if(i==currentPage) {
				sb.append("<a href='/question/buyListCheck.do?currentPage="+i+"' id='currentNavi'>"+i+"</a>");
			}else {
				sb.append("<a href='/question/buyListCheck.do?currentPage="+i+"' class='otherNavi'>"+i+"</a>");
			}
		}
		if((currentPage+10)<pageTotalCount) {
			sb.append("<a href='/question/buyListCheck.do?currentPage="+pageTotalCount+"' class='naviArrow' id='next'>&gt;</a>");
		}else {
			sb.append("<a href='/question/buyListCheck.do?currentPage="+(currentPage+10)+"' class='naviArrow' id='next'>&gt;</a>");
		}
		
		sb.append("<a href='/question/buyListCheck.do?currentPage="+pageTotalCount+"' class='naviArrow'>&gt;&gt;</a>");
		return sb.toString();
	}

	private int buyTotalCount(Member member) {
		return sqlSession.selectOne("qUser.buyListTotalCount",member.getUserNo());
	}


	//-----------------------------------------농가 문의-----------------------------------------
	public ArrayList<QuestionFarm> QuestionFarmPage() {
		// TODO Auto-generated method stub
		return null;
	}
	
	

}
