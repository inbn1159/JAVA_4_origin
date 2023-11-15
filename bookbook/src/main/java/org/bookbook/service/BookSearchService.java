package org.galapagos.service;

import java.util.List;

import org.galapagos.domain.BookSearchVO;
import org.galapagos.domain.BookVO;
import org.galapagos.domain.CategoriesVO;

public interface BookSearchService {
    public List<BookVO> getList(BookSearchVO bookSearch);

    public List<CategoriesVO> getCategoriesList(CategoriesVO categories);
}