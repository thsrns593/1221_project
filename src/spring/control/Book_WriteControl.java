package spring.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Book_WriteControl {

	@RequestMapping("book_write.inc")
	public String book_write() {
		return "book_write";
	}
}
