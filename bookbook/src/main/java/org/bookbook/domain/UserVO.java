package org.bookbook.domain;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.springframework.security.core.authority.SimpleGrantedAuthority;

import lombok.Data;

@Data
public class UserVO {

	@NotBlank(message = "사용자 id는 필수항목입니다.")
	@Size(min = 4, message = "사용자 id는 4글자 이상이어야 합니다.")
	private String userid;

	private String username;
	
	private String nickname;

	//@NotBlank(message = "email는 필수항목입니다.")
	//@Email(message = "email 형식에 맞지 않습니다.")
	private String email;
	
	@NotBlank(message = "비밀번호는 필수항목입니다.")
	private String password;   //비밀번호 

	@NotBlank(message = "비밀번호 확인은 필수항목입니다.")
	private String passwordcheck; // 비밀번호 확인

	private String profileImageUrl; // 사용자사진

	private Date regDate;
	
	private Date birth;
	
	private String gender;

	private List<AuthVO> authList;
//////////////
	
	public Collection<SimpleGrantedAuthority> getAuthorities() {
		List<SimpleGrantedAuthority> authorities = new ArrayList<>();
		for (AuthVO auth : authList) {
			authorities.add(new SimpleGrantedAuthority(auth.getAuth()));
		}
		return authorities;
	}

}
