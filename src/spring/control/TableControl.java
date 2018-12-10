package spring.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TableControl {

	@RequestMapping("table.inc")
	public String table() {
		return "table";
	}
}
