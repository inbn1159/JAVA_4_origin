package org.galapagos.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.galapagos.domain.BookSearchVO;
import org.galapagos.domain.BookVO;
import org.galapagos.domain.CategoriesVO;

@Mapper
public interface BookSearchMapper {

	public List<BookVO> read(BookSearchVO bookSearch);
	public List<CategoriesVO> get(CategoriesVO categories);
}
