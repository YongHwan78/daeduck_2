package kr.or.ddit.controller.crud.notice;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.INoticeService;
import kr.or.ddit.vo.CustomUser;
import kr.or.ddit.vo.crud.NoticeMemberVO;

@Controller
@RequestMapping("/notice")
public class NoticeProfileController {

	@Inject
	private INoticeService noticeService;
	
	@RequestMapping(value="/profile.do", method = RequestMethod.GET)
	public String noticeProfile(
			RedirectAttributes ra, 
			HttpSession session, Model model
			) {
		String goPage = "";
		
		// 첫번째 방법) HttpSession 이용 방법
//		NoticeMemberVO memberVO = (NoticeMemberVO) session.getAttribute("SessionInfo");
		
		// 두번째 방법) 시큐리티 인증 시
		CustomUser user = 
				(CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		NoticeMemberVO memberVO = user.getMember();
		
		if(memberVO != null) {	// 로그인 사용자
			NoticeMemberVO member = noticeService.selectMember(memberVO.getMemId());
			if(member != null) {
				model.addAttribute("member", member);
				goPage = "notice/profile";
			}else {
				ra.addFlashAttribute("message", "로그인 후 이용가능합니다!");
				goPage = "redirect:/notice/login.do";
			}
		}else {	// 로그인 하고 와
			ra.addFlashAttribute("message", "로그인 후 사용 가능합니다!");
			return "redirect:/notice/login.do";
		}
		
		return goPage;
	}
	
	// 마이페이지 수정
	@RequestMapping(value="/profileUpdate.do")
	public String noticeProfileUpdate(
			HttpServletRequest req, RedirectAttributes ra,
			NoticeMemberVO memberVO, Model model) {
		// 서비스를 통해 요청할 마이페이지 수정 이벤트 기능명은 'profileUpdate()' 로한다.
		// 수정이 완료되면, '회원정보 수정이 완료되었습니다!' 메세지를 출력해주세요!
		String goPage = "";
		ServiceResult result = noticeService.profileUpdate(req, memberVO);
		if(result.equals(ServiceResult.OK)) {
			ra.addFlashAttribute("message", "회원정보 수정이 완료되었습니다!");
			goPage = "redirect:/notice/profile.do";
		}else {
			model.addAttribute("message", "서버에러, 다시 시도해주세요!");
			model.addAttribute("member", memberVO);
			goPage = "notice/profile";
		}
		return goPage;
	}
}













