package spring.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Text_EditControl {

	@RequestMapping("text_edit.inc")
	public String text_edit() {
		return "text_edit";
	}
}
