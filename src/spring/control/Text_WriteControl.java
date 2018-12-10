package spring.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Text_WriteControl {

	@RequestMapping("text_write.inc")
	public String text_write() {
		return "text_write";
	}
}
