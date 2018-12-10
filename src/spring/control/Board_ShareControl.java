package spring.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Board_ShareControl {

	@RequestMapping("board_share.inc")
	public String board_shard () {
		return "board_share";
	}
}
