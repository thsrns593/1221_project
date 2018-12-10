package spring.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JoinControl {

	@RequestMapping("join.inc")
	public String join() {
		return "join";
	}
}
