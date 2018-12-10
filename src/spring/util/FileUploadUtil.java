package spring.util;

import java.io.File;

public class FileUploadUtil {

	public static String checkSameFileName(String fileName, String path) {
		//������ fileName���� Ȯ���ڸ� �A ���ϸ� ��������
		//�׷��� �Ϸ��� ���� "."�� ��ġ�� �˳��� �Ѵ�.
		int period = fileName.lastIndexOf(".");
		
		//���ϸ�� Ȯ���ڸ� �и��Ѵ�.
		String f_name = fileName.substring(0,period);//���ϸ�
		String suffix = fileName.substring(period);//Ȯ����
		
		//��ü ���
		//String saveFileName = path +"/"+fileName;
		String saveFileName = path +System.getProperty("file.separator")+fileName;//�� �ý��ۿ� �°� �����ڸ� ��������!!!
		//���� ���(path + fileName)�� ������
		//java.io.File��ü�� �������� (File��ü�� ������ exists()��
		//����Ͽ� ���翩�� Ȯ���� �ϱ� ����)
		File f = new File(saveFileName);
		
		//���� �̸��� ���� ��� ���ϸ� �ڿ� ���ڸ� �ٿ���� �Ѵ�.
		//�׷��� int�� ������ �ʿ��ϴ�.
		int idx = 1;
		
		while(f.exists()) {
			StringBuffer sb = new StringBuffer();
			sb.append(f_name);
			sb.append(idx++);
			sb.append(suffix);
			
			fileName = sb.toString();//������ �̸��� �ٽ� ���� �̸�����
			
			saveFileName = path +System.getProperty("file.separator")+fileName;
			
			f = new File(saveFileName);
		}//while�� ��
		
		return fileName;// �ߺ����� �ʴ� ���ϸ� ��ȯ!!
	}
}
