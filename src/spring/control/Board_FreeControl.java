package spring.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Board_FreeControl {

	@RequestMapping("board_free.inc")
	public String board_free() {
		return "board_free";
	}

}
