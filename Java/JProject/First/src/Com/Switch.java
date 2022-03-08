package Com;

import java.util.Scanner;

public class Switch {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		String s1 ="a";
		String s2 = "a";
		
		if (s1==s2)
			System.out.println("same");
		else
			System.out.println("diff");
		
		System.out.println(1);
		
		Scanner scan = new Scanner(System.in);
		System.out.println("문자열을 입력하세요.");
		
		String inputs = scan.next();
		System.out.println(inputs);


	}

}
