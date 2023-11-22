var searchBookList = ${searchBook};
var topics = Object.keys(searchBookList);

console.log(searchBookList);

for (var topic in topics) {
    var genres = Object.keys(searchBookList[topics[topic]]);

    // 각 주제에 대한 카테고리와 장르 목록을 표시할 div 생성
    var topicDiv = document.createElement('div');
    topicDiv.innerHTML = `<h3>${topics[topic]}</h3>`;

    for (var genre in genres) {
        var categories = searchBookList[topics[topic]][genres[genre]];

        // 카테고리 문자열을 리스트 형식으로 바꿔줌
        var genreDiv = document.createElement('div');
        genreDiv.innerHTML = `<strong>${genres[genre]}</strong>: ${categories.join(', ')}`;

        topicDiv.appendChild(genreDiv);
    }

    // 각 주제의 결과를 body에 추가
    document.body.appendChild(topicDiv);
};
