package Com;

import java.util.Scanner;

public class Question5 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner scan = new Scanner(System.in); 

		System.out.print("����� �ֹι�ȣ�� �Է��ϼ���. : "); 

		char a = scan.next().charAt(7); 

		String b = "����� %s�Դϴ�."; 
		String gender = ""; 
		
		switch(a) {
		case '1', '3' :
		    gender = "����";
			break;
			
		case '2', '4' : 
		    gender = "����"; 
		    break;
		    
		 default : 
		    b = "�Է°��� �߸��Ǿ����ϴ�.";
		} 

		System.out.printf(b, gender);


	}

}

// �ֹε�Ϲ�ȣ�� �Է¹޾� �������� �������� �����ϴ� ���α׷�

// �Է¿�) ����� �ֹι�ȣ�� �Է��ϼ���. : 123456-3123123

// ��¿�) ����� �����Դϴ�.

// ����: ���ڿ��� �Ѱ� �ɸ��͸� ã�� ���
