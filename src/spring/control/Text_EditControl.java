package spring.control;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.NormalDAO;
import mybatis.vo.NormalVO;
import spring.util.FileUploadUtil;

@Controller
public class Text_EditControl {

	private String uploadPath = "/upload";

	@Autowired
	private ServletContext application;

	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private HttpSession session;

	@Autowired
	private NormalDAO n_dao;

	@RequestMapping("text_edit.inc")
	public ModelAndView text_edit(NormalVO vo) {
		ModelAndView mv = new ModelAndView();
		 mv.addObject("vo", n_dao.getText(vo));
		 mv.setViewName("text_edit");
		 
		return mv;
	}
	
	@RequestMapping(value = "text_edit.inc", method=RequestMethod.POST)
	public ModelAndView write(NormalVO vo) throws Exception {


//		MultipartFile mf = vo.getUpload();
//
		ModelAndView mv = new ModelAndView();
//
//		if (mf.getSize() > 0 && mf.getOriginalFilename().trim().length() > 0) {
//
//		
//			String path = application.getRealPath(uploadPath);
//
//			String f_name = mf.getOriginalFilename();
//			
//			vo.setNb_oname(f_name);
//
//			f_name = FileUploadUtil.checkSameFileName(f_name, path);
//
//			mf.transferTo(new File(path, f_name));
//
//			
//			vo.setNb_fname(f_name);
//		} else {
//			vo.setNb_fname("");
//			vo.setNb_oname("");
//		}
		vo.setM_id((String)session.getAttribute("m_id"));
		vo.setNb_ip(request.getRemoteAddr());
				
		boolean chk = n_dao.editText(vo);

		mv.setViewName("redirect:/board_free.inc?nowPage="+vo.getNowPage());
		
		return mv;
	}
}
