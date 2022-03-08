package com.ezen;

public class HelloWorld {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		System.out.println("Hello World");
		
		for(int j=0; j<args.length; j++) {
			char obj[]= new char[args[j].length()];
			args[j].getChars(0, args[j].length(), obj, 0);
			StringBuffer sb = new StringBuffer();
			
			for(int i=0; i<obj.length; i++) {
				System.out.println("¹®ÀÚ ["+ obj[i]+": ");
				sb.append(obj[i]);
			}
			
			System.out.println(sb);
			
		}

	}

}

