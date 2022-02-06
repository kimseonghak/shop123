package com.hot.shop.common;

import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class FarmAOP {

	@Autowired
	private SHA256Util enc;
	
}
