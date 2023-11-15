package org.galapagos.domain;

import java.sql.Date;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;


@Data
@Getter
@Setter
public class BookVO {
	private int book_id;
	private String title;
	private String author;
	private String book_intro;
	private String publisher;
	private Date publication_date;
	private Long isbn;
	private String genre;
}
