package org.bookbook.service;

import java.io.IOException;
import java.util.List;

import org.bookbook.domain.AuthVO;
import org.bookbook.domain.ChangePasswordVO;
import org.bookbook.domain.FollowerVO;
import org.bookbook.domain.UserVO;
import org.bookbook.mapper.FollowerMapper;
import org.bookbook.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Service	
@Log4j
public class UserServiceImpl implements UserService {

	public static final String AVATAR_UPLOAD_DIR = "c:/upload/avatar";

	@Autowired
	UserMapper mapper;
	
	@Autowired
	UserService service;
	
	 @Autowired
    private FollowerMapper followerMapper;

	@Autowired
	private PasswordEncoder pwEncoder;

	// 
	@Override
	public UserVO get(String userid) {
		return mapper.read(userid);
	}

	
	//�쉶�썝 媛��엯
	@Override
	public void register(UserVO userid) throws IOException {

		// 1. 鍮꾨�踰덊샇 �븫�샇�솕
		String encPassword = pwEncoder.encode(userid.getPassword());
		userid.setPassword(encPassword);

		// 2. users �뀒�씠釉붿뿉 ���옣
		mapper.insert(userid);

		// 3. users_auth�뿉 ���옣
		AuthVO auth = new AuthVO(userid.getUserid(), "ROLE_USER");
		mapper.insertAuth(auth);

	}

	
	// 鍮꾨�踰덊샇 諛붽씀湲�
	@Override
	public boolean changePassword(ChangePasswordVO vo) {
		UserVO user = mapper.read(vo.getUserid());

		log.info("�엯�젰�맂 orgPassword: " + vo.getOrgPassword());
		log.info("���옣�맂 鍮꾨�踰덊샇: " + user.getPassword());
		// �뜲�씠�꽣踰좎씠�뒪�뿉 ���옣�릺�뼱�엳�뒗 �뙣�뒪�썙�뱶
		if (!pwEncoder.matches(vo.getOrgPassword(), user.getPassword())) {
			// 鍮꾨쾲 �삤瑜�
			log.info("鍮꾨�踰덊샇 遺덉씪移�.");
			return false;
		}

		String encPassword = pwEncoder.encode(vo.getNewPassword());
		vo.setEncPassword(encPassword);
		mapper.changePassword(vo);

		return true;
	}


	  @Override
	    public List<UserVO> getAllUsers() {
	        return service.getAllUsers();
	    }
	  
	   @Override
	    public List<UserVO> getAllUsersWithFollowStatus(String currentUserId) {
		   List<UserVO> users = service.getAllUsers();
		    users.forEach(user -> {
		        FollowerVO follow = followerMapper.findFollowByUserIds(currentUserId, user.getUserid());
		        user.setFollowed(follow != null);
		    });
		    return users;
	    }


	  
}
