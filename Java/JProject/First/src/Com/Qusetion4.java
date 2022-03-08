package Com;

import java.util.Scanner;

public class Qusetion4 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner scan = new Scanner(System.in);
		
		System.out.println("현재 월을 입력하세요. :");
		int season = scan.nextInt();
		
		switch(season) {
		case 3: case 4: case 5:
			System.out.println("현재 계절은 봄입니다.");
			break;
		case 6: case 7: case 8:
			System.out.println("현재 계절은 여름입니다.");
			break;
		case 9: case 10: case 11:
			System.out.println("현재 계절은 가을입니다.");
			break;
		case 12: case 1: case 2:
			System.out.println("현재 계절은 겨울입니다.");
		}

	}

}

//현재 월을 입력 받아 입력받은 월에 해당하는 계절을 출력하는 프로그램

//3~5월 "현재 계절을 봄입니다."

//6~8월 "현재 계절은 여름입니다."

//9~11월 "현재 계절은 가을입니다."

//12월~2월 "현재 계절은 겨울입니다."

//입력예) 현재 월을 입력하세요. : 3

//출력예) 현재 계절은 봄입니다.