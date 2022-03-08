package com.ezen.javaex;

public class StudentUse {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Student student1 = new Student("yearim", 25);
		Student student2 = new Student("dael", 10);
		
		System.out.println(student1.name);
		System.out.println(student2.name);
		
		//System.out.println(student1.age);
		//System.out.println(student2.age);
		
		String name = student2.getName();
		
		student2.name = "elli";
		
		System.out.println(name);
		
		int sum = student1.Add(10,20);
		
		System.out.println(sum);

	}

}
