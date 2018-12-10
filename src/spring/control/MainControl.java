package spring.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainControl {

	@RequestMapping("main.inc")
	public String main() {
		System.out.println("메인페이지 이동");
		return "main";
	}
}
