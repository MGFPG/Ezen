package Com;

import java.util.Scanner;

public class Question3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner scan = new Scanner(System.in);
		
		System.out.println("���ڸ� �Է��Ͻÿ�.");
		int num = scan.nextInt();
		
		switch(num) {
		case 1: case 2: case 3:
			System.out.println("�ԷµǾ����ϴ�.");
			break;
		default:
			System.out.println("���ڸ� �߸� �ԷµǾ����ϴ�.");
		}

	}

}

// Switch-Case ����(Ex10.java) 1~3������ ���ڸ� �Է¹޾� ������ �����ִ� ���α׷��� �ۼ��ϼ���
// �׿� ���ڴ� �߸� �Է� �Ǿ����ϴ�. ��� ����ϼ���.