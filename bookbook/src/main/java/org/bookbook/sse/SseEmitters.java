package org.bookbook.sse;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class SseEmitters {

	private final List<SseEmitter> emitters = new CopyOnWriteArrayList<>();

	private final ObjectMapper objectMapper = new ObjectMapper();

	public void addEmitter(SseEmitter emitter) {
		emitters.add(emitter);
	}

	public void removeEmitter(SseEmitter emitter) {
		emitters.remove(emitter);
	}

	// 모든 연결된 클라이언트에게 이벤트를 전송
	// JSON으로 해봄
	public void sendToAllConnectedClients(Object data) {
		List<SseEmitter> listEmitters = new ArrayList<>();
		String jsonData;

		try {
			jsonData = objectMapper.writeValueAsString(data);
			System.out.println("데이터를 JSON으로 변환함: " + jsonData);
		} catch (Exception e) {
			log.error("데이터를 JSON으로 변환하는 중 오류 발생", e);
			System.out.println("데이터를 JSON으로 변환하는 중 오류 발생: " + e.getMessage());
			return;
		}

		
		
		 //
		log.info("현재 연결된 클라이언트 수: {}", emitters.size());

		for (SseEmitter emitter : emitters) {
			try {
				log.info("emitter에게 JSON 데이터 전송 중");
				  emitter.send(SseEmitter.event().data(jsonData, MediaType.APPLICATION_JSON));
				System.out.println("emitter에게 JSON 데이터 전송 중: " + jsonData); // 데이터 전송 로그
			} catch (Exception e) {
				log.error("emitter에게 데이터 전송 중 오류 발생", e);
				listEmitters.add(emitter);
				System.out.println("emitter에게 데이터 전송 중 오류 발생: " + e.getMessage()); // 데이터 전송 오류 로그
			}
		}

		listEmitters.forEach(this::removeEmitter);
		}
	}

//	public void sendToAllConnectedClients(Object data) {
//		List<SseEmitter> deadEmitters = new ArrayList<>();
//		for (SseEmitter emitter : emitters) {
//			try {
//				log.info("Sending data to emitter");
//				System.out.println("Sending data to emitter: " + data);
//				emitter.send(SseEmitter.event().data(data));
//			} catch (Exception e) {
//				log.error("Error sending data to emitter", e);
//				System.out.println("Error sending data to emitter: " + e.getMessage());
//				deadEmitters.add(emitter);
//
//			}
//		}
//		for (SseEmitter deadEmitter : deadEmitters) {
//			emitters.remove(deadEmitter);
//		}//
//	}


