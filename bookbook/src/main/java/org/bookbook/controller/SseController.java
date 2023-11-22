package org.bookbook.controller;

import org.bookbook.sse.SseEmitters;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class SseController {

	private final SseEmitters sseEmitters;

	public SseController(SseEmitters sseEmitters) {
		this.sseEmitters = sseEmitters;
	}

	@GetMapping(value = "/connect", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
	public ResponseEntity<SseEmitter> connect() {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication != null && authentication.isAuthenticated()) {
			// 현재 로그인한 사용자의 ID를 가져옵니다.
			String userId = authentication.getName();
			SseEmitter emitter = new SseEmitter(60 * 10000L); // 재연결시간 10분으로 설정함 60 * 1000L 60초 
			// 사용자별로 SseEmitter 인스턴스를 추가합니다.
			sseEmitters.addEmitter(userId, emitter);
			log.info("Connected SSE for user: {}", userId); // 로그 추가
			return ResponseEntity.ok(emitter);
		} else {
			// 인증되지 않은 경우, 401 Unauthorized 상태 코드를 반환합니다.
			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
		}
	}
}

//	@GetMapping(value = "/connect", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
//	public ResponseEntity<SseEmitter> connect() {
//		SseEmitter emitter = new SseEmitter(60 * 1000L);
//		sseEmitters.add(emitter);
//		try {
//			emitter.send(SseEmitter.event().name("connect").data("connected!"));
//		} catch (IOException e) {
//			throw new RuntimeException(e);
//		}
//		return ResponseEntity.ok(emitter);
//	}

// @PostMapping("/count") // 클라이언트가 특정 작업을 요청할 때 호출
// public ResponseEntity<Void> count() {
// sseEmitters.count();
// return ResponseEntity.ok().build();
// }
