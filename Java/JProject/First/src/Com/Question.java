package Com;

import java.util.Scanner;

public class Question {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scan = new Scanner(System.in);
		
		System.out.println("���ڿ��� �Է��Ͻÿ�.");
		int d = scan.nextInt();
		
		switch(d) {
		
		case 1: case 3: case 5: case 7: case 8: case 10: case 12:
			System.out.println("31�ϱ���");
			break;
		case 4: case 6: case 9: case 11: 
			System.out.println("30�ϱ���");
			break;
		case 2: 
			System.out.println("28�ϱ���");
			break;
		}
	}
}


//���� �Է¹޾� �ش� ���� �ϼ��� �����ִ� ���α׷��� �ۼ��Ͻÿ� 

// 1, 3, 5, 7, 8, 10, 12�� : 31�ϱ���

// 4, 6, 9, 11 �� : 30�ϱ��� 

// 2 �� : 28�ϱ���
