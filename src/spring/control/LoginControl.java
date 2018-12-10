package spring.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginControl {

	@RequestMapping("login.inc")
	public String login() {
		return "login";
	}
}
