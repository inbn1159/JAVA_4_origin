package org.galapagos.service;

import java.util.List;

import org.galapagos.domain.BookSearchVO;
import org.galapagos.domain.BookVO;
import org.galapagos.domain.CategoriesVO;
import org.galapagos.mapper.BookSearchMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class BookSearchServiceImpl implements BookSearchService {

    @Autowired
    BookSearchMapper bookSearchMapper;

    @Override
    public List<BookVO> getList(BookSearchVO bookSearch) {
        log.info(bookSearch);
        return bookSearchMapper.read(bookSearch);
    }

    @Override
    public List<CategoriesVO> getCategoriesList(CategoriesVO categories) {
        return bookSearchMapper.get(categories);
    }
}
