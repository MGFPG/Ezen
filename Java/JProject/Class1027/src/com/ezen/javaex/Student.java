package com.ezen.javaex;

public class Student {
	
	public String name;
	private int age;
	
	public Student(String n, int a) {  // �ӽ� ����Ҷ� �Լ� ȣ�� �� �����
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
