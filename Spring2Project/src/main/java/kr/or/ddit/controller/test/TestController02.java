package kr.or.ddit.controller.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/test")
public class TestController02 {

	@RequestMapping(value="/addressBook.do")
	public String addressBook() {
		return "test/addressBook";
	}
	
	@RequestMapping(value="/addAddress.do")
	public String addAddress(){
		return "test/addAddress";
	}
	
}
