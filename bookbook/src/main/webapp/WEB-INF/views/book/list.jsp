<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<h1>페이지 타이틀</h1>

<div>
	<form:form id="searchForm" modelAttribute="search" method="get"
		class="d-flex">
		<div class="input-group">
			<form:input path="keywords" cssClass="form-control rounded-0" />

			<script>
            	// DB에서 카테고리, 장르 값 받아오는 스크립트
                var searchBookList = ${searchBook};
                var genres = Object.keys(searchBookList);

                for (var i = 0; i < genres.length; i++) {
                	// genres 안의 genre 선언
                    var genre = genres[i];
                    
                    // 카테고리 문자열을 리스트 형식으로 바꿔줌
                    var categories = searchBookList[genre].split(',');
					
                    // div 생성
                    var div = document.createElement('div');
                	// genre를 div id로 설정
                    div.id = genre;
                	// html에 보여지는 값을 genre로 설정
                    div.textContent = genre;

                	// div 뭉치들을 띄워줌
                    div.appendChild(document.createElement('br'));
                	// html body에 자식으로 선언
                    document.body.appendChild(div);

                	// categories를 분리 시킴 : 전부 div안에서 생성되고 있음
                    for (var j = 0; j < categories.length; j++) {
                    	// category 선언
                        var category = categories[j];

                    	// category 선택 할 수 있게 checkbox 생성
                        var checkbox = document.createElement('input');
                        checkbox.type = 'checkbox';
                        checkbox.name = 'categories'; // 같은 그룹의 체크박스로 묶기 위해 name 설정
                        checkbox.value = category;   // 눌렀을 때 전송되는 값 설정

                        // 보여지는 값 설정
                        var label = document.createElement('label');
                        label.appendChild(document.createTextNode(category));
                        
                        // set 설정 (중복 genre 값 제외)
                        var selectedGenresSet = new Set();

                     // 이벤트 핸들러 추가				//category, genre
                        checkbox.onclick = function (key1, key2) {
                            return function () {
                                // 체크박스가 체크되면 실행할 동작
                                if (this.checked) {
                                    // 이미 선택된 값이 있다면 콤마로 구분하여 추가
                                    if (document.getElementById('selectedCategory').value !== '') {
                                        document.getElementById('selectedCategory').value += ',';
                                    }
                                    document.getElementById('selectedCategory').value += key1;
                                    
                                    // selectedGenresSet안에 genre 유무 판단
                                    if (!selectedGenresSet.has(key2)) {
                                    	// 없다면 genre 추가
                                    	selectedGenresSet.add(key2);
                                        if (document.getElementById('selectedGenre').value !== '') {
                                            document.getElementById('selectedGenre').value += ',';
                                        }
                                        document.getElementById('selectedGenre').value += key2;
                                    }
                                    
                                } else {
                                    // 체크가 해제되면 선택된 값에서 제거
                                    var currentValue = document.getElementById('selectedCategory').value;
                                    currentValue = currentValue.replace(new RegExp(key1 + ','), '');
                                    currentValue = currentValue.replace(new RegExp(',' + key1), '');
                                    currentValue = currentValue.replace(new RegExp(key1), '');
                                    document.getElementById('selectedCategory').value = currentValue;

                                    selectedGenresSet.delete(key2);
                                    var currentGenreValue = document.getElementById('selectedGenre').value;
                                    currentGenreValue = currentGenreValue.replace(new RegExp(key2 + ','), '');
                                    currentGenreValue = currentGenreValue.replace(new RegExp(',' + key2), '');
                                    currentGenreValue = currentGenreValue.replace(new RegExp(key2), '');
                                    document.getElementById('selectedGenre').value = currentGenreValue;
                                }
                            };
                        }(category, genre);

                        // 체크박스와 라벨을 동시에 추가
                        div.appendChild(checkbox);
                        div.appendChild(label);
                    }
                }
            </script>

			<!-- 추가: 검색 버튼 클릭 시 JavaScript 함수 호출 -->
			<button type="submit" class="btn btn-success  rounded-0"
				onclick="prepareAndSubmitForm()">
				<i class="fa-solid fa-magnifying-glass"></i> 검색
			</button>

			<!-- 추가: hidden input 추가 -->
			<input type="hidden" id="selectedCategory" name="categories" value=""
				multiple>
			<!-- 추가: 선택된 장르를 저장할 hidden input 추가 -->
			<input type="hidden" id="selectedGenre" name="bookType" value=""
				multiple>

			<!-- 추가: JavaScript 함수 정의 -->
			<script>
                function prepareAndSubmitForm() {
                    // 장르 정보 가져오기
                    var selectedGenre = document.getElementById('selectedGenre').value;

                    // 검색어 및 카테고리 정보 저장
                    searchState.keywords = document.getElementById('keywords').value;

                    // 선택된 카테고리를 hidden input에 설정
                    document.getElementById('selectedCategory').value = searchState.selectedCategories.join(',');

                    // 선택된 버튼의 값을 hidden input에 설정
                    var selectedButton = document.querySelector('#selectedButtonValue');
                    if (selectedButton) {
                        document.getElementById('selectedButtonValue').value = selectedButton.value;
                    }

                    // 장르 정보를 앞에 붙여서 form을 서버로 제출
                    document.getElementById('searchForm').action = '/your/search/endpoint/' + encodeURIComponent(selectedGenre);
                    document.getElementById('searchForm').submit();
                }
            </script>
		</div>
	</form:form>
</div>


<style>
.card-container {
	display: flex;
	flex-wrap: wrap;
	gap: 20px;
}

.card {
	width: 200px;
	border: 1px solid #ccc;
	border-radius: 8px;
	overflow: hidden;
}

.card-img-top {
	width: 100%;
	height: 150px;
	object-fit: cover;
}

.card-body {
	padding: 10px;
	text-align: center;
}

.pageInfo {
	list-style: none;
	display: inline-block;
	margin: 50px 0 0 100px;
}

.pageInfo li {
	float: left;
	font-size: 20px;
	margin-left: 18px;
	padding: 7px;
	font-weight: 500;
}

a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: black;
	text-decoration: underline;
}

.active {
	background-color: #cdd5ec;
}
</style>

<h1>도서 목록</h1>

<c:if test="${not empty list}">
	<div class="card-container">
		<c:forEach var="book" items="${list}">
			<div class="card">
				<img src="" alt="${book.title}" class="card-img-top">
				<div class="card-body">
					<h5 class="card-title">${book.title}</h5>
					<p class="card-text">저자: ${book.author}</p>
					<p class="card-text">출판사: ${book.publisher}</p>
					<p class="card-text">장르: ${book.genre}</p>
					<p class="card-text">카테고리: ${book.category}</p>
					<p class="card-text"></p>
					<button class="btn btn-primary" onclick="likeBook('')">좋아요</button>
					<button class="btn btn-primary" onclick="addToFavorites('')">즐겨찾기</button>
				</div>
			</div>
		</c:forEach>
	</div>

	<form>
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
	</form>

	<div class="pageInfo_wrap">
		<div class="pageInfo_area">
			<ul id="pageInfo" class="pageInfo">

				<!-- 이전페이지 버튼 -->
				<c:if test="${pageMaker.prev}">
					<li class="pageInfo_btn previous"><a
						href="${pageMaker.startPage-1}">Previous</a></li>
				</c:if>

				<!-- 각 번호 페이지 버튼 -->
				<c:forEach var="num" begin="${pageMaker.startPage}"
					end="${pageMaker.endPage}">
					<li class="pageInfo_btn"${pageMaker.cri.pageNum == num ? "active":"" }"><a
						href="/book/list?pageNum=${num}">${num}</a></li>
				</c:forEach>


				
				<!-- 다음페이지 버튼 -->
				<c:if test="${pageMaker.next}"> 
					<li class="pageInfo_btn next"><a
						href="${pageMaker.endPage + 1 }">Next</a></li>
				</c:if>

			</ul>
		</div>
	</div>

</c:if>

<c:if test="${empty list}">
	<p>책을 찾을 수 없습니다.</p>
</c:if>

<!-- 추가: 좋아요를 처리하는 JavaScript 및 서버로 전송하는 함수 -->
<script>
    function likeBook(bookId) {
        // 좋아하는 도서 ID를 서버로 전송
        // 예: AJAX를 사용하여 서버에 전송하거나 페이지를 새로고침하여 서버로 데이터를 전송
        alert('좋아요를 눌렀습니다. 도서 ID: ' + bookId);
    }

    function addToFavorites(bookId) {
        // 즐겨찾기 도서 ID를 서버로 전송
        // 예: AJAX를 사용하여 서버에 전송하거나 페이지를 새로고침하여 서버로 데이터를 전송
        alert('즐겨찾기에 추가했습니다. 도서 ID: ' + bookId);
    }
    
    $(".pageInfo a").on("click", function(e){
    	 
        e.preventDefault();
        moveForm.find("input[name='pageNum']").val($(this).attr("href"));
        moveForm.attr("action", "/book/list");
        moveForm.submit();
        
    });
</script>
