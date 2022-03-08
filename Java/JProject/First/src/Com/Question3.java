package Com;

import java.util.Scanner;

public class Question3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner scan = new Scanner(System.in);
		
		System.out.println("숫자를 입력하시오.");
		int num = scan.nextInt();
		
		switch(num) {
		case 1: case 2: case 3:
			System.out.println("입력되었습니다.");
			break;
		default:
			System.out.println("숫자를 잘못 입력되었습니다.");
		}

	}

}

// Switch-Case 예제(Ex10.java) 1~3까지의 숫자를 입력받아 몇인지 보여주는 프로그램을 작성하세요
// 그외 숫자는 잘못 입력 되었습니다. 라고 출력하세요.