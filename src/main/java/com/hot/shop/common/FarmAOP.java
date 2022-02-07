package com.hot.shop.common;

import java.util.HashMap;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.hot.shop.farm.model.vo.Farm;


@Aspect
@Component
public class FarmAOP {

	@Autowired
	private SHA256Util enc;

	
	//farm 회원가입시 암호화 처리
	@Pointcut("execution(* com.hot.shop.farm.model.service.FarmServiceImpl.insertFarm(..))")
	public void insertFarmPointCut() {}
	
	@Before("insertFarmPointCut()")
	public void insertFarmPasswordEncryption(JoinPoint jp) throws Exception {
		
		Farm farm = (Farm)jp.getArgs()[0];
		
		String farmPwd = farm.getFarmPwd();
		String farmId = farm.getFarmId();
		
		String encryptPwd = enc.encryptionData(farmPwd, farmId);
		
		farm.setFarmPwd(encryptPwd);
		
	}

	//farm 로그인 시 작성한 비밀번호 암호화 처리
	@Pointcut("execution(* com.hot.shop.farm.model.service.FarmServiceImpl.selectLoginFarm(..))")
	public void selectLoginPointCut() {}
	
	@Before("selectLoginPointCut()")
	public void loginPasswordEncrypt(JoinPoint jp) throws Exception {
		
		Farm farm = (Farm)jp.getArgs()[0];
		
		String farmId = farm.getFarmId();
		String farmPwd = farm.getFarmPwd();
		
		String encryData = enc.encryptionData(farmPwd, farmId);
		
		farm.setFarmPwd(encryData);
		
	}
	
	//farm 비밀번호 찾기 후 랜덤 비밀번호 변경 암호화 처리
	@Pointcut("execution(* com.hot.shop.farm.model.service.FarmServiceImpl.farmRandomPwd(..))")
	public void userRandomPwdPointCut() {}
	
	@Before("userRandomPwdPointCut()")
	public void userRandomPwdEncrypt(JoinPoint jp) throws Exception {
		
		HashMap<String, Object> map = (HashMap<String, Object>)jp.getArgs()[0];
		
		String farmId = map.get("farmId").toString();
		String farmNewPwd = map.get("farmNewPwd").toString();
		
		String data = enc.encryptionData(farmNewPwd, farmId);
		map.put("farmNewPwd", data);
	}
}
