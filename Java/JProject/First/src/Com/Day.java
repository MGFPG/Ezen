package Com;

import java.util.Scanner;

public class Day {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sca = new Scanner(System.in);
		System.out.println("주일 : ");
		int days = sca.nextInt();
		
		switch(days) {
		case 1: case 2: case 3: case 4: case 5:
			System.out.println("주중입니다.");
			break;
		case 6: case 7:
			System.out.println("주말입니다.");

		}
	}
}
	// 일주일 1(일)~ 7(일)
	// 날을 입력 (숫자로)
	// output:
	// 1~5: 월,화,수,목,금요일 주중
	// 6~7: 토,일요일 주말