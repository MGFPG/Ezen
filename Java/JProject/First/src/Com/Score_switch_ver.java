package Com;

import java.util.Scanner;

public class Score_switch_ver {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		System.out.println("학년과 점수를 입력 : ");
		int grade = sc.nextInt();
		int score = sc.nextInt();
		
		String msg = "잘못 입력하셨습니다.";
		
		switch(grade) {
		case 1: case 2: case 3:
			if (60 <= score) {
				msg = "합격";
			} else {
				msg = "불합격";
			}
			if (70 <= score){
				msg = "합격";
			} else {
				msg = "불합격";
			}

		}
	}

}
