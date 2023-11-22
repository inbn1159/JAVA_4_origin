package org.bookbook.service;

import java.util.List;

import org.bookbook.domain.BookSearchVO;
import org.bookbook.domain.BookVO;
import org.bookbook.domain.CategoriesVO;
import org.bookbook.model.Criteria;

public interface BookSearchService {
    public List<BookVO> getBookList(BookSearchVO bookSearch);
    public List<CategoriesVO> getCategoriesList(CategoriesVO categories);
    public List<BookVO> getListPaging(Criteria cri);
    /* °Ô½ÃÆÇ ÃÑ °¹¼ö */
    public int getTotal();
}