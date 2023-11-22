package org.bookbook.service;

import java.util.ArrayList;
import java.util.List;

import org.bookbook.config.CustomLoginSuccessHandler;
import org.bookbook.domain.notification.Notification;
import org.bookbook.sse.SseEmitters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class NotificationService {

	@Autowired
	private SseEmitters sseEmitters;

	private final List<Notification> notifications = new ArrayList<>();

	// 알림 추가
	public void addNotification(Notification notification) {
		notifications.add(notification);
	}

	// 사용자별 알림 조회
	public List<Notification> getNotificationsForUser(String userId) {
		List<Notification> userNotifications = new ArrayList<>();
		for (Notification notification : notifications) {
			if (notification.getReceiver().equals(userId) && !notification.isRead()) {
				userNotifications.add(notification);
			}
		}
		return userNotifications;
	}

	// 로그인 성공 알림을 전송하는 메소드
	public void sendLoginSuccessNotification(String username) {
		 log.info("Preparing to send login success notification for user: {}", username);
		try {
			Notification notification = new Notification(username + "님이 로그인하셨습니다.", username);
			sseEmitters.sendToUser(username, "loginSuccess", notification);
			log.info("Login success notification sent to user: {}", username);
		} catch (Exception e) {
			log.error("Error sending login success notification for user: {}", username, e);
		}
	}

	// 팔로우 알림을 전송하는 메소드
	public void sendFollowNotification(String follower, String following) {
		String message = follower + "가 " + following + "를 팔로우 하였습니다.";
		sseEmitters.sendToUser(following, "followNotification", message);
	}
}