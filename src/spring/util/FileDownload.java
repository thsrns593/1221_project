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
		//�Ķ���� ���� �ޱ�(dir, filename)
		String dir = request.getParameter("dir");
		String filename =request.getParameter("filename");

		
		String path = getServletContext().getRealPath(dir);
		
		//�ռ� �� upload�� ���� ��ο� ���ϸ��� �����ϸ� 
		//��ü��ΰ� �ȴ�.
		String fullPath = path+System.getProperty("file.separator")+filename;
		
		//��ü��θ� ������ File��ü�� �����Ѵ�.
		File f = new File(fullPath);//�ٿ�ε��� ����!!
		
		//�ٱ��� ��ȭ
		byte[] b = new byte[2048];
		
		//������ �����Ͱ� Streamó���ɶ� ���ڼ� ����
		response.setContentType("application/octet-stream; charset=8859_1");
		
		//�ٿ�ε� ��ȭ���� ó��
		response.setHeader("Content-Disposition","attachment;filename="+URLEncoder.encode(filename,"UTF-8").replaceAll("\\+", "%20"));

		response.setHeader("Content-Transfer-Encoding", "binary");
		
		if(f.isFile()) {
			BufferedInputStream bis = new BufferedInputStream(new FileInputStream(f));
			
			BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
			
			int count = -1;
			try {
				//�о ������
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
