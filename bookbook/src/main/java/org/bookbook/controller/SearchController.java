package org.bookbook.controller;

import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

public class SearchController {
	/*
	 * @RequestMapping(value = "/search/result", method = RequestMethod.GET) public
	 * String searchGet(@RequestParam("keyWord") String keyWord, book book_id) {
	 * String deleteKeywordSpace = keyWord.replaceAll("\s", "");
	 * 
	 * if (bookInfo.searchCount(keyWord, deleteKeywordSpace) == 0) { // bookInfo ->
	 * 맞는 class로 수정(책정보 가져오는 역할) book_id.addAttribute("keyWord", keyWord); return
	 * "recommend/searchResultZero"; // recommend -> 추천 페이지 url로 추후 수정 } else {
	 * List<book> book_id = bookInfo.search(keyWord, deleteKeywordSpace); //
	 * bookInfo -> 맞는 class로 수정(책정보 가져오는 역할)
	 * book_id.addAttribute("searchProductList", book_id); return
	 * "recommend/searchResult"; // recommend -> 추천 페이지 url로 추후 수정 } } // 키워드로 검색,
	 * 키워드 입력시 스페이스(띄어쓰기)가 있을 경우 해당 스페이스 삭제 후 검색
	 */	
	@RequestMapping(value = "/recommend/keyword=", method = RequestMethod.GET)
	public String searchGet(@RequestParam("keyWord") String keyWord) {
		String deleteKeywordSpace = keyWord.replaceAll("\s", "");
		
		return "recommend";
	}

}
