package org.bookbook.service;

import java.util.List;

import org.bookbook.domain.BookSearchVO;
import org.bookbook.domain.BookVO;
import org.bookbook.domain.CategoriesVO;

public interface BookSearchService {
    public List<BookVO> getList(BookSearchVO bookSearch);

    public List<CategoriesVO> getCategoriesList(CategoriesVO categories);
}