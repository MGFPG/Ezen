package Com;

import java.util.Scanner;

public class Day {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sca = new Scanner(System.in);
		System.out.println("���� : ");
		int days = sca.nextInt();
		
		switch(days) {
		case 1: case 2: case 3: case 4: case 5:
			System.out.println("�����Դϴ�.");
			break;
		case 6: case 7:
			System.out.println("�ָ��Դϴ�.");

		}
	}
}
	// ������ 1(��)~ 7(��)
	// ���� �Է� (���ڷ�)
	// output:
	// 1~5: ��,ȭ,��,��,�ݿ��� ����
	// 6~7: ��,�Ͽ��� �ָ�