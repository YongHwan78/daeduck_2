package kr.or.ddit.vo;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import kr.or.ddit.vo.crud.CrudMember;
import kr.or.ddit.vo.crud.NoticeMemberVO;

public class CustomUser extends User {

	private NoticeMemberVO member;
	
	public CustomUser(String username, String password, 
			Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}
	
	public CustomUser(NoticeMemberVO memberVO) {
		super(memberVO.getMemId(), memberVO.getMemPw(),
				memberVO.getAuthList().stream().map(
						auth -> new SimpleGrantedAuthority(
								auth.getAuth())).collect(Collectors.toList()));
		this.member = memberVO;
	}

	public NoticeMemberVO getMember() {
		return member;
	}

	public void setMember(NoticeMemberVO member) {
		this.member = member;
	}

}







