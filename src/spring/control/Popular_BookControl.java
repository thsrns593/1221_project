package spring.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Popular_BookControl {

	@RequestMapping("popular_book.inc")
	public String popular_book() {
		return "popular_book";
	}
}
