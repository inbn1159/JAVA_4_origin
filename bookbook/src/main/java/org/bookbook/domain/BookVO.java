package org.bookbook.domain;

import lombok.Data;

@Data
public class BookVO {
	private int book_id;
	
	private String title;
	
	private String author;
	
	private String translator;
	
	private String book_intro;
	
	private String publisher;
	
	private String publication_date;
	
	private long isbn;
	
	private String genre;
	
	private String category;
	
	
}
