package EX;

import java.util.Scanner;

public class Q01 {
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		System.out.println("입력하세요: ");
		String cha;
		
		cha = scan.next().toLowerCase();
		switch(cha) {
			case "a": case "o": case "u": case "e": case"i":
				System.out.println("모음입니다.");
				break;
			default:
				System.out.println("자음입니다.");
				break;
		}
	}

}
//영어 한 단어를 입력받고 자음과 모음을 구분하는 코드를 짜라. if-else와 switch를 사용해서 각각 작성하라