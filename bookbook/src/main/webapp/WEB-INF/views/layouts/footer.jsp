<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
</div>
<footer>
	<div class="copyright">Created By Team Uh!ban</div>
</footer>

<div id="notificationIcon"></div>
<ul id="notificationList" ></ul>
<link rel="stylesheet" href="/resources/css/notification.css" />

<script>
	let eventSource;

	function startSSE() {
		eventSource = new EventSource('/connect');

		eventSource.onmessage = function(event) {
			console.log("Event received: ", event); //log 출력
			const data = JSON.parse(event.data);
			if (data.type === 'loginSuccess'
					|| data.type === 'followNotification') {
				const notificationList = document
						.getElementById('notificationList');
				const newNotification = document.createElement('li');
				newNotification.textContent = data.message;
				newNotification.classList.add('notification-item'); // 클래스 추가
				notificationList.appendChild(newNotification);
				notificationList.style.display = 'block';
			}
		};

		eventSource.onerror = function() {
			console.error('SSE 연결 오류 발생. 재연결 시도.');
			eventSource.close();
			setTimeout(startSSE, 5000); // 5초 후 재연결 시도
		};
	}

	startSSE();
</script>
</body>
</html>