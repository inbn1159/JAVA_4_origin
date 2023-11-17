package org.bookbook.controller;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.bookbook.domain.BookSearchVO;
import org.bookbook.domain.CategoriesVO;
import org.bookbook.service.BookSearchService;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/")
@Controller
public class BookController {
    @Autowired
    BookSearchService service;

    @ModelAttribute("searchBook")
    public JSONObject searchBookTypes(CategoriesVO vo) {
        List<CategoriesVO> cate = service.getCategoriesList(vo);

        Map<String, String> map = new LinkedHashMap<>();

        for (CategoriesVO category : cate) {
            map.put(category.getGenre(), category.getCategories());
        }
        JSONObject jsonObject = new JSONObject(map);

        return jsonObject;
    }

    @GetMapping("/list")
    public void list(@ModelAttribute("search") BookSearchVO search,
            Model model) {
        log.info("list Page");
        log.info(search);
        model.addAttribute("list", service.getList(search));
        // log.info(model);

    }
}
