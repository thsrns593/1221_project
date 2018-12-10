package spring.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Instructional_PageControl {

	@RequestMapping("instructional_page.inc")
	public String popular_book() {
		return "instructional_page";
	}
}
