package com.hot.shop.member.controller;

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

import com.hot.shop.member.model.service.MemberService;
import com.hot.shop.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	//로그인 페이지로의 접근
	@RequestMapping(value="/member/memberLoginPage.do", method=RequestMethod.GET)
	public String memberLoginPage() {
		return "member/login";
	}
	
	//회원가입 페이지로의 접근
	@RequestMapping(value="/member/memberJoinPage.do", method=RequestMethod.GET)
	public String memberJoinPage() {
		return "member/memberJoin";
	}
	
	//아이디 찾기 페이지로의 접근
	@RequestMapping(value="/member/memberFindIdPage.do", method=RequestMethod.GET)
	public String memberFindIdPage() {
		return "member/findId";
	}
	
	//비밀번호 찾기 페이지로의 접근
	@RequestMapping(value="/member/memberFindPwdPage.do", method=RequestMethod.GET)
	public String memberFindPwdPage() {
		return "member/findPwd";
	}
	
	//로그인
	@RequestMapping(value="/member/memberLogin.do", method=RequestMethod.POST)
	public ModelAndView memberLogin(HttpServletRequest request, 
			Member member,
			ModelAndView mav) {
		
		Member m = mService.selectLoginMember(member);
		
		if(m!=null) {
			HttpSession session = request.getSession();
			session.setAttribute("member", m);
			mav.addObject("location", "/");
		} else {
			mav.addObject("msg", "로그인 실패. 아이디와 비밀번호를 확인해주세요.");
			mav.addObject("location", "/member/memberLoginPage.do");
		}
		mav.setViewName("commons/msg");
		return mav;
	}
	
	//로그아웃
	@RequestMapping(value="/member/memberlogout.do", method=RequestMethod.GET)
	public String logout(HttpSession session,
			@SessionAttribute Member member) {
			
		session.invalidate();
			
		return "redirect:/";
	}
	
	//회원가입 시 아이디 중복체크
	//비밀번호 찾기 시 아이디 존재유무 확인
	@RequestMapping(value="/member/memberIdCheck.do", method = RequestMethod.GET)
	public void memberIdCheck(@RequestParam String userId,
			HttpServletResponse response) throws IOException {
		
		int result = mService.selectIdCheck(userId);
		response.getWriter().print(result);
	}
	
	//회원가입시 닉네임 중복체크 (@ResponseBody 사용)
	@RequestMapping(value="/member/memberNickCheck.do", method = RequestMethod.GET)
	@ResponseBody
	public int memberNickCheck(@RequestParam String userNick,
			HttpServletResponse response) throws IOException {
			
		int result = mService.selectNickCheck(userNick);
		return result;
	}
	
	//회원가입시 이메일 중복체크 (@ResponseBody 사용)
	@RequestMapping(value="/member/memberEmailCheck.do", method = RequestMethod.GET)
	@ResponseBody
	public int memberEmailCheck(@RequestParam String userEmail,
			HttpServletResponse response) throws IOException {
			
		int result = mService.selectEmailCheck(userEmail);
		return result;
	}

	//회원가입
	@RequestMapping(value="/member/memberJoin.do", method = RequestMethod.POST)
	public ModelAndView memberJoinus(Member member,
							ModelAndView mav) {
		
		int result = mService.insertMember(member);
		
		if(result>0) {
			mav.addObject("msg", "회원가입을 성공하였습니다.");
			mav.addObject("location", "/");
		} else {
			mav.addObject("msg", "회원가입에 실패했습니다. 입력하신 정보를 다시 확인해주세요.");
			mav.addObject("location", "/member/memberJoinPage.do");
		}
		mav.setViewName("commons/msg");
		return mav;
	}
	
	//회원가입 시 이메일 인증
	//아이디 찾기 시 이메일 인증
	@RequestMapping(value="/member/memberMailCheck.do", method=RequestMethod.GET)
    @ResponseBody
    public String mailCheckGET(String email) throws Exception{
        
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		
		String setForm = "123sanghoi@naver.com";
        String toMail = email;
        String title = "123상회 회원 인증 이메일 입니다.";
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
	@RequestMapping(value="/member/memberFindId.do", method = RequestMethod.POST)
	public ModelAndView memberFindId(Member member,
							ModelAndView mav) {
		
		List<Member> result = mService.findIdMember(member);
		
		if(result.size() > 0) {
			mav.addObject("userResult", result);
			mav.setViewName("member/findIdSuccess");
			
		} else {
			mav.addObject("msg", "입력하신 이메일과 일치하는 아이디가 존재하지 않습니다.");
			mav.addObject("location", "/member/memberFindIdPage.do");
			mav.setViewName("commons/msg");
		}
		return mav;
	}
	
	//비밀번호 찾기 시 입력한 아이디와 이메일이 일치하는지 확인
	@RequestMapping(value="/member/memberIdEmailCheck.do", method = RequestMethod.GET)
	public void memberIdEmailCheck(Member member,
			HttpServletResponse response) throws IOException {
		
		Member result = mService.selectIdEmailCheck(member);
		response.getWriter().print(result.getUserEmail());
	}
	
	
	//비밀번호 찾기(이메일 재발급)
	@RequestMapping(value="/member/memberFindPwd.do", method = RequestMethod.POST)
	public ModelAndView memberFindPwd(Member member,
							ModelAndView mav) {
		
		int result = mService.findPwdMember(member);
		if(result > 0) {
			mav.addObject("result", result);
			
			String userId = member.getUserId();
			String userEmail = member.getUserEmail();
			
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
	        String toMail = userEmail;
	        String title = "123상회 회원 임시비밀번호 발송 이메일 입니다.";
	        String content = 
	                "홈페이지를 방문해주셔서 감사합니다." +
	                "<br>" + 
	                userId + "님의 임시 비밀번호는 " + ranPw + "입니다." + 
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
	        
	        String userNewPwd = ranPw;
	        
	        HashMap<String, Object> map = new HashMap<String, Object>();
	        map.put("userId", userId);
	        map.put("userEmail", userEmail);
	        map.put("userNewPwd", userNewPwd);
			
			int userRandomPwdResult = mService.userRandomPwd(map);
			
			if(userRandomPwdResult>0) {
				mav.setViewName("member/findPwdSuccess");
			} else {
				mav.addObject("msg", "비밀번호 변경을 실패했습니다.\n지속적인 문제 발생시 관리자에게 문의해주세요.");
				mav.addObject("location", "/member/memberFindPwdPage.do");
				mav.setViewName("commons/msg");
			}
			
		} else {
			mav.addObject("msg", "입력하신 정보와 일치하는 아이디가 존재하지 않습니다.");
			mav.addObject("location", "/member/memberFindPwdPage.do");
			mav.setViewName("commons/msg");
		}
		return mav;
	}
	
	
	
}
