package kr.or.ddit.controller.test.dao;

import java.util.ArrayList;
import java.util.List;

import kr.or.ddit.controller.test.vo.StudentVO;

public class Test03Repository {
	
	// 305호 학생 정보를 담을 리스트
	private List<StudentVO> studentList = new ArrayList<StudentVO>();
	
	private String[] ids = {"a001","b001","c001","d001","e001","f001"};
	private String[] pws = {"1234","1234","1234","1234","1234","1234"};
	private String[] names = {"안희재","김현태","김나혜","김영상","최현명","신하림"};
	private String[] phones = {
		"011-1122-4783","016-4734-1523","010-1234-1234","019-9879-2243","010-4536-1234",
		"010-7564-4352"
	};
	
	private static Test03Repository instance = null;
	public static Test03Repository getInstance() {
		if(instance == null) {
			instance = new Test03Repository();
		}
		return instance;
	}
	
	private Test03Repository() {
		// StudentVO를 활용하여 305호 학생 5명을 초기화해주세요!
		// # 첫번째 학생
		// 아이디 : a001
		// 비밀번호 : 1234
		// 이름 : 홍길동
		// 핸드폰번호 : 010-1234-1234
		// 이메일 : a001@naver.com  과 같은 데이터로 학생 총 5명의 데이터를 초기화 한 후,
		// 학생 정보를 담을 리스트에 추가해주세요!
		for(int i = 0; i < ids.length; i++) {
			StudentVO student = new StudentVO();
			student.setMemId(ids[i]);
			student.setMemPw(pws[i]);
			student.setMemName(names[i]);
			student.setMemEmail(ids[i] + "@naver.com");
			student.setMemPhone(phones[i]);
			studentList.add(student);
		}
	}
	
	// 기능 구현
	// 1) 학생 전체 가져오기
	public List<StudentVO> selectStudentList(){
		return studentList;
	}
	// 2) 학생 한명 정보 가져오기
	public StudentVO selectStudent(String memId){
		StudentVO stuVO = null;
		for(StudentVO sVO : studentList) {
			if(sVO.getMemId().equals(memId)) {
				stuVO = sVO;
				break;
			}
		}
		return stuVO;
	}
	// 3) 이름, 이메일 정보를 활용해 학생 아이디 가져오기
	public String searchId(String memName, String memEmail){
		String id = "";

		for(StudentVO sVO : studentList) {
			if(sVO.getMemName().equals(memName) &&
					sVO.getMemEmail().equals(memEmail)) {
				id = sVO.getMemId();
				break;
			}
		}
		
		return id;
	}
	// 4) 아이디, 이름, 이메일 정보를 활용해 학생 비밀번호 가져오기
	public String searchPw(String memId, String memName, String memEmail){
		String pw = "";

		for(StudentVO sVO : studentList) {
			if(sVO.getMemId().equals(memId) && 
					sVO.getMemName().equals(memName) &&
					sVO.getMemEmail().equals(memEmail)) {
				pw = sVO.getMemPw();
				break;
			}
		}
		
		return pw;
	}
	// 등등 필요에 의한 기능을 구현해주세요!
	public StudentVO loginCheck(String memId, String memPw){
		StudentVO stuVO = null;
		for(StudentVO sVO : studentList) {
			if(sVO.getMemId().equals(memId) &&
					sVO.getMemPw().equals(memPw)) {
				stuVO = sVO;
				break;
			}
		}
		return stuVO;
	}
	
	// 위 4가지 기능은 필수! 
	
}










