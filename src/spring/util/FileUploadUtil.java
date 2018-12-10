package spring.util;

import java.io.File;

public class FileUploadUtil {

	public static String checkSameFileName(String fileName, String path) {
		//인자인 fileName에서 확장자를 뺸 파일명 가려내자
		//그렇게 하려면 먼저 "."의 위치를 알내야 한다.
		int period = fileName.lastIndexOf(".");
		
		//파일명과 확장자를 분리한다.
		String f_name = fileName.substring(0,period);//파일명
		String suffix = fileName.substring(period);//확장자
		
		//전체 경로
		//String saveFileName = path +"/"+fileName;
		String saveFileName = path +System.getProperty("file.separator")+fileName;//각 시스템에 맞게 구분자를 가져오기!!!
		//위의 경로(path + fileName)를 가지고
		//java.io.File객체를 생성하자 (File객체가 가지는 exists()를
		//사용하여 존재여부 확인을 하기 위해)
		File f = new File(saveFileName);
		
		//같은 이름이 있을 경우 파일명 뒤에 숫자를 붙여줘야 한다.
		//그러면 int형 변수가 필요하다.
		int idx = 1;
		
		while(f.exists()) {
			StringBuffer sb = new StringBuffer();
			sb.append(f_name);
			sb.append(idx++);
			sb.append(suffix);
			
			fileName = sb.toString();//변경한 이름을 다시 파일 이름으로
			
			saveFileName = path +System.getProperty("file.separator")+fileName;
			
			f = new File(saveFileName);
		}//while의 끝
		
		return fileName;// 중복되지 않는 파일명 반환!!
	}
}
