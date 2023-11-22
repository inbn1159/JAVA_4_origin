package org.bookbook.controller;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.bookbook.domain.BookSearchVO;
import org.bookbook.domain.BookVO;
import org.bookbook.domain.CategoriesVO;
import org.bookbook.model.Criteria;
import org.bookbook.model.PageMakerDTO;
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
@RequestMapping("/book")
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
    public String list(@ModelAttribute("search") BookSearchVO search, 
            Model model, Criteria cri) {
        List<BookVO> result = service.getBookList(search);
        
        model.addAttribute("list", service.getListPaging(cri));
        
        int total = service.getTotal();
        
        PageMakerDTO pagemake = new PageMakerDTO(cri, total);
        
        model.addAttribute("pageMaker", pagemake);  //Å° : ¹ë·ù
        
        return "/book/list";
    }
     
}
