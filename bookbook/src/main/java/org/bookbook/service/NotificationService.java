package org.bookbook.service;

import java.util.List;

import org.bookbook.domain.notification.Notification;


// 사용자에게 알림을 추가하고, 조회하며, 읽음 처리하는 기능을 제공
public interface NotificationService {
	
	public void addNotification(Notification notification); //새로운 알림을 추가하는 메소드

	public List<Notification> getNotificationsForUser(String userId); // 사용자의 모든 알림을 조회하는 메소드.

	public void markNotificationAsRead(Long id); //알림을 읽음으로 표시하는 메소드.
	
}