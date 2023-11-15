<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<h1>페이지 타이틀</h1>

<div>
    <form:form id="searchForm" modelAttribute="search" method="get" class="d-flex">
        <div class="input-group">
            <form:input path="keywords" cssClass="form-control rounded-0" />

            <script>
                var searchBookList = ${searchBook};
                var genres = Object.keys(searchBookList);

                for (var i = 0; i < genres.length; i++) {
                    var genre = genres[i];
                    var categories = searchBookList[genre].split(',');

                    var div = document.createElement('div');
                    div.id = genre;
                    div.textContent = genre;

                    div.appendChild(document.createElement('br'));
                    document.body.appendChild(div);

                    for (var j = 0; j < categories.length; j++) {
                        var category = categories[j];

                        var checkbox = document.createElement('input');
                        checkbox.type = 'checkbox';
                        checkbox.name = 'categories'; // 같은 그룹의 체크박스로 묶기 위해 name 설정
                        checkbox.value = category;   // div_id + checkbox 값으로 카테고리의 키 사용

                        var label = document.createElement('label');
                        label.appendChild(document.createTextNode(category));
                        
                        var selectedGenresSet = new Set();

                     // 이벤트 핸들러 추가
                        checkbox.onclick = function (key1, key2) {
                            return function () {
                                // 체크박스가 체크되면 실행할 동작
                                if (this.checked) {
                                    // 이미 선택된 값이 있다면 콤마로 구분하여 추가
                                    if (document.getElementById('selectedCategory').value !== '') {
                                        document.getElementById('selectedCategory').value += ',';
                                    }
                                    document.getElementById('selectedCategory').value += key1;
                                    
                                    if (!selectedGenresSet.has(key2)) {
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
            <button type="submit" class="btn btn-success  rounded-0" onclick="prepareAndSubmitForm()">
                <i class="fa-solid fa-magnifying-glass"></i> 검색
            </button>

            <!-- 추가: hidden input 추가 -->
            <input type="hidden" id="selectedCategory" name="categories" value="" multiple>
            <!-- 추가: 선택된 장르를 저장할 hidden input 추가 -->
            <input type="hidden" id="selectedGenre" name="bookType" value="" multiple>

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

    
<h1>Book List</h1>

<c:if test="${not empty list}">
    <ul>
        <c:forEach var="book" items="${list}">
            <li>${book.title} - ${book.author}</li>
        </c:forEach>
    </ul>
</c:if>
<c:if test="${empty list}">
    <p>No books found.</p>
</c:if>
 