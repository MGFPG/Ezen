package Com;

import java.util.Scanner;

public class Question {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scan = new Scanner(System.in);
		
		System.out.println("문자열을 입력하시오.");
		int d = scan.nextInt();
		
		switch(d) {
		
		case 1: case 3: case 5: case 7: case 8: case 10: case 12:
			System.out.println("31일까지");
			break;
		case 4: case 6: case 9: case 11: 
			System.out.println("30일까지");
			break;
		case 2: 
			System.out.println("28일까지");
			break;
		}
	}
}


//월을 입력받아 해당 월의 일수를 보여주는 프로그램을 작성하시오 

// 1, 3, 5, 7, 8, 10, 12월 : 31일까지

// 4, 6, 9, 11 월 : 30일까지 

// 2 월 : 28일까지
