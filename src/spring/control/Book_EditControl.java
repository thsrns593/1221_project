package spring.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Book_EditControl {

	@RequestMapping("book_edit.inc")
	public String book_edit() {
		return "book_edit";
	}
}
