package Com;

import java.util.Scanner;

public class Score {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		System.out.println("�г�� ������ �Է� : ");
		int grade = sc.nextInt();
		int score = sc.nextInt();
		
		// 1~3�г��� ���� ���� üũ�ϰ� 4�г��̻��� ���� ���� üũ�Ѵ�.
		String msg = "�߸� �Է��ϼ̽��ϴ�.";
		
		// if(0<= score && score <= 100){
		//	if (60 <= score) {
		//		if (grade < 4) {
					// 1~3�г�, 60�� �̻�
		//			msg = "�հ��Դϴ�.";
		//		} else if (score >= 70) {
					// 4�г�, 70�� �̻�
		//			msg = "�հ��Դϴ�.";
		//		} else {
					// 4�г�, 70�� �̸�
		//			msg = "���հ��Դϴ�.";
		//		}
		//	} else {
		//		msg = "���հ��Դϴ�.";
		//	}
		
		if (1 <= grade && grade <= 3) {
			if (60 <= score) {
				msg = "�հ�";
			} else {
				msg = "���հ�";
			}
		} else if ( 4 <= grade && grade <= 6) {
			if (70 <= score){
				msg = "�հ�";
			} else {
				msg = "���հ�";
			}
		}
		System.out.println(msg);

	}

}
