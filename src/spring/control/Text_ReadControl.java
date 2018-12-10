package spring.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Text_ReadControl {

	@RequestMapping("text_read.inc")
	public String text_read() {
		return "text_read";
	}
}
