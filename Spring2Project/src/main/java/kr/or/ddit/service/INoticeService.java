package kr.or.ddit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.crud.NoticeFileVO;
import kr.or.ddit.vo.crud.NoticeMemberVO;
import kr.or.ddit.vo.crud.NoticeVO;
import kr.or.ddit.vo.crud.PaginationInfoVO;

public interface INoticeService {
	public ServiceResult insertNotice(HttpServletRequest req, NoticeVO noticeVO);
	public NoticeVO selectNotice(int boNo);
	public ServiceResult updateNotice(HttpServletRequest req, NoticeVO noticeVO);
	public ServiceResult deleteNotice(HttpServletRequest req, int boNo);
	public int selectNoticeCount(PaginationInfoVO<NoticeVO> pagingVO);
	public List<NoticeVO> selectNoticeList(PaginationInfoVO<NoticeVO> pagingVO);
	
	// 로그인 컨트롤러 관련 이벤트
	public ServiceResult idCheck(String string);
	public ServiceResult signup(HttpServletRequest req, NoticeMemberVO memberVO);
	public NoticeMemberVO loginCheck(NoticeMemberVO memberVO);
	public String idForgetProcess(NoticeMemberVO memberVO);
	
	// 공지사항 게시판 다운로드
	public NoticeFileVO noticeDownload(int fileNo);
	public NoticeMemberVO selectMember(String memId);
	public ServiceResult profileUpdate(HttpServletRequest req, NoticeMemberVO memberVO);
}
