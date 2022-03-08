package com.ezen.javaex;

public class Student {
	
	public String name;
	private int age;
	
	public Student(String n, int a) {  // 임시 저장소라 함수 호출 후 사라짐
		this.name = n;
		this.age = a;
	}
	
	public int Add(int a, int b) {
		int s = 0;
		
		s = a + b;
		return s;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
		
	}

	public void setAge(int age) {
		this.age = age;
	}

	public int getAge() {
		return age;
	}

}
