package com.hot.shop.farm.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
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
import com.hot.shop.member.model.vo.Member;

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
		
		int result = fService.insertFarm(farm);
		
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
	
	//회원가입 시 이메일 인증
	//아이디 찾기 시 이메일 인증
	@RequestMapping(value="/farm/farmMailCheck.do", method=RequestMethod.GET)
    @ResponseBody
    public String mailCheckGET(String email) throws Exception{
        
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		
		String setForm = "123sanghoi@naver.com";
        String toMail = email;
        String title = "123상회 농가 인증 이메일 입니다.";
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
	
	//아이디찾기
	@RequestMapping(value="/farm/farmFindId.do", method = RequestMethod.POST)
	public ModelAndView memberFindId(Farm farm,
							ModelAndView mav) {
		
		List<Farm> result = fService.findIdFarm(farm);
		
		if(result.size() > 0) {
			mav.addObject("farmResult", result);
			mav.setViewName("member/findIdSuccess");
			
		} else {
			mav.addObject("msg", "입력하신 이메일과 일치하는 아이디가 존재하지 않습니다.");
			mav.addObject("location", "/member/memberFindId.do");
			mav.setViewName("commons/msg");
		}
		return mav;
	}
	
	//비밀번호 찾기 시 입력한 아이디와 이메일이 일치하는지 확인
	@RequestMapping(value="/farm/farmEmailCheck.do", method = RequestMethod.GET)
	public void memberEmailCheck(Farm farm,
			HttpServletResponse response) throws IOException {
		
		Farm result = fService.selectEmailCheck(farm);
		response.getWriter().print(result.getFarmEmail());
	}
	
	
	//비밀번호 찾기(이메일 재발급)
	@RequestMapping(value="/farm/farmFindPwd.do", method = RequestMethod.POST)
	public ModelAndView memberFindPwd(Farm farm,
							ModelAndView mav) {
		
		int result = fService.findPwdFarm(farm);
		if(result > 0) {
			mav.addObject("result", result);
			
			String farmId = farm.getFarmId();
			String farmEmail = farm.getFarmEmail();
			
			//랜덤값 생성
			char pwCollection[] = new char[] {
                    '1','2','3','4','5','6','7','8','9','0',
                    'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
                    'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
                    '!','@','#','$','%','^','&','*','(',')'};
			
			String ranPw = "";

			for (int i = 0; i < 10; i++) {
				int selectRandomPw = (int)(Math.random()*(pwCollection.length));
				ranPw += pwCollection[selectRandomPw];
			};
			
			//이메일 발송
			String setForm = "123sanghoi@naver.com";
	        String toMail = farmEmail;
	        String title = "123상회 농가 임시비밀번호 발송 이메일 입니다.";
	        String content = 
	                "홈페이지를 방문해주셔서 감사합니다." +
	                "<br>" + 
	                farmId + "님의 임시 비밀번호는 " + ranPw + "입니다." + 
	                "<br>" + 
	                "로그인 후 비밀번호를 변경하여 주세요.";
	        
	        try {
	            
	            MimeMessage message = mailSender.createMimeMessage();
	            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
	            helper.setFrom(setForm);
	            helper.setTo(toMail);
	            helper.setSubject(title);
	            helper.setText(content,true);
	            mailSender.send(message);
	            
	        } catch(Exception e) {
	            e.printStackTrace();
	        }
	        
	        String farmNewPwd = ranPw;
	        
	        HashMap<String, Object> map = new HashMap<String, Object>();
	        map.put("farmId", farmId);
	        map.put("farmEmail", farmEmail);
	        map.put("farmNewPwd", farmNewPwd);
			
			int farmRandomPwdResult = fService.farmRandomPwd(map);
			
			if(farmRandomPwdResult>0) {
				mav.setViewName("member/findPwdSuccess");
			} else {
				mav.addObject("msg", "비밀번호 변경을 실패했습니다.\n지속적인 문제 발생시 관리자에게 문의해주세요.");
				mav.addObject("location", "/member/memberFindPwd.do");
				mav.setViewName("commons/msg");
			}
			
		} else {
			mav.addObject("msg", "입력하신 정보와 일치하는 아이디가 존재하지 않습니다.");
			mav.addObject("location", "/member/memberFindPwd.do");
			mav.setViewName("commons/msg");
		}
		return mav;
	}
}
