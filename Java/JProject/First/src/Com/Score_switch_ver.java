package Com;

import java.util.Scanner;

public class Score_switch_ver {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		System.out.println("�г�� ������ �Է� : ");
		int grade = sc.nextInt();
		int score = sc.nextInt();
		
		String msg = "�߸� �Է��ϼ̽��ϴ�.";
		
		switch(grade) {
		case 1: case 2: case 3:
			if (60 <= score) {
				msg = "�հ�";
			} else {
				msg = "���հ�";
			}
			if (70 <= score){
				msg = "�հ�";
			} else {
				msg = "���հ�";
			}

		}
	}

}
