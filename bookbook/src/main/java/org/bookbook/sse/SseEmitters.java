package org.bookbook.sse;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.atomic.AtomicLong;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class SseEmitters {

	// private static final AtomicLong counter = new AtomicLong();

	// private final List<SseEmitter> emitters = new CopyOnWriteArrayList<>();
//  ConcurrnetModificationException이 발생 방지로 thread-safe한 자료구조인 CopyOnWriteArrayList를 사용

	// 각 사용자별로 SseEmitter 인스턴스를 저장하는 맵
	private final Map<String, SseEmitter> userEmitters = new ConcurrentHashMap<>();

	// 사용자별 SseEmitter 인스턴스를 추가하는 메소드
	public void addEmitter(String userId, SseEmitter emitter) {
		userEmitters.put(userId, emitter);
		try {
			emitter.send(SseEmitter.event().name("connect").data("connected!"));
		} catch (IOException e) {
			userEmitters.remove(userId);
			// 로그 및 에러 처리
		}
	}

	// 사용자별 SseEmitter 인스턴스를 제거하는 메소드
	public void removeEmitter(String userId) {
		userEmitters.remove(userId);
	}

	// 특정 사용자에게만 이벤트를 전송하는 메소드
	public void sendToUser(String userId, String eventType, Object data) {
		SseEmitter emitter = userEmitters.get(userId);
		if (emitter != null) {
			try {
				log.info("Sending {} event to user {}", eventType, userId); // 로그 추가
				emitter.send(SseEmitter.event().name(eventType).data(data));
			} catch (IOException e) {
				// 로그 추가 및 에러 처리
				log.error("Error sending event to user: {}, Error: {}", userId, e.getMessage()); // 에러 로그 추가
				userEmitters.remove(userId);
			}
		}
	}
}
