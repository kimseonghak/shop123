package com.hot.shop.farm.controller;

import java.io.IOException;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.hot.shop.farm.model.service.FarmService;
import com.hot.shop.farm.model.vo.Farm;

@Controller
public class FarmController {
	
	@Autowired
	private FarmService fService;
	
	@Autowired
	private JavaMailSender mailSender;

	//회원가입 페이지로의 접근
	@RequestMapping(value="/farm/farmJoinPage.do")
	public String farmJoinPage() {
		return "farm/farmJoin";
	}

	//로그인
	@RequestMapping(value="/farm/farmLogin.do", method=RequestMethod.POST)
	public ModelAndView memberLogin(HttpServletRequest request, 
			Farm farm,
			ModelAndView mav) {
		
		Farm f = fService.selectLoginFarm(farm);
		
		if(f!=null) {
			HttpSession session = request.getSession();
			session.setAttribute("farm", f);
			mav.addObject("location", "/");
		} else {
			mav.addObject("msg", "로그인 실패. 아이디와 비밀번호를 확인해주세요.");
			mav.addObject("location", "/");
		}
		mav.setViewName("commons/msg");
		return mav;
	}
		
	//로그아웃
	@RequestMapping(value="/farm/farmLogout.do", method=RequestMethod.GET)
	public String logout(HttpSession session,
			@SessionAttribute Farm farm) {
			
			session.invalidate();
			
			return "redirect:/";
	}
	
	//회원가입시 아이디 중복체크
	@RequestMapping(value="/farm/farmIdCheck.do", method = RequestMethod.GET)
	public void memberIdCheck(@RequestParam String farmId,
			HttpServletResponse response) throws IOException {
		
		int result = fService.selectIdCheck(farmId);
		response.getWriter().print(result);
	}
	
	//회원가입
	@RequestMapping(value="/farm/farmJoin.do", method = RequestMethod.POST)
	public ModelAndView memberJoinus(Farm farm,
							ModelAndView mav) {
		
		int result = fService.insertMember(farm);
		
		if(result>0) {
			mav.addObject("msg", "회원가입을 성공하였습니다.");
			mav.addObject("location", "/");
		} else {
			mav.addObject("msg", "회원가입에 실패했습니다. 입력하신 정보를 다시 확인해주세요.");
			mav.addObject("location", "/farm/farmJoin.do");
		}
		mav.setViewName("commons/msg");
		return mav;
	}
	
	//이메일 인증
	@RequestMapping(value="/farm/farmMailCheck.do", method=RequestMethod.GET)
    @ResponseBody
    public String mailCheckGET(String email) throws Exception{
        
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		
		String setForm = "skytjd10242@naver.com";
        String toMail = email;
        String title = "123상회 회원가입 인증 이메일 입니다.";
        String content = 
                "홈페이지를 방문해주셔서 감사합니다." +
                "<br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        
        try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setForm);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        String num = Integer.toString(checkNum);
        
        return num;
    }
}
