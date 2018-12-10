package spring.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Book_ReadControl {

	@RequestMapping("book_read.inc")
	public String book_read() {
		return "book_read";
	}
}
