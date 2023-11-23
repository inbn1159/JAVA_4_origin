package org.bookbook.config;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.bookbook.service.NotificationServiceimpl;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	private final NotificationServiceimpl notificationService;

	public CustomLoginSuccessHandler(NotificationServiceimpl notificationService) {
		this.notificationService = notificationService;
		// NotificationService 주입 확인 로그
		if (this.notificationService == null) {
			log.error("NotificationService is not injected properly!");
			System.out.println("Error: NotificationService is not injected properly!");
		} else {
			log.info("NotificationService is injected successfully.");
			System.out.println("NotificationService is injected successfully.");
		}
	}

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException {
		String username = authentication.getName();
		log.info("onAuthenticationSuccess called for user: {}", username);
		System.out.println("onAuthenticationSuccess called for user: " + username);

		
		if (notificationService != null) {
			notificationService.sendLoginSuccessNotification(username);
			log.info("Login success notification sent for user: {}", username);
			System.out.println("Login success notification sent for user: " + username);
		} else {
			log.error("NotificationService is null, cannot send notification for user: {}", username);
			System.out.println("Error: NotificationService is null, cannot send notification for user: " + username);
		}

		response.sendRedirect("/");
	}
}
