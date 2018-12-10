package spring.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SearchBookControl {

	@RequestMapping("searchbook.inc")
	public String searchbook() {
		return "searchbook";
	}
}
