package org.bookbook.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.bookbook.domain.BookSearchVO;
import org.bookbook.domain.BookVO;
import org.bookbook.domain.CategoriesVO;

@Mapper
public interface BookSearchMapper {

	public List<BookVO> read(BookSearchVO bookSearch);
	public List<CategoriesVO> get(CategoriesVO categories);
}
