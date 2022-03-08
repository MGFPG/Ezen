package Com;

import java.util.Scanner;

public class Score {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		System.out.println("학년과 점수를 입력 : ");
		int grade = sc.nextInt();
		int score = sc.nextInt();
		
		// 1~3학년을 먼저 성적 체크하고 4학년이상을 다음 성적 체크한다.
		String msg = "잘못 입력하셨습니다.";
		
		// if(0<= score && score <= 100){
		//	if (60 <= score) {
		//		if (grade < 4) {
					// 1~3학년, 60점 이상
		//			msg = "합격입니다.";
		//		} else if (score >= 70) {
					// 4학년, 70점 이상
		//			msg = "합격입니다.";
		//		} else {
					// 4학년, 70점 미만
		//			msg = "불합격입니다.";
		//		}
		//	} else {
		//		msg = "불합격입니다.";
		//	}
		
		if (1 <= grade && grade <= 3) {
			if (60 <= score) {
				msg = "합격";
			} else {
				msg = "불합격";
			}
		} else if ( 4 <= grade && grade <= 6) {
			if (70 <= score){
				msg = "합격";
			} else {
				msg = "불합격";
			}
		}
		System.out.println(msg);

	}

}
