package Com;

import java.util.Scanner;

public class Scan {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner in = new Scanner(System.in);
		
		byte a = in.nextByte(); 		// byte �� �Է� �� ����
		short b = in.nextShort(); 		// short �� �Է� �� ����
		int c = in.nextInt(); 			// int �� �Է� �� ����
		long d = in.nextLong(); 		// long �� �Է� �� ����
 
		float e = in.nextFloat(); 		// float �� �Է� �� ����
		double f = in.nextDouble(); 	// double �� �Է� �� ����
 
		boolean g = in.nextBoolean(); 	// boolean �� �Է� �� ����
		
		System.out.println(a);
		System.out.println(b);
		System.out.println(c);
		System.out.println(d);
		System.out.println(e);
		System.out.println(f);
		System.out.println(g);

	}

}
