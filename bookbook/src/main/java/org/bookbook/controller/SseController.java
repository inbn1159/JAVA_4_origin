package org.bookbook.controller;

import org.bookbook.sse.SseEmitters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class SseController {

	@Autowired
	private SseEmitters sseEmitters;

	@GetMapping(value = "/connect", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
	public ResponseEntity<SseEmitter> connect() {
		SseEmitter emitter = new SseEmitter(60 * 30000L); // 30분 10000L 10분

		emitter.onCompletion(new Runnable() {
			@Override
			public void run() {
				sseEmitters.removeEmitter(emitter);
			}
		});

		emitter.onTimeout(new Runnable() {
			@Override
			public void run() {
				sseEmitters.removeEmitter(emitter);
			}
		});

		sseEmitters.addEmitter(emitter);

		log.info("Connected SSE");
		return ResponseEntity.ok(emitter);
	}
}