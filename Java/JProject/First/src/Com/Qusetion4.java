package Com;

import java.util.Scanner;

public class Qusetion4 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner scan = new Scanner(System.in);
		
		System.out.println("���� ���� �Է��ϼ���. :");
		int season = scan.nextInt();
		
		switch(season) {
		case 3: case 4: case 5:
			System.out.println("���� ������ ���Դϴ�.");
			break;
		case 6: case 7: case 8:
			System.out.println("���� ������ �����Դϴ�.");
			break;
		case 9: case 10: case 11:
			System.out.println("���� ������ �����Դϴ�.");
			break;
		case 12: case 1: case 2:
			System.out.println("���� ������ �ܿ��Դϴ�.");
		}

	}

}

//���� ���� �Է� �޾� �Է¹��� ���� �ش��ϴ� ������ ����ϴ� ���α׷�

//3~5�� "���� ������ ���Դϴ�."

//6~8�� "���� ������ �����Դϴ�."

//9~11�� "���� ������ �����Դϴ�."

//12��~2�� "���� ������ �ܿ��Դϴ�."

//�Է¿�) ���� ���� �Է��ϼ���. : 3

//��¿�) ���� ������ ���Դϴ�.