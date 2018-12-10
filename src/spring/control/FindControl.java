package spring.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FindControl {

	@RequestMapping("find.inc")
	public String find() {
		return "find";
	}
}
