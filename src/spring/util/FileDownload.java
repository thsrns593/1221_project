package spring.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FileDownload
 */
@WebServlet("/FileDownload")
public class FileDownload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileDownload() {
        super();
        // TODO Auto-generated constructor stub

    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//파라미터 값들 받기(dir, filename)
		String dir = request.getParameter("dir");
		String filename =request.getParameter("filename");

		
		String path = getServletContext().getRealPath(dir);
		
		//앞서 얻어낸 upload의 절대 경로와 파일명을 연결하면 
		//전체경로가 된다.
		String fullPath = path+System.getProperty("file.separator")+filename;
		
		//전체경로를 가지고 File객체를 생성한다.
		File f = new File(fullPath);//다운로드할 파일!!
		
		//바구니 역화
		byte[] b = new byte[2048];
		
		//전송할 데이터가 Stream처리될때 문자셋 지정
		response.setContentType("application/octet-stream; charset=8859_1");
		
		//다운로드 대화상자 처리
		response.setHeader("Content-Disposition","attachment;filename="+URLEncoder.encode(filename,"UTF-8").replaceAll("\\+", "%20"));

		response.setHeader("Content-Transfer-Encoding", "binary");
		
		if(f.isFile()) {
			BufferedInputStream bis = new BufferedInputStream(new FileInputStream(f));
			
			BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
			
			int count = -1;
			try {
				//읽어서 보내기
				while((count = bis.read(b)) != -1) {
					bos.write(b,0,count);
					bos.flush();
				}
				
			}catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}finally {
				if(bos != null)
					bos.close();
				if(bis != null)
					bis.close();
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
