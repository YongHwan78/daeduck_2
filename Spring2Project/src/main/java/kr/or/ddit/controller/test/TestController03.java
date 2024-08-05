package kr.or.ddit.controller.test;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.controller.test.dao.Test03Repository;
import kr.or.ddit.controller.test.vo.StudentVO;

@Controller
@RequestMapping("/test03")
public class TestController03 {

	private Test03Repository repository = Test03Repository.getInstance();
	
	// 로그인 페이지
	@RequestMapping(value="/login.do", method = RequestMethod.GET)
	public String loginPage() {
		return "test/test03/login";
	}
	
	@RequestMapping(value="/loginCheck.do", method = RequestMethod.POST)
	public String loginCheck(
			StudentVO stuVO, Model model) {
		String goPage = "";
		Map<String, String> errors = new HashMap<String, String>();
		if(stuVO.getMemId() == null || stuVO.getMemId().equals("")) {
			errors.put("memId", "아이디를 입력해주세요!");
		}
		if(stuVO.getMemPw() == null || stuVO.getMemPw().equals("")) {
			errors.put("memPw", "비밀번호를 입력해주세요!");
		}
		
		if(errors.size() > 0) {
			model.addAttribute("errors", errors);
			model.addAttribute("stuVO", stuVO);
			goPage = "test/test03/login";
		}else {
			StudentVO studentVO = repository.loginCheck(stuVO.getMemId(), stuVO.getMemPw());
			if(studentVO != null) {
				goPage = "redirect:/test03/info.do?stat="+studentVO.getMemId();
			}else {
				model.addAttribute("msg", "로그인 실패!");
				model.addAttribute("stuVO", stuVO);
				goPage = "test/test03/login";
			}
		}
		return goPage;
	}
	
	// 아이디/비밀번호 찾기 페이지
	@RequestMapping(value="/findInfo.do", method = RequestMethod.GET)
	public String findInfo() {
		return "test/test03/findInfo";
	}
	
	
	
	// 로그인 후 정보 페이지
	@RequestMapping(value="/info.do", method = RequestMethod.GET)
	public String info(String stat, Model model) {
		if(stat != null) {
			model.addAttribute("msg", stat + "님! 환영합니다!");
		}
		model.addAttribute("studentList", repository.selectStudentList());
		model.addAttribute("studentVO", repository.selectStudent(stat));
		return "test/test03/info";
	}
	
	
	
}
