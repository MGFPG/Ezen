package stream;

import java.io.FileOutputStream;
import java.io.IOException;

public class FileOutputStreamTest1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		try(FileOutputStream fos = new FileOutputStream("output.txt", true)){
			fos.write(65);  
			fos.write(66);  
			fos.write(67);  
		}catch(IOException e) {
			e.printStackTrace();
		}
		System.out.println("����� �Ϸ�Ǿ����ϴ�.");

	}

}