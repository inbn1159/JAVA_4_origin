package org.bookbook.mapper;

import org.bookbook.domain.BookVO;

public interface BookMapper {
		public BookVO read(int book_id);
		
		public int delete(BookVO book_id);

		public int update(BookVO bookList);

}
