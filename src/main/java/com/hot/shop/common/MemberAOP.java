package com.hot.shop.common;

import java.util.HashMap;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.hot.shop.member.model.vo.Member;

@Aspect
@Component
public class MemberAOP {

	@Autowired
	private SHA256Util enc;
	
	//user 회원가입시 암호화처리
	@Pointcut("execution(* com.hot.shop.member.model.service.MemberServiceImpl.insertMember(..))")
	public void insertMemberPointCut() {}
	
	@Before("insertMemberPointCut()")
	public void insertMemberPasswordEncryption(JoinPoint jp) throws Exception {
		
		Member member = (Member)jp.getArgs()[0];
		
		String userPwd = member.getUserPwd();
		String userId = member.getUserId();
		
		String encryptPwd = enc.encryptionData(userPwd, userId);
		
		member.setUserPwd(encryptPwd);
		
	}

	//user 로그인 시 작성한 비밀번호 암호화 처리
	@Pointcut("execution(* com.hot.shop.member.model.service.MemberServiceImpl.selectLoginMember(..))")
	public void selectLoginPointCut() {}
	
	@Before("selectLoginPointCut()")
	public void loginPasswordEncrypt(JoinPoint jp) throws Exception {
		
		Member member = (Member)jp.getArgs()[0];
		
		String userId = member.getUserId();
		String userPwd = member.getUserPwd();
		
		String encryData = enc.encryptionData(userPwd, userId);
		
		member.setUserPwd(encryData);
		
	}
	
	//user 비밀번호 찾기 후 랜덤 비밀번호 변경 암호화 처리
	@Pointcut("execution(* com.hot.shop.member.model.service.MemberServiceImpl.userRandomPwd(..))")
	public void userRandomPwdPointCut() {}
	
	@Before("userRandomPwdPointCut()")
	public void userRandomPwdEncrypt(JoinPoint jp) throws Exception {
		
		HashMap<String, Object> map = (HashMap<String, Object>)jp.getArgs()[0];
		
		String userId = map.get("userId").toString();
		String userNewPwd = map.get("userNewPwd").toString();
		
		String data = enc.encryptionData(userNewPwd, userId);
		map.put("userNewPwd", data);
	}
	
	//user 회원탈퇴시 입력 비밀번호 암호화 처리
	@Pointcut("execution(* com.hot.shop.mypage.model.service.MemberMypageServiceImpl.updateWithdraw(..))")
	public void updateWithdrawPointCut() {}
	
	@Before("updateWithdrawPointCut()")
	public void updateWithdrawEncrypt(JoinPoint jp) throws Exception {
		
		HashMap<String, Object> map = (HashMap<String, Object>)jp.getArgs()[0];
		
		String userId = map.get("userId").toString();
		String userPwd = map.get("userPwd").toString();
		
		String data = enc.encryptionData(userPwd, userId);
		map.put("userPwd", data);
	}
	
	//user 비밀번호 변경시 입력 비밀번호 암호화 처리
	@Pointcut("execution(* com.hot.shop.mypage.model.service.MemberMypageServiceImpl.updatePassword(..))")
	public void updateChangePwdPointCut() {}
	
	@Before("updateChangePwdPointCut()")
	public void updateChangePwdEncrypt(JoinPoint jp) throws Exception {
		
		HashMap<String, Object> map = (HashMap<String, Object>)jp.getArgs()[0];
		
		String userId = map.get("userId").toString();
		String userPwd = map.get("userPwd").toString();
		String userNewPwd = map.get("userNewPwd").toString();
		
		String data = enc.encryptionData(userNewPwd, userId);
		map.put("userNewPwd", data);
		
		data = enc.encryptionData(userPwd, userId);
		map.put("userPwd", data);
	}
	
}
