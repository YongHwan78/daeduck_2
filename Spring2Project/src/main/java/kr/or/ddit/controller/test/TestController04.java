package kr.or.ddit.controller.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/test05")
public class TestController04 {
	
	@RequestMapping(value="/main.do")
	public String test04Main() {
		return "test/test05/main";
	}
	
}
