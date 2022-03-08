package Com;

import java.util.Scanner;

public class Question5 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner scan = new Scanner(System.in); 

		System.out.print("당신의 주민번호를 입력하세요. : "); 

		char a = scan.next().charAt(7); 

		String b = "당신은 %s입니다."; 
		String gender = ""; 
		
		switch(a) {
		case '1', '3' :
		    gender = "남자";
			break;
			
		case '2', '4' : 
		    gender = "여자"; 
		    break;
		    
		 default : 
		    b = "입력값이 잘못되었습니다.";
		} 

		System.out.printf(b, gender);


	}

}

// 주민등록번호를 입력받아 남자인지 여자인지 구분하는 프로그램

// 입력예) 당신의 주민번호를 입력하세요. : 123456-3123123

// 출력예) 당신은 여자입니다.

// 참고: 문자열의 한개 케릭터를 찾는 방법
