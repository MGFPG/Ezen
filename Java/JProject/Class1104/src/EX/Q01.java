package EX;

import java.util.Scanner;

public class Q01 {
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		System.out.println("�Է��ϼ���: ");
		String cha;
		
		cha = scan.next().toLowerCase();
		switch(cha) {
			case "a": case "o": case "u": case "e": case"i":
				System.out.println("�����Դϴ�.");
				break;
			default:
				System.out.println("�����Դϴ�.");
				break;
		}
	}

}
//���� �� �ܾ �Է¹ް� ������ ������ �����ϴ� �ڵ带 ¥��. if-else�� switch�� ����ؼ� ���� �ۼ��϶�