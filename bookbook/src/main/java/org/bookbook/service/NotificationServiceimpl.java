package org.bookbook.service;

import java.util.ArrayList;
import java.util.List;

import org.bookbook.domain.notification.Notification;
import org.bookbook.mapper.NotificationMapper;
import org.bookbook.sse.SseEmitters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class NotificationServiceimpl implements NotificationService {

	@Autowired
	 NotificationMapper notificationMapper;

	@Autowired
	 SseEmitters sseEmitters;

	private List<Notification> notifications = new ArrayList<>();

	// 알림 추가
	public void addNotification(Notification notification) {
		notifications.add(notification);
	}

	// 사용자별 알림 조회 (현재 사용되지 않지만, 추후 필요할 수 있으므로 유지)
	public List<Notification> getNotificationsForUser(String userId) {
		List<Notification> userNotifications = new ArrayList<>();
		for (Notification notification : notifications) {
			if (notification.getReceiver().equals(userId) && !notification.isRead()) {
				userNotifications.add(notification);
			}
		}
		return userNotifications;
	}

	// 로그인 성공 알림을 전송하는 메소드 (모든 연결된 클라이언트에게 전송)
	public void sendLoginSuccessNotification(String username) {
		try {
			Notification notification = new Notification(username + "님이 로그인하셨습니다.", username);
			log.info("Sending login success notification for user: {}", username);
			sseEmitters.sendToAllConnectedClients(notification);
		} catch (Exception e) {
			log.error("Error sending login success notification", e);
		}
	}

	// 팔로우 알림을 전송하는 메소드 (특정 사용자에게 전송)
	public void sendFollowNotification(String follower, String following) {
		String message = follower + "가 " + following + "를 팔로우 하였습니다.";
		// sseEmitters.sendToUser(following, "followNotification", message); // 특정 사용자에게
		// 보내는 경우
		sseEmitters.sendToAllConnectedClients(new Notification(message, following)); // 모든 연결된 클라이언트에게 전송
	}

	@Override
	public void markNotificationAsRead(Long id) {
		notificationMapper.updateNotificationReadStatus(id, true);

	}

}