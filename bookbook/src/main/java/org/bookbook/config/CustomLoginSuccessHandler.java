package org.bookbook.config;


import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bookbook.service.NotificationService;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	private final NotificationService notificationService;

	public CustomLoginSuccessHandler(NotificationService notificationService) {
		this.notificationService = notificationService;
	}

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException {
		String username = authentication.getName();
		System.out.println("onAuthentication Login success for user: " + username);
		 log.info("Login success for user: {}", username); 
		// 로그인 성공 로직
		notificationService.sendLoginSuccessNotification(username);
		 log.info("Login success for user: {}", username); 
		response.sendRedirect("/");
	}
}
