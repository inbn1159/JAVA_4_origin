document.addEventListener('DOMContentLoaded', (event) => {
    console.log("DOMContentLoaded 이전 EventSource 상태: ", eventSource ? eventSource.readyState : "없음");
    startSSE();
    console.log("DOMContentLoaded 이후 EventSource 상태: ", eventSource.readyState);
});


let eventSource;

function startSSE() {
    eventSource = new EventSource('/connect');

	console.log("EventSource 상태: ", eventSource.readyState);
    eventSource.onmessage = function(event) {
    console.log("EventSource 상태 (onmessage): ", eventSource.readyState);
        console.log("Event received: ", event);
        const data = JSON.parse(event.data);
        displayNotification(data);
    };

    eventSource.onerror = function() {
        console.error('SSE 연결 오류 발생. 재연결 시도.');
         console.log("EventSource 상태 (onerror): ", eventSource.readyState);
        eventSource.close();
        setTimeout(startSSE, 5000);
    };
}

function displayNotification(data) {
    const notificationList = document.getElementById('notificationList');
    
     // 데이터가 비어 있거나 있을 경우 메시지 표시
    if (!data || !data.content) {
        const emptyMessage = document.createElement('li');
        emptyMessage.textContent = "새 알림이 없습니다.";
        notificationList.appendChild(emptyMessage);
    } else {
        const newNotification = document.createElement('li');
        newNotification.textContent = data.content;
        notificationList.appendChild(newNotification);
    }
    
    // 알림 리스트 보이기
    notificationList.style.display = 'block';
}
 //토글 이벤트 none block none
function toggleNotifications() {
    const notificationList = document.getElementById('notificationList');
    notificationList.style.display = notificationList.style.display === 'none' ? 'block' : 'none';
}
